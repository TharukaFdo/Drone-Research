# SLR Search Strings - Scopus Only

Date: March 30, 2026
Aligned proposal: [Research Proposal - Drone Dynamics VR.md](Research%20Proposal%20-%20Drone%20Dynamics%20VR.md)

## 1. Scopus Field Tag
Use TITLE-ABS-KEY for all queries.

## 2. Master Broad Query
TITLE-ABS-KEY(("UAV" OR "unmanned aerial vehicle" OR "unmanned aerial vehicles" OR drone OR drones OR quadrotor OR quadcopter OR multicopter)
AND ("flight dynamics" OR "drone dynamics" OR trajectory OR "state prediction" OR "motion model" OR "system identification")
AND ("machine learning" OR "deep learning" OR "neural network" OR "neural networks" OR LSTM OR Transformer OR "reinforcement learning")
AND (simulation OR simulator OR Unity OR "Unity 3D" OR "virtual reality" OR VR OR "human-in-the-loop" OR teleoperation))

## 3. Targeted Scopus Queries

### S1. Core AI Drone Dynamics
TITLE-ABS-KEY(("UAV" OR "unmanned aerial vehicle" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "drone dynamics" OR "state prediction" OR trajectory)
AND ("machine learning" OR "deep learning" OR "neural network" OR LSTM OR Transformer))

### S2. Temporal Generalization / Time Split
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "state prediction" OR trajectory)
AND ("machine learning" OR "deep learning")
AND ("temporal split" OR "time-based split" OR "chronological split" OR "out-of-time" OR generalization OR robustness))

### S3. Maneuver-wise Robustness
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND (maneuver OR manoeuvre OR "flight pattern" OR "trajectory pattern" OR "cross-maneuver" OR "cross manoeuvre")
AND ("machine learning" OR "deep learning" OR "state prediction")
AND (generalization OR robustness))

### S4. Uncertainty for Regression
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "state prediction" OR trajectory)
AND (uncertainty OR "prediction interval" OR "confidence interval" OR conformal OR calibration OR "uncertainty quantification" OR "probabilistic prediction"))

### S5. Unity-Based UAV Simulation
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND (Unity OR "Unity 3D")
AND (simulation OR simulator OR teleoperation OR visualization))

### S6. VR Human-in-the-Loop
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND ("virtual reality" OR VR)
AND ("human-in-the-loop" OR training OR interaction)
AND (simulation OR simulator OR teleoperation))

### S7. Review Papers / Survey Baseline
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor OR quadcopter)
AND (simulation OR "flight dynamics")
AND ("systematic review" OR "literature review" OR survey))

## 4. Optional Narrowing Terms
Add these with AND TITLE-ABS-KEY(...)
- "real-time"
- "multi-output"
- "trajectory prediction"
- "state estimation"

## 5. Recommended Scopus Filters
- Year: 2015-2026 (or 2020-2026 for recent focus)
- Document type: Article, Conference Paper, Review
- Language: English
- Subject areas: Engineering, Computer Science, Decision Sciences, Mathematics

## 6. Suggested Exclusion Pattern (Optional)
Append this if irrelevant retrieval is high:
AND NOT TITLE-ABS-KEY(("object detection" AND image) OR "sentiment analysis" OR "medical imaging")

## 7. Novelty Search Queries (Scopus)
Use these to test whether your exact proposed combination already exists.

### N1. Full novelty combination (strict)
TITLE-ABS-KEY(("UAV" OR "unmanned aerial vehicle" OR drone OR quadrotor OR quadcopter)
AND ("flight dynamics" OR "drone dynamics" OR "state prediction" OR trajectory)
AND ("machine learning" OR "deep learning" OR LSTM OR Transformer)
AND ("temporal split" OR "time-based split" OR "chronological split")
AND (maneuver OR manoeuvre OR "cross-maneuver" OR "cross manoeuvre")
AND (uncertainty OR conformal OR "prediction interval" OR calibration)
AND (Unity OR "Unity 3D" OR "virtual reality" OR VR OR "human-in-the-loop"))

### N2. Phase 1 novelty (benchmark rigor only)
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor)
AND ("flight dynamics" OR "state prediction" OR trajectory)
AND ("machine learning" OR "deep learning" OR LSTM OR Transformer)
AND ("temporal split" OR "time-based split" OR "chronological split")
AND (maneuver OR manoeuvre OR "cross-maneuver" OR "cross manoeuvre")
AND (uncertainty OR conformal OR "prediction interval" OR calibration)
AND NOT (Unity OR "Unity 3D" OR "virtual reality" OR VR))

### N3. Phase 2 novelty (validated model to immersion)
TITLE-ABS-KEY(("UAV" OR drone OR quadrotor)
AND (Unity OR "Unity 3D" OR "virtual reality" OR VR OR "human-in-the-loop")
AND ("flight dynamics" OR trajectory OR "state prediction")
AND ("machine learning" OR "deep learning")
AND (validation OR benchmark OR "generalization"))

## 8. Search Log Template
- Query ID:
- Query text:
- Filters:
- Date searched:
- Hits:
- Included after title-abstract screen:
- Included after full text:
- Notes:
