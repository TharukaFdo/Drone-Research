# SLR Search Strings (Drone Dynamics + Unity/VR)

Date: March 30, 2026
Aligned proposal: [Research Proposal - Drone Dynamics VR.md](Research%20Proposal%20-%20Drone%20Dynamics%20VR.md)

## 1. How To Use This File
- Start with the broad string (Section 3).
- Then run targeted strings (Section 4) for each theme.
- Use database-specific syntax (Section 5).
- Apply filters in Section 6.

## 2. Keyword Blocks

### Block A: UAV Domain
("UAV" OR "unmanned aerial vehicle" OR "unmanned aerial vehicles" OR drone OR drones OR quadrotor OR quadcopter OR multicopter)

### Block B: Dynamics / Prediction
("flight dynamics" OR "drone dynamics" OR trajectory OR "state prediction" OR "motion model" OR "system identification")

### Block C: AI / ML Methods
("machine learning" OR "deep learning" OR "neural network" OR "neural networks" OR LSTM OR Transformer OR "reinforcement learning")

### Block D: Robustness Evaluation (Phase 1)
("temporal split" OR "time-based split" OR "chronological split" OR maneuver OR manoeuvre OR "cross-maneuver" OR "cross manoeuvre" OR generalization OR robustness)

### Block E: Uncertainty (Phase 1)
(uncertainty OR "prediction interval" OR "confidence interval" OR conformal OR calibration OR "uncertainty quantification" OR "probabilistic prediction")

### Block F: Simulation / Immersion (Phase 2)
(simulation OR simulator OR Unity OR "Unity 3D" OR "virtual reality" OR VR OR "human-in-the-loop" OR teleoperation)

## 3. Master Broad Query
Use first to map the field.

(("UAV" OR "unmanned aerial vehicle" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "drone dynamics" OR trajectory OR "state prediction" OR "system identification")
AND ("machine learning" OR "deep learning" OR "neural network" OR LSTM OR Transformer)
AND (simulation OR Unity OR "virtual reality" OR VR))

## 4. Targeted Search Strings By Theme

### S1. Core AI Drone Dynamics (Phase 1 foundation)
(("UAV" OR drone OR quadrotor)
AND ("flight dynamics" OR "drone dynamics" OR "state prediction" OR trajectory)
AND ("machine learning" OR "deep learning" OR "neural network" OR LSTM OR Transformer))

### S2. Temporal Generalization / Time Split
(("UAV" OR drone OR quadrotor)
AND ("flight dynamics" OR trajectory OR "state prediction")
AND ("machine learning" OR "deep learning")
AND ("temporal split" OR "time-based split" OR "chronological split" OR "out-of-time" OR generalization))

### S3. Maneuver-Wise Robustness
(("UAV" OR drone OR quadrotor)
AND (maneuver OR manoeuvre OR "flight pattern" OR "trajectory pattern")
AND ("machine learning" OR "deep learning" OR "state prediction")
AND (generalization OR robustness OR "cross-maneuver" OR "cross manoeuvre"))

### S4. Uncertainty For Regression Models
(("UAV" OR drone OR quadrotor)
AND ("state prediction" OR trajectory OR "flight dynamics")
AND (uncertainty OR "prediction interval" OR conformal OR calibration OR "uncertainty quantification"))

### S5. Unity-Based UAV Simulation
(("UAV" OR drone OR quadrotor)
AND (Unity OR "Unity 3D")
AND (simulation OR simulator OR teleoperation OR visualization))

### S6. VR Human-In-The-Loop
(("UAV" OR drone)
AND ("virtual reality" OR VR)
AND ("human-in-the-loop" OR training OR interaction)
AND (simulation OR teleoperation))

### S7. Review Papers (for literature baseline)
(("UAV" OR drone OR quadrotor)
AND (simulation OR "flight dynamics")
AND ("systematic review" OR "literature review" OR survey))

## 5. Database-Specific Versions

### 5.1 IEEE Xplore (Metadata)
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"LSTM" OR "All Metadata":"Transformer"))

### 5.2 Scopus (TITLE-ABS-KEY)
TITLE-ABS-KEY(("UAV" OR "unmanned aerial vehicle" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "drone dynamics" OR trajectory OR "state prediction" OR "system identification")
AND ("machine learning" OR "deep learning" OR "neural network" OR LSTM OR Transformer)
AND (simulation OR Unity OR "virtual reality" OR VR OR "human-in-the-loop"))

### 5.3 ScienceDirect (Title, Abstract, Keywords)
("UAV" OR drone OR quadrotor)
AND ("flight dynamics" OR trajectory OR "state prediction")
AND ("machine learning" OR "deep learning" OR LSTM OR Transformer)
AND (simulation OR Unity OR "virtual reality")

### 5.4 ACM Digital Library
[[Abstract:(UAV OR drone OR quadrotor)] AND
 [Abstract:("flight dynamics" OR trajectory OR "state prediction")] AND
 [Abstract:("machine learning" OR "deep learning" OR LSTM OR Transformer)] AND
 [Abstract:(simulation OR Unity OR "virtual reality")]]

### 5.5 Google Scholar (compact)
"UAV" "flight dynamics" "machine learning" trajectory simulation Unity OR "virtual reality"

## 6. Recommended Filters
- Year range: 2015-2026 (tighten to 2020-2026 for rapid update scan).
- Document type: journal articles, conference papers, high-quality surveys.
- Language: English.
- Exclude patents, short abstracts only, non-technical news posts.

## 7. Suggested Inclusion / Exclusion Rules

### Include if
- Study contains UAV/drone simulation or dynamics modeling.
- Uses ML/deep learning or compares with physics-based approaches.
- Reports measurable evaluation (accuracy/error/generalization/latency/calibration).
- Relevant to temporal robustness, maneuver robustness, uncertainty, or Unity/VR integration.

### Exclude if
- Not about UAV/drone motion/dynamics (for example only detection/classification unrelated to dynamics).
- No empirical method details or no evaluation results.
- Pure product marketing content without technical validation.

## 8. Query-to-RQ Mapping
- RQ1 (benchmark rigor): S1 + S2 + S3 + S4
- RQ2 (model family trade-offs): S1 + S7
- RQ3 (Unity deployment): S5
- RQ4 (VR human-in-the-loop): S6

## 9. Search Log Template (copy and reuse)
- Database:
- Query ID (S1-S7):
- Full query used:
- Filters applied:
- Date searched:
- Hits returned:
- After title/abstract screening:
- After full-text screening:
- Notes:
