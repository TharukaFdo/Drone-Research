# Research Proposal

## Title
An Integrated Framework for Drone Flight Dynamics: Temporal, Maneuver-wise, and Uncertainty-Aware Modeling with Unity/VR Human-in-the-Loop Integration

## 1. Introduction
Unmanned Aerial Vehicles (UAVs) are now central to surveillance, inspection, disaster response, logistics, and autonomous operations. As mission complexity increases, there is a growing need for reliable trajectory prediction and control systems that remain stable under maneuver changes, disturbances, and sensor uncertainty. At the same time, real-world testing is expensive, safety-critical, and difficult to scale. This has made simulation-driven development and data-driven modeling a practical direction for UAV research [1], [2].

Recent literature shows major progress in sequence-based prediction and robust control. Examples include GRU-based long-horizon prediction with cross-dataset validation [3], maneuver-sensitive short-term forecasting [5], and disturbance-resilient trajectory tracking under uncertain flight dynamics [4], [7], [9]. However, many studies evaluate models in narrow settings, use non-uniform test designs, or report uncertainty in isolation rather than as part of a unified evaluation protocol [6], [8]. In parallel, digital-twin and simulator studies demonstrate deployment potential [10], [11], but benchmark-gated transition from validated prediction models to immersive human-in-the-loop simulation is still limited.

This proposal addresses that need through an integrated research design. Model benchmarking and Unity/VR human-in-the-loop integration are developed together in one coordinated workflow, with shared evaluation checkpoints for temporal, maneuver-wise, and uncertainty-aware performance.

## 2. Problem Statement
Despite strong progress in UAV prediction and control, the current literature remains fragmented across three dimensions:

1. Temporal robustness is often under-tested beyond random train/test splits.
2. Maneuver-wise generalization is commonly claimed but inconsistently measured across flight regimes.
3. Uncertainty is frequently modeled, but rarely integrated into a single reproducible benchmark together with temporal and maneuver evaluation.

In addition, simulation papers often demonstrate virtual environments or digital twins without a prior, evidence-based validation gate for model reliability. As a result, there is no widely adopted end-to-end pipeline that first verifies prediction trustworthiness and then transitions the validated model into Unity/VR human-in-the-loop operation.

Therefore, the core problem is the absence of a reproducible integrated framework that unifies temporal, maneuver-wise, and uncertainty-aware validation with immersive deployment.

## 3. Research Questions
RQ1. How much does benchmark rigor (temporal split + maneuver-wise split + uncertainty-aware evaluation) change confidence in UAV state prediction compared with conventional random-split reporting?

RQ2. Which model family provides the best trade-off between predictive accuracy, robustness, and reproducibility on fixed telemetry data?

RQ3. Can a validated prediction model be integrated into Unity for real-time trajectory and attitude visualization with acceptable latency and fidelity?

RQ4. Does adding VR human-in-the-loop interaction provide practical value for evaluation, interpretability, and scenario analysis?

## 4. Significance of the Study
This study is significant in four ways:

1. Methodological significance: It introduces a structured benchmark protocol that evaluates temporal drift sensitivity, maneuver-specific behavior, and uncertainty reliability together rather than independently.
2. Practical significance: It reduces deployment risk by enforcing model-validation gates before simulation integration.
3. Technical significance: It provides a reusable pipeline from telemetry preprocessing to multi-output prediction, reliability analysis, and real-time simulation output bridging.
4. Research significance: It addresses a documented gap where prediction and immersive simulation are studied separately, with limited end-to-end reproducible integration.

## 5. Literature Review and Gap
### 5.1 Current State of the Art
The screened literature supports five major themes.

1. Temporal prediction and control: Deep sequence models and learning-enhanced controllers report strong results under selected settings, including long-horizon GRU prediction and robust tracking under disturbances [3], [4], [5], [7].
2. Maneuver-aware modeling: Multi-flight-mode and high-maneuverability studies show better performance when maneuver structure is explicitly modeled [12], [13], [14].
3. Uncertainty-aware prediction/control: GPR confidence bounds, observer-based robust MPC, and online uncertainty-learning comparisons provide useful reliability signals but use heterogeneous evaluation practices [6], [8], [9].
4. Simulation and digital twin environments: Scalable simulation architectures and digital twin systems demonstrate operational value and synchronization capability [10], [11].
5. Comparative trajectory literature outside direct drone-state benchmarks: Related trajectory studies emphasize uncertainty and maneuver optimization but are not equivalent to an end-to-end UAV state prediction and immersive deployment pipeline [15].

### 5.2 Identified Gap
From the screened corpus and strict similarity audit, no paper was found that jointly demonstrates:

1. Temporal generalization benchmarking,
2. Maneuver-wise robustness benchmarking,
3. Uncertainty reliability assessment,
4. Followed by Unity/VR human-in-the-loop deployment of the validated model,

within one reproducible framework.

The gap is therefore not a lack of individual methods, but a lack of integrated validation-to-deployment methodology.

## 6. Methodology
### 6.1 Research Design
An integrated design-and-evaluate methodology will be used, where benchmark modeling and Unity/VR implementation are executed in parallel with synchronized milestones.

1. Data and benchmark stream: preprocessing, model training, temporal and maneuver-wise evaluation, and uncertainty analysis.
2. Integration stream: Unity scene engineering, model-output bridge development, and VR interaction setup.
3. Joint validation stream: synchronized tests combining predictive reliability and immersive system responsiveness.

### 6.2 Data and Variables
Dataset source: existing UAV telemetry CSV corpus already available in the project workspace.

Input features (5):
- OSD.flyTime
- RC.aileron
- RC.elevator
- RC.throttle
- RC.rudder

Target outputs (6):
- OSD.longitude
- OSD.latitude
- OSD.height[ft]
- OSD.pitch
- OSD.roll
- OSD.yaw

### 6.3 Preprocessing Pipeline
1. Merge multiple CSV logs and select required columns.
2. Parse flight time into numeric seconds.
3. Handle missing values and outliers using robust filtering/imputation.
4. Scale features and targets for stable model training.
5. Freeze preprocessing configuration for reproducibility.

### 6.4 Modeling and Benchmark Protocol
Candidate model families:
- Linear/multi-output regression baselines,
- Tree ensembles,
- Sequence/deep models,
- Transformer-based sequence models (for example, temporal encoder models with attention),
- Control-oriented learning models where applicable.

Temporal robustness protocol:
1. Chronological ordering: all records are sorted by mission timeline before any split operation.
2. Primary temporal split: train, validation, and test are created as non-overlapping forward-time blocks (earlier to later), not random samples, using a 60/20/20 proportion at the flight-session level.
3. Rolling-origin evaluation: five expanding-window runs are executed, where each run trains on past windows and tests on the immediately following future window.
4. Leakage control: no shuffling across time; scaler/imputer/statistical transforms are fit only on each training window and then applied to later windows.
5. Temporal drift reporting: performance is reported per window, plus degradation from near-term to far-term horizons.

Maneuver-wise generalization protocol:
1. Maneuver labeling: each segment is assigned a maneuver class using control and attitude dynamics with explicit thresholds: steady/hover (|roll rate| and |pitch rate| <= 10 deg/s), turning (|yaw rate| > 15 deg/s), ascent-descent (|vertical speed| > 0.8 m/s equivalent), aggressive transition (any attitude-rate magnitude > 40 deg/s or large simultaneous control deflections).
2. Class balancing policy: if any maneuver class has less than 60 percent of the median class sample count, class-weighted loss is applied; controlled oversampling is used only when weighting alone is insufficient.
3. Leave-one-maneuver-out tests: for each maneuver class, train on remaining classes and test on the held-out class to measure transferability.
4. Cross-maneuver matrix: report a train-class versus test-class error matrix to identify weak transfer pairs.
5. Stress subset analysis: separately evaluate high-rate segments (rapid attitude or control changes) to quantify robustness under aggressive motion.

Uncertainty-aware evaluation protocol:
1. Prediction uncertainty: generate interval or distribution-aware outputs using model-specific methods (quantile regression for tree/deep regressors; Monte Carlo dropout for neural sequence models; empirical residual intervals for linear baselines).
2. Coverage analysis: compute empirical coverage at target confidence levels (for example, 80 percent and 95 percent).
3. Sharpness analysis: report interval width to avoid trivial over-wide uncertainty estimates.
4. Maneuver-conditioned uncertainty: compare calibration and interval width by maneuver class.
5. Time-conditioned uncertainty: compare calibration stability across temporal windows.

Metrics and reporting:
1. Point accuracy per target: RMSE, MAE, and R2 for longitude, latitude, altitude, pitch, roll, and yaw.
2. Temporal robustness metrics: window-wise error trend, worst-window error, and degradation ratio from earliest to latest test window.
3. Maneuver robustness metrics: median and worst-case error per maneuver class, plus leave-one-maneuver-out performance.
4. Uncertainty metrics: empirical coverage error and average interval width (overall, by time window, and by maneuver class).
5. Statistical confidence: bootstrap confidence intervals for primary metrics across windows and maneuvers.

Model selection quality gates:
1. The selected model must outperform linear baseline on at least four of six targets in temporal testing.
2. No maneuver class should exceed 2.0x the global median error for the same target set.
3. Uncertainty calibration error must remain within an acceptable margin (for example, within +/-5 percent of nominal coverage).
4. The model must satisfy real-time inference constraints required by Unity/VR integration on target hardware.

Final model selection rule:
1. Models are ranked using a weighted composite score: 45 percent point-accuracy score, 25 percent temporal robustness score, 20 percent maneuver robustness score, and 10 percent uncertainty calibration score.
2. Any model failing a quality gate is excluded regardless of composite score.
3. If top two models are within 2 percent composite difference, the lower-latency model is selected.

### 6.5 Unity/VR Integration
1. Export validated model predictions to a real-time Unity-compatible stream or file bridge.
2. Render trajectory and attitude updates in Unity scene.
3. Add VR interaction layer for human-in-the-loop scenario execution.
4. Implement synchronized logging for model output timestamps, rendering timestamps, interaction events, and operator responses.

### 6.6 VR Validation Protocol
Validation objectives:
1. Verify technical fidelity of model-to-Unity/VR deployment.
2. Verify whether VR human-in-the-loop improves task-level assessment compared with non-VR conditions.

Validation scenarios:
1. Nominal trajectory-following scenario (steady and smooth motion).
2. High-dynamics scenario (aggressive turns, rapid attitude transitions).
3. Disturbance scenario (wind-like perturbations or injected noise in state stream).
4. Recovery scenario (abrupt deviation and correction behavior).

Experimental conditions (ablation by interface):
1. C1: Model outputs reviewed as non-immersive baseline (plots/dashboard).
2. C2: Unity visualization without VR.
3. C3: Unity with VR human-in-the-loop interaction.

Single-operator study design:
1. Evaluator: one operator (the researcher).
2. Repeated-trials protocol: each scenario is repeated 10 times across C1, C2, and C3 conditions to capture run-to-run variation.
3. Execution control: scenario order is rotated using a counterbalanced schedule to reduce sequence bias and fatigue effects.
4. Rest control: a minimum 3-minute break is enforced between VR blocks.

Operator tasks:
1. Detect and flag trajectory deviation events.
2. Identify maneuver regime transitions.
3. Execute intervention prompts in predefined scenarios (where control interaction is enabled).
4. Complete post-session self-assessment forms.

Quantitative technical metrics:
1. End-to-end latency from model prediction timestamp to rendered pose update (median and 95th percentile).
2. Frame stability (average FPS and frame-time variance).
3. Spatial fidelity between streamed model state and rendered trajectory/attitude.
4. Event synchronization error between logged events and visual state transitions.

Operator task and subjective metrics:
1. Event detection precision, recall, and F1 score.
2. Time to detect anomalies or major deviations.
3. Intervention success rate and correction time.
4. Session-wise usability and workload self-ratings (for example, SUS and NASA-TLX forms).
5. Session-wise VR discomfort screening (for example, SSQ short form).

Acceptance thresholds:
1. Latency target: median less than or equal to 120 ms and 95th percentile less than or equal to 200 ms.
2. Frame-rate target: VR sessions maintain at least 72 FPS average.
3. Synchronization target: event alignment error less than or equal to 100 ms.
4. Utility target: VR condition improves at least one primary task metric over non-VR Unity baseline.

Analysis plan:
1. Compare C1, C2, and C3 using repeated-session statistics across runs (not participant-population inference).
2. Report medians, interquartile ranges, and bootstrap confidence intervals for key task metrics.
3. Stratify results by scenario type and maneuver class.
4. Provide failure-case analysis for runs violating latency or usability thresholds.
5. Explicitly state N=1 external-validity limits and position results as pilot feasibility evidence.

