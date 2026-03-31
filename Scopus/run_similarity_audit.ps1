$ErrorActionPreference = 'Stop'

$files = Get-ChildItem -Path "Scopus" -Filter "S*.csv" -File | Sort-Object Name
$all = foreach ($f in $files) { Import-Csv -Path $f.FullName }

# Deduplicate by EID, then DOI, then normalized title
$seen = @{}
$unique = New-Object System.Collections.Generic.List[object]
foreach ($r in $all) {
    $eid = ([string]$r.EID).Trim()
    $doi = ([string]$r.DOI).Trim().ToLower()
    $titleKey = ([string]$r.Title).Trim().ToLower()

    if (-not [string]::IsNullOrWhiteSpace($eid)) {
        $key = "EID|$eid"
    }
    elseif (-not [string]::IsNullOrWhiteSpace($doi)) {
        $key = "DOI|$doi"
    }
    else {
        $key = "TITLE|$titleKey"
    }

    if (-not $seen.ContainsKey($key)) {
        $seen[$key] = $true
        $unique.Add($r)
    }
}

function Has-Any {
    param(
        [string]$text,
        [string[]]$patterns
    )
    foreach ($p in $patterns) {
        if ($text -match $p) { return $true }
    }
    return $false
}

$results = foreach ($r in $unique) {
    $title = [string]$r.Title
    $abstract = [string]$r.Abstract
    $kw1 = [string]$r.'Author Keywords'
    $kw2 = [string]$r.'Index Keywords'
    $src = [string]$r.'Source title'
    $text = ($title + ' ' + $abstract + ' ' + $kw1 + ' ' + $kw2 + ' ' + $src).ToLower()

    $isUAV = Has-Any $text @(
        '\buav\b',
        '\bdrone\b',
        'quadrotor',
        'multirotor',
        'unmanned aerial vehicle',
        'uncrewed aerial vehicle'
    )

    $hasTemporal = Has-Any $text @(
        'temporal',
        'time series',
        'sequential',
        'sequence modeling',
        'long[- ]term',
        'short[- ]term',
        'prediction horizon',
        'look[- ]back',
        'chronological',
        'time[- ]based split',
        'online prediction'
    )

    $hasManeuver = Has-Any $text @(
        'maneuver',
        'manoeuver',
        'aggressive',
        'flight mode',
        'spiral',
        'turn rate',
        'dynamic target',
        'trajectory tracking',
        'tracking control'
    )

    $hasUncertainty = Has-Any $text @(
        'uncertainty',
        'confidence interval',
        'confidence bound',
        'prediction interval',
        'probabilistic',
        'bayesian',
        'gaussian process',
        'epistemic',
        'aleatoric',
        'conformal',
        'disturbance',
        'robust'
    )

    $hasEval = Has-Any $text @(
        'benchmark',
        'evaluation',
        'generalization',
        'cross[- ]dataset',
        'cross[- ]scenario',
        'ablation',
        'comparative',
        'test set',
        'temporal split',
        'robustness'
    )

    $hasUnityVR = Has-Any $text @(
        '\bunity\b',
        'virtual reality',
        '\bvr\b',
        'human[- ]in[- ]the[- ]loop',
        'digital twin',
        'gazebo',
        'simulator',
        'simulation environment',
        'immersive'
    )

    $phase1Strict = $isUAV -and $hasTemporal -and $hasManeuver -and $hasUncertainty -and $hasEval
    $fullPhase12 = $phase1Strict -and $hasUnityVR

    $citedByNum = 0
    if (-not [string]::IsNullOrWhiteSpace([string]$r.'Cited by')) {
        [void][int]::TryParse(([string]$r.'Cited by'), [ref]$citedByNum)
    }

    $score = 0
    if ($isUAV) { $score += 2 }
    if ($hasTemporal) { $score += 2 }
    if ($hasManeuver) { $score += 2 }
    if ($hasUncertainty) { $score += 2 }
    if ($hasEval) { $score += 1 }
    if ($hasUnityVR) { $score += 3 }
    if ($phase1Strict) { $score += 3 }
    if ($fullPhase12) { $score += 5 }

    [PSCustomObject]@{
        EID = $r.EID
        DOI = $r.DOI
        Year = $r.Year
        DocumentType = $r.'Document Type'
        CitedBy = $r.'Cited by'
        CitedByNum = $citedByNum
        SourceTitle = $r.'Source title'
        Title = $title
        Phase1_Strict = if ($phase1Strict) { 'Yes' } else { 'No' }
        Full_Phase1_2 = if ($fullPhase12) { 'Yes' } else { 'No' }
        Has_UAV = if ($isUAV) { 'Yes' } else { 'No' }
        Has_Temporal = if ($hasTemporal) { 'Yes' } else { 'No' }
        Has_Maneuver = if ($hasManeuver) { 'Yes' } else { 'No' }
        Has_Uncertainty = if ($hasUncertainty) { 'Yes' } else { 'No' }
        Has_Eval = if ($hasEval) { 'Yes' } else { 'No' }
        Has_Unity_VR_HITL = if ($hasUnityVR) { 'Yes' } else { 'No' }
        SimilarityScore = $score
        Abstract = $abstract
    }
}

