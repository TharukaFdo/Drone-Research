## Related Work

### Search Coverage and Evidence Base
This section is synthesized from the Scopus search and abstract screening pipeline used in this project. The search pool contained 12,022 raw records and 5,692 unique records after deduplication. From this pool, a focused Top-30 directly related set was prepared and abstract-enriched to support thematic synthesis across temporal prediction, maneuver robustness, uncertainty modeling, and simulation integration. A strict overlap check (title + abstract only) identified no prior paper that combines the full intended pipeline of temporal + maneuver-wise + uncertainty benchmarking and Unity/VR human-in-the-loop deployment in one study.

### Temporal Trajectory Prediction and Control
Recent work shows strong progress in temporal UAV trajectory modeling, especially with sequence models and robust control formulations. A GRU-based framework reports reliable predictions up to a 4-second horizon with cross-dataset validation, highlighting gains in both accuracy and generalization [RW1]. A short-term spatial-temporal dependency design for UAV 2-D forecasting also reports better maneuver-sensitive prediction than MLP, LSTM, and Transformer baselines [RW2]. For high-maneuverability conditions, a wavelet-transformer architecture with correlated attention and kinematic-consistency loss demonstrates improved trajectory precision across multiple public and self-collected datasets [RW3].

In parallel, trajectory tracking control literature emphasizes robustness under disturbance and nonlinear dynamics. An online tuning strategy for multirotor UAVs reports strong aggressive-trajectory tracking under wind and in-flight dynamics changes [RW4]. Fixed-wing studies using DDPG and ANFIS-SMC report robust behavior under uncertainty, delays, and parameter variation, indicating that learning-enhanced controllers can outperform traditional PID-oriented baselines in difficult flight conditions [RW5], [RW6].

### Maneuver-Aware Prediction and Flight-Mode Modeling
A notable trend is explicit maneuver sensitivity rather than aggregate average error reporting. Multi-flight-mode prediction studies show lower trajectory error when flight-state recognition is incorporated before forecasting [RW7]. Other work targets aggressive maneuvers and dynamic scenarios, including reinforcement-learning tracking under uncertain disturbances and high-speed trajectory demands [RW8], and hybrid transformer-IMM pipelines designed to capture diverse motion patterns for multirotor trajectories [RW9]. Collectively, these studies show that maneuver-aware design materially improves trajectory quality, but methods and test protocols remain heterogeneous.

### Uncertainty-Aware UAV Forecasting
Uncertainty treatment is present but uneven across the literature. A widely cited GPR framework for non-cooperative UAV trajectory prediction combines confidence bounds, change-point detection, and adaptive pruning for online use [RW10]. More recent control-oriented comparative work benchmarks multiple online uncertainty-learning methods (ELM, RBFNN, ESN, GP), showing practical trade-offs between estimation quality and real-time feasibility [RW11]. Disturbance-aware MPC formulations with observer-based compensation and RL warm-start policies further indicate that uncertainty handling can improve convergence and robustness in tracking tasks [RW12].

Despite these advances, uncertainty is often reported as a method-level component rather than evaluated in a unified benchmark protocol alongside temporal and maneuver generalization. This limits comparability across studies and creates a recurring gap between model performance claims and deployment confidence.

### Simulation, Digital Twin, and Human-in-the-Loop Readiness
Simulation-driven UAV research includes both scalable infrastructure and digital twin implementations. A distributed client-server multi-drone simulation architecture demonstrated early scalability benefits for machine-learning workflows [RW13]. More recently, digital twin navigation work reports tight physical-virtual synchronization and low trajectory deviation in indoor GPS-denied settings [RW14]. These works confirm the value of simulation and digital replicas, but they do not establish a benchmark-gated transition from validated trajectory modeling to immersive Unity/VR human-in-the-loop evaluation within a single reproducible pipeline.

### Synthesis and Research Gap
The reviewed evidence suggests three stable findings. First, temporal and maneuver-aware methods have matured and can achieve strong prediction/control performance under selected scenarios. Second, uncertainty-aware components are increasingly used but not consistently benchmarked in a comparable manner across datasets and maneuver regimes. Third, simulation and digital twin studies demonstrate integration potential, yet the literature still lacks a clearly documented end-to-end workflow that: (1) validates temporal robustness, (2) validates maneuver-wise robustness, (3) quantifies uncertainty reliability, and then (4) deploys the validated model into immersive human-in-the-loop simulation.

Accordingly, the proposed study is positioned as a benchmark-to-immersion contribution: Phase 1 establishes reproducible temporal, maneuver-wise, and uncertainty-aware evidence on fixed telemetry data; Phase 2 operationalizes the validated model in Unity/VR for interactive evaluation.

### References Used in This Section
[RW1] GRU-Based Deep Learning Framework for Real-Time, Accurate, and Scalable UAV Trajectory Prediction, Drones, 2025. DOI: 10.3390/drones9020142.

[RW2] Learning Short-Term Spatial-Temporal Dependency for UAV 2-D Trajectory Forecasting, IEEE Sensors Journal, 2024. DOI: 10.1109/JSEN.2024.3466516.

[RW3] CAWT: Correlated Attention Based Wavelet Transformer for UAV Trajectory Prediction in High-Maneuverability Environments, IEEE Internet of Things Journal, 2026. DOI: 10.1109/JIOT.2026.3668086.

[RW4] Systematic Online Tuning of Multirotor UAVs for Accurate Trajectory Tracking under Wind Disturbances and In-Flight Dynamics Changes, IEEE Access, 2022. DOI: 10.1109/ACCESS.2022.3142388.

[RW5] Trajectory Tracking Control for Fixed-Wing UAV Based on DDPG, Journal of Aerospace Engineering, 2024. DOI: 10.1061/JAEEEZ.ASENG-5286.

[RW6] Trajectory Tracking of Fixed-Wing UAV Using ANFIS-Based Sliding Mode Controller, IEEE Access, 2025. DOI: 10.1109/ACCESS.2025.3557472.

[RW7] Design of a UAV Trajectory Prediction System Based on Multi-Flight Modes, Drones, 2024. DOI: 10.3390/drones8060255.

[RW8] Aggressive and robust low-level control and trajectory tracking for quadrotors with deep reinforcement learning, Neural Computing and Applications, 2025. DOI: 10.1007/s00521-024-10675-4.

[RW9] A learning-based interacting multiple model filter for trajectory prediction of small multirotor drones considering differential sequences, Transportation Research Part C, 2025. DOI: 10.1016/j.trc.2025.105115.

[RW10] Efficient and Robust Online Trajectory Prediction for Non-Cooperative Unmanned Aerial Vehicles, Journal of Aerospace Information Systems, 2022. DOI: 10.2514/1.I010997.

[RW11] Learning uncertainties online for quadrotor flight control: A comparative study, Journal of Intelligent and Robotic Systems, 2025. DOI: 10.1007/s10846-025-02305-5.

[RW12] RL-Enhanced Disturbance-Aware MPC for Fast and Robust UAV Trajectory Tracking, IEEE SMC Conference Proceedings, 2025. DOI: 10.1109/SMC58881.2025.11343521.

[RW13] A scalable client-server based multi-drone simulation architecture supporting efficient machine learning, WWW/Internet 2018 and Applied Computing 2018 Proceedings, 2018.

[RW14] Digital Twin for Drone Indoor Autonomous Navigation, IEEE Sensors Letters, 2026. DOI: 10.1109/LSENS.2025.3642424.

[RW15] A novel multi-agent trajectory prediction method for maneuver and collision optimization, Transportmetrica B, 2026. DOI: 10.1080/21680566.2025.2609608.