Decision policy for partial threshold failure:
1. If technical thresholds are met but utility target is not met, outcome is reported as technically feasible but operationally inconclusive.
2. If utility target is met but latency/FPS thresholds fail, outcome is reported as functionally promising but deployment-not-ready.
3. Full validation pass requires meeting all technical thresholds plus at least one utility improvement over C2.

### 6.7 Reproducibility and Validation
1. Fix random seeds and document all experimental settings.
2. Store benchmark configurations and outputs in versioned artifacts.
3. Provide comparative tables and ablation-style discussion for model-selection transparency.

## 7. Expected Results
Expected outputs are:

1. A reproducible benchmark framework for UAV multi-output state prediction.
2. Evidence-based comparison of model families under temporal and maneuver-wise stress.
3. Uncertainty-aware reliability reporting that improves decision confidence for deployment.
4. A selected best model justified by transparent quality gates.
5. A Unity prototype showing real-time trajectory/attitude visualization from validated predictions.
6. A VR human-in-the-loop demonstration showing practical feasibility for interactive evaluation.
7. A final research package (method, results, limitations, and future work roadmap).

## 8. References
[1] A. I. B. A. Mairaj and A. Y. Javaid, "Application specific drone simulators: Recent advances and challenges," Simulation Modelling Practice and Theory, vol. 94, pp. 100-117, 2019.

[2] A. R.-M. Mora-Soto, J. Maldonado-Romo, and M. Aldape-Perez, "Building a realistic virtual simulator for unmanned aerial vehicle teleoperation," Applied Sciences, vol. 11, no. 24, 2021.

[3] "GRU-Based Deep Learning Framework for Real-Time, Accurate, and Scalable UAV Trajectory Prediction," Drones, 2025. DOI: 10.3390/drones9020142.

[4] "Systematic Online Tuning of Multirotor UAVs for Accurate Trajectory Tracking under Wind Disturbances and In-Flight Dynamics Changes," IEEE Access, 2022. DOI: 10.1109/ACCESS.2022.3142388.

[5] "Learning Short-Term Spatial-Temporal Dependency for UAV 2-D Trajectory Forecasting," IEEE Sensors Journal, 2024. DOI: 10.1109/JSEN.2024.3466516.

[6] "Efficient and Robust Online Trajectory Prediction for Non-Cooperative Unmanned Aerial Vehicles," Journal of Aerospace Information Systems, 2022. DOI: 10.2514/1.I010997.

[7] "Trajectory Tracking Control for Fixed-Wing UAV Based on DDPG," Journal of Aerospace Engineering, 2024. DOI: 10.1061/JAEEEZ.ASENG-5286.

[8] "Learning uncertainties online for quadrotor flight control: A comparative study," Journal of Intelligent and Robotic Systems, 2025. DOI: 10.1007/s10846-025-02305-5.

[9] "RL-Enhanced Disturbance-Aware MPC for Fast and Robust UAV Trajectory Tracking," IEEE SMC Conference Proceedings, 2025. DOI: 10.1109/SMC58881.2025.11343521.

[10] "Digital Twin for Drone Indoor Autonomous Navigation," IEEE Sensors Letters, 2026. DOI: 10.1109/LSENS.2025.3642424.

[11] "A scalable client-server based multi-drone simulation architecture supporting efficient machine learning," WWW/Internet and Applied Computing Proceedings, 2018.

[12] "Design of a UAV Trajectory Prediction System Based on Multi-Flight Modes," Drones, 2024. DOI: 10.3390/drones8060255.

[13] "CAWT: Correlated Attention Based Wavelet Transformer for UAV Trajectory Prediction in High-Maneuverability Environments," IEEE Internet of Things Journal, 2026. DOI: 10.1109/JIOT.2026.3668086.

[14] "A learning-based interacting multiple model filter for trajectory prediction of small multirotor drones considering differential sequences," Transportation Research Part C, 2025. DOI: 10.1016/j.trc.2025.105115.

[15] "A novel multi-agent trajectory prediction method for maneuver and collision optimization," Transportmetrica B, 2026. DOI: 10.1080/21680566.2025.2609608.