$resultsPath = "Scopus/Similarity_Audit_All.csv"
$summaryPath = "Scopus/Similarity_Audit_Summary.md"

$sorted = $results | Sort-Object -Property @(
    @{ Expression = 'SimilarityScore'; Descending = $true },
    @{ Expression = 'CitedByNum'; Descending = $true }
)
$sorted | Export-Csv -Path $resultsPath -NoTypeInformation

$total = $unique.Count
$uav = @($results | Where-Object { $_.Has_UAV -eq 'Yes' }).Count
$p1 = @($results | Where-Object { $_.Phase1_Strict -eq 'Yes' }).Count
$p12 = @($results | Where-Object { $_.Full_Phase1_2 -eq 'Yes' }).Count

$topP1 = $sorted | Where-Object { $_.Phase1_Strict -eq 'Yes' } | Select-Object -First 20
$topFull = $sorted | Where-Object { $_.Full_Phase1_2 -eq 'Yes' } | Select-Object -First 20

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('# Similarity Audit (All Scopus Results)')
$lines.Add('')
$lines.Add("- Total raw records (S1-S7): $(@($all).Count)")
$lines.Add("- Total unique records (deduplicated): $total")
$lines.Add("- UAV-related records: $uav")
$lines.Add("- Strict Phase 1-style matches (Temporal + Maneuver + Uncertainty + Evaluation): $p1")
$lines.Add("- Full Phase 1+2 style matches (Strict Phase 1 + Unity/VR/HITL): $p12")
$lines.Add('')
$lines.Add('## Top Strict Phase 1-Style Matches')
$lines.Add('')
if (@($topP1).Count -eq 0) {
    $lines.Add('- None')
}
else {
    foreach ($t in $topP1) {
        $lines.Add("- [$($t.SimilarityScore)] $($t.Year) | $($t.SourceTitle) | $($t.Title)")
    }
}
$lines.Add('')
$lines.Add('## Top Full Phase 1+2-Style Matches (with Unity/VR/HITL)')
$lines.Add('')
if (@($topFull).Count -eq 0) {
    $lines.Add('- None')
}
else {
    foreach ($t in $topFull) {
        $lines.Add("- [$($t.SimilarityScore)] $($t.Year) | $($t.SourceTitle) | $($t.Title)")
    }
}

$lines | Set-Content -Path $summaryPath -Encoding UTF8

Write-Output "TOTAL_RAW=$(@($all).Count)"
Write-Output "TOTAL_UNIQUE=$total"
Write-Output "UAV_RELATED=$uav"
Write-Output "PHASE1_STRICT_MATCHES=$p1"
Write-Output "FULL_PHASE1_2_MATCHES=$p12"
Write-Output "WROTE=$resultsPath"
Write-Output "WROTE=$summaryPath"
