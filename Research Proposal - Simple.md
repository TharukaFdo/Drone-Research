# Research Proposal (Simple Version)

## Title
Improving Drone State Prediction Accuracy with Unity/VR-Based Practical Evaluation

## 1. Introduction
Drones are widely used in inspection, surveillance, rescue, and logistics. For these tasks, it is important to predict where the drone will be and how it will be oriented (pitch, roll, yaw) in the next moments. Better prediction helps safer flight, better planning, and fewer failures.

Many studies already show good results for drone trajectory prediction and control, including deep learning and robust control methods [1]-[6]. Other studies show that simulation and digital twin systems are useful for testing and training [7], [8].

However, there is still a practical gap: most studies focus either on model accuracy or on simulation, but not on a clear combined workflow that shows both strong prediction performance and practical Unity/VR usability in one project.

This proposal aims to build a more accurate prediction model and evaluate it in a practical Unity/VR setting.

## 2. Problem Statement
Current drone prediction work has three common issues:

1. Results are often reported on easy split settings and may not hold over time.
2. Performance can vary across different flight behaviors (for example, hover vs aggressive turns).
3. Many papers show simulation separately, without clearly validating a model inside a usable interactive environment.

So the problem is to create a model that is both accurate and practically usable, then show this clearly through a simple and realistic Unity/VR evaluation.

## 3. Research Questions
RQ1. Can we improve prediction accuracy compared with baseline models for drone state prediction?

RQ2. Does the model stay reliable when tested on later-time data and different maneuver types?

RQ3. Can the selected model run smoothly in Unity/VR with acceptable responsiveness?

RQ4. In a practical single-operator test, does VR help identify flight deviations faster or more clearly than non-VR viewing?

## 4. Significance of the Study
This work is important because it:

1. Produces a stronger prediction model (not just a proof-of-concept).
2. Checks reliability in practical conditions (time progression and maneuver types).
3. Connects AI model output to Unity/VR in a usable way.
4. Provides a clear end-to-end workflow that others can reuse.

## 5. Literature Review and Gap
Recent papers show strong progress in trajectory prediction and control using GRU/LSTM/Transformer-like models and learning-based controllers [1]-[6]. Some works focus on maneuver-aware prediction [2], [3], [9], while others address uncertainty and robustness [4], [5]. Simulation and digital twin systems also show strong value for testing and interaction [7], [8].

Even with this progress, few studies combine all of the following in one clear workflow:

1. Improving core prediction accuracy.
2. Checking performance across time and maneuver groups.
3. Deploying and evaluating the final model in Unity/VR.

This is the gap addressed by this study.

## 6. Methodology
### 6.1 Data and Targets
The project uses existing drone telemetry data in the workspace.

Input features:
- OSD.flyTime
- RC.aileron
- RC.elevator
- RC.throttle
- RC.rudder

Predicted outputs:
- OSD.longitude
- OSD.latitude
- OSD.height[ft]
- OSD.pitch
- OSD.roll
- OSD.yaw

### 6.2 Data Preparation
1. Merge all selected flight logs.
2. Keep only required input/output columns.
3. Convert flight time to numeric seconds.
4. Handle missing values and obvious outliers.
5. Scale values for stable model training.

### 6.3 Model Development (Accuracy Focus)
Candidate models:
- Linear baseline model,
- Tree-based model,
- GRU/LSTM sequence model,
- Transformer-based sequence model.

Goal:
- Select the model that gives the best balance of accuracy and stability.

### 6.4 Practical Reliability Checks
The selected and candidate models will be tested in three simple ways:

1. Standard test split for baseline comparison.
2. Time-based test: train on earlier flight data and test on later flight data.
3. Maneuver-wise test: report performance by maneuver groups (for example, steady, turning, ascent/descent, aggressive).

Main metrics:
- RMSE,
- MAE,
- R2,
- per-target and per-maneuver summaries.

### 6.5 Unity/VR Practical Evaluation (Single Operator)
This is a practical pilot evaluation by one operator (the researcher).

Steps:
1. Stream model predictions into Unity.
2. Visualize trajectory and attitude in real time.
3. Run the same scenarios in two modes:
- Unity without VR,
- Unity with VR.
4. Repeat runs and log results.

Simple evaluation points:
- Rendering responsiveness (delay),
- Visual smoothness (frame stability),
- Time to detect trajectory problems,
- Success in handling prompted interventions.

This VR part is feasibility-focused (not a large user study).

### 6.6 Model Selection Rules
A model is accepted if it:

1. Outperforms the linear baseline on most targets,
2. Stays reasonably stable across maneuver groups,
3. Runs fast enough for real-time Unity use.

## 7. Expected Results
Expected outputs:

1. A better-accuracy drone state prediction model.
2. Clear evidence of performance across time and maneuver groups.
3. A working Unity integration for real-time prediction visualization.
4. A practical VR pilot demonstration by a single operator.
5. A clear final report with strengths, limits, and next steps.

## 8. References
[1] GRU-Based Deep Learning Framework for Real-Time, Accurate, and Scalable UAV Trajectory Prediction, Drones, 2025. DOI: 10.3390/drones9020142.

[2] Learning Short-Term Spatial-Temporal Dependency for UAV 2-D Trajectory Forecasting, IEEE Sensors Journal, 2024. DOI: 10.1109/JSEN.2024.3466516.

[3] Design of a UAV Trajectory Prediction System Based on Multi-Flight Modes, Drones, 2024. DOI: 10.3390/drones8060255.

[4] Efficient and Robust Online Trajectory Prediction for Non-Cooperative Unmanned Aerial Vehicles, Journal of Aerospace Information Systems, 2022. DOI: 10.2514/1.I010997.

[5] Learning uncertainties online for quadrotor flight control: A comparative study, Journal of Intelligent and Robotic Systems, 2025. DOI: 10.1007/s10846-025-02305-5.

[6] Systematic Online Tuning of Multirotor UAVs for Accurate Trajectory Tracking under Wind Disturbances and In-Flight Dynamics Changes, IEEE Access, 2022. DOI: 10.1109/ACCESS.2022.3142388.

[7] Digital Twin for Drone Indoor Autonomous Navigation, IEEE Sensors Letters, 2026. DOI: 10.1109/LSENS.2025.3642424.

[8] A scalable client-server based multi-drone simulation architecture supporting efficient machine learning, WWW/Internet and Applied Computing Proceedings, 2018.

[9] CAWT: Correlated Attention Based Wavelet Transformer for UAV Trajectory Prediction in High-Maneuverability Environments, IEEE Internet of Things Journal, 2026. DOI: 10.1109/JIOT.2026.3668086.
