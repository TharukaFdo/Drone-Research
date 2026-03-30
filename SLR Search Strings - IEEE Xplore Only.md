# SLR Search Strings - IEEE Xplore Only

Date: March 30, 2026
Aligned proposal: [Research Proposal - Drone Dynamics VR.md](Research%20Proposal%20-%20Drone%20Dynamics%20VR.md)

## 1. IEEE Field
Use All Metadata in IEEE Xplore advanced search.

## 2. Master Broad Query
(("All Metadata":"UAV" OR "All Metadata":"unmanned aerial vehicle" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter" OR "All Metadata":"multicopter")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"drone dynamics" OR "All Metadata":"trajectory" OR "All Metadata":"state prediction" OR "All Metadata":"motion model" OR "All Metadata":"system identification")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"neural network" OR "All Metadata":"LSTM" OR "All Metadata":"Transformer" OR "All Metadata":"reinforcement learning")
AND ("All Metadata":"simulation" OR "All Metadata":"simulator" OR "All Metadata":"Unity" OR "All Metadata":"Unity 3D" OR "All Metadata":"virtual reality" OR "All Metadata":"VR" OR "All Metadata":"human-in-the-loop" OR "All Metadata":"teleoperation"))

## 3. Targeted IEEE Xplore Queries

### I1. Core AI Drone Dynamics
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"drone dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"neural network" OR "All Metadata":"LSTM" OR "All Metadata":"Transformer"))

### I2. Temporal Generalization / Time Split
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning")
AND ("All Metadata":"temporal split" OR "All Metadata":"time-based split" OR "All Metadata":"chronological split" OR "All Metadata":"out-of-time" OR "All Metadata":"generalization" OR "All Metadata":"robustness"))

### I3. Maneuver-wise Robustness
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"maneuver" OR "All Metadata":"manoeuvre" OR "All Metadata":"flight pattern" OR "All Metadata":"trajectory pattern" OR "All Metadata":"cross-maneuver" OR "All Metadata":"cross manoeuvre")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"state prediction")
AND ("All Metadata":"generalization" OR "All Metadata":"robustness"))

### I4. Uncertainty for Regression
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"uncertainty" OR "All Metadata":"prediction interval" OR "All Metadata":"confidence interval" OR "All Metadata":"conformal" OR "All Metadata":"calibration" OR "All Metadata":"uncertainty quantification" OR "All Metadata":"probabilistic prediction"))

### I5. Unity-Based UAV Simulation
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"Unity" OR "All Metadata":"Unity 3D")
AND ("All Metadata":"simulation" OR "All Metadata":"simulator" OR "All Metadata":"teleoperation" OR "All Metadata":"visualization"))

### I6. VR Human-in-the-Loop
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"virtual reality" OR "All Metadata":"VR")
AND ("All Metadata":"human-in-the-loop" OR "All Metadata":"training" OR "All Metadata":"interaction")
AND ("All Metadata":"simulation" OR "All Metadata":"simulator" OR "All Metadata":"teleoperation"))

### I7. Review / Survey Baseline
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"simulation" OR "All Metadata":"flight dynamics")
AND ("All Metadata":"systematic review" OR "All Metadata":"literature review" OR "All Metadata":"survey"))

## 4. Optional Narrowing Terms
Append with AND:
- "All Metadata":"real-time"
- "All Metadata":"multi-output"
- "All Metadata":"trajectory prediction"
- "All Metadata":"state estimation"

## 5. Recommended IEEE Filters
- Content type: Journals, Conferences, Early Access
- Years: 2015-2026 (or 2020-2026 for recent focus)
- Language: English

## 6. Optional Exclusion Pattern
If irrelevant retrieval is high, append:
AND NOT ("All Metadata":"object detection" OR "All Metadata":"medical imaging" OR "All Metadata":"sentiment analysis")

## 7. Novelty Search Queries (IEEE Xplore)
Use these to test whether your exact proposed combination already exists.

### N1. Full novelty combination (strict)
(("All Metadata":"UAV" OR "All Metadata":"unmanned aerial vehicle" OR "All Metadata":"drone" OR "All Metadata":"quadrotor" OR "All Metadata":"quadcopter")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"drone dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"LSTM" OR "All Metadata":"Transformer")
AND ("All Metadata":"temporal split" OR "All Metadata":"time-based split" OR "All Metadata":"chronological split")
AND ("All Metadata":"maneuver" OR "All Metadata":"manoeuvre" OR "All Metadata":"cross-maneuver" OR "All Metadata":"cross manoeuvre")
AND ("All Metadata":"uncertainty" OR "All Metadata":"conformal" OR "All Metadata":"prediction interval" OR "All Metadata":"calibration")
AND ("All Metadata":"Unity" OR "All Metadata":"Unity 3D" OR "All Metadata":"virtual reality" OR "All Metadata":"VR" OR "All Metadata":"human-in-the-loop"))

### N2. Phase 1 novelty (benchmark rigor only)
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"state prediction" OR "All Metadata":"trajectory")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning" OR "All Metadata":"LSTM" OR "All Metadata":"Transformer")
AND ("All Metadata":"temporal split" OR "All Metadata":"time-based split" OR "All Metadata":"chronological split")
AND ("All Metadata":"maneuver" OR "All Metadata":"manoeuvre" OR "All Metadata":"cross-maneuver" OR "All Metadata":"cross manoeuvre")
AND ("All Metadata":"uncertainty" OR "All Metadata":"conformal" OR "All Metadata":"prediction interval" OR "All Metadata":"calibration")
AND NOT ("All Metadata":"Unity" OR "All Metadata":"Unity 3D" OR "All Metadata":"virtual reality" OR "All Metadata":"VR"))

### N3. Phase 2 novelty (validated model to immersion)
(("All Metadata":"UAV" OR "All Metadata":"drone" OR "All Metadata":"quadrotor")
AND ("All Metadata":"Unity" OR "All Metadata":"Unity 3D" OR "All Metadata":"virtual reality" OR "All Metadata":"VR" OR "All Metadata":"human-in-the-loop")
AND ("All Metadata":"flight dynamics" OR "All Metadata":"trajectory" OR "All Metadata":"state prediction")
AND ("All Metadata":"machine learning" OR "All Metadata":"deep learning")
AND ("All Metadata":"validation" OR "All Metadata":"benchmark" OR "All Metadata":"generalization"))

## 8. Search Log Template
- Query ID:
- Full query used:
- Filters applied:
- Date searched:
- Hits returned:
- Included after title/abstract screening:
- Included after full-text screening:
- Notes:
