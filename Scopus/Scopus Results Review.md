# Scopus Results Review (S1-S7)

Date: March 31, 2026
Based on files in [Scopus/](Scopus/)

## 1. File-Level Volume

| Query File | Rows |
|---|---:|
| S1.csv | 3069 |
| S2.csv | 237 |
| S3.csv | 39 |
| S4.csv | 1599 |
| S5.csv | 150 |
| S6.csv | 259 |
| S7.csv | 977 |
| Total rows | 6330 |

## 2. Deduplication Snapshot
- Total rows across S1-S7: 6330
- Unique EIDs across S1-S7: 5692
- Duplicate rows by EID: 638

Key overlaps:
- S1-S2: 221
- S1-S4: 321
- S2-S3: 16
- S5-S6: 24
- S6-S7: 19

Interpretation:
- S1 and S4 are broad and overlap strongly with other sets.
- S3 is highly specific and small.
- S5 and S6 are useful for Phase 2 (Unity/VR) retrieval.

## 3. Relevance Signal (Title + Keywords quick check)

| Query | Domain match | Theme-heavy signal |
|---|---:|---|
| S1 | 84.9% | Very broad core ML dynamics pool |
| S2 | 89.5% | Temporal terms in 9.7% |
| S3 | 92.3% | Maneuver terms in 23.1% (best targeted) |
| S4 | 87.0% | Uncertainty terms in 50.5% (good but broad) |
| S5 | 78.0% | Unity/VR/simulation terms in 62.0% |
| S6 | 66.8% | Unity/VR/simulation terms in 84.6% |
| S7 | 74.5% | Review/survey pool, broad by design |

## 4. Workload After Practical Filters
Applied: Year >= 2020 and document type in {Article, Conference paper, Review}

| Query | Total | After filter |
|---|---:|---:|
| S1 | 3069 | 2836 |
| S2 | 237 | 222 |
| S3 | 39 | 33 |
| S4 | 1599 | 1532 |
| S5 | 150 | 119 |
| S6 | 259 | 154 |
| S7 | 977 | 643 |

Interpretation:
- Standard year/type filters do not reduce S1 and S4 enough.
- Additional narrowing is needed for S1/S4/S7.

## 5. Recommended Screening Order
1. S3 (small + highly targeted for maneuver robustness)
2. S2 (temporal generalization)
3. S6 and S5 (Phase 2 Unity/VR and human-in-the-loop)
4. S4 (uncertainty-focused, but screen with strict inclusion)
5. S7 (reviews only, for background synthesis)
6. S1 last (foundational pool, very broad)

## 6. If Results Are Too Many
Use stricter narrowing per file:
- For S1: add "temporal split" OR "maneuver" OR "uncertainty" as mandatory.
- For S4: require both uncertainty term and UAV dynamics term in title/keywords.
- For S7: add "systematic review" in title plus UAV/drone dynamics.

## 7. Suggested Next Action
- Run novelty queries N1/N2/N3 in Scopus and record hit counts.
- Build one master deduplicated screening sheet (EID as key) before title/abstract screening.

## 8. Final Shortlist Output (Generated)
- Scope-aligned strict candidate pool size: 93 papers.
- Final shortlist generated: 30 papers.

Output files:
- [Top30_Directly_Related_Final.md](Scopus/Top30_Directly_Related_Final.md)
- [Top30_Directly_Related_Final.csv](Scopus/Top30_Directly_Related_Final.csv)

Selection logic used:
- Required UAV/drone domain in title/keywords.
- Required dynamics/prediction/control focus and ML method signal.
- Excluded communication/network-security and unrelated domains.
- Ranked by theme match (temporal, maneuver, uncertainty, Unity/VR), query overlap, year, and citations.

Note:
- This shortlist is ready for manual title/abstract verification before full-text screening.
