# Research Proposal

## 1. Research Title
A Phased Benchmark-to-Immersion Framework for Drone Flight Dynamics: Temporal, Uncertainty, and Maneuver-wise Modeling with Unity/VR Human-in-the-Loop Integration

## 2. Background Study
Unmanned Aerial Vehicles (UAVs) are increasingly used in defense, agriculture, surveillance, logistics, and disaster-response operations. Because real-world flight testing is costly and safety-critical, simulation-driven development has become a practical pathway for pilot training, algorithm validation, and system design [1], [2].

Current drone dynamics research shows two parallel trends. The first is physics-based simulation that emphasizes mathematical fidelity but often needs many parameters and assumptions [3], [4]. The second is data-driven machine learning that improves predictive performance but may not always demonstrate robustness across time, maneuver types, and deployment conditions [5], [6].

At the same time, immersive environments (Unity/VR) are recognized as promising for human-in-the-loop learning and validation, yet many studies treat immersive integration as future work rather than a validated deployment stage [2], [7]. This proposal addresses that gap using a phased strategy: robust model benchmarking first, then immersive integration.

## 3. Literature Review

### 3.1. Overview
Related work can be grouped into four areas:
- UAV/drone simulation platforms and training simulators [1], [7].
- Physics-based drone dynamic models [3], [4].
- Machine learning and reinforcement learning for UAV dynamics/control [5], [6], [8].
- Review studies identifying generalization and deployment gaps in simulation research [9].

The reviewed works demonstrate strong progress but also highlight recurring issues: limited adaptability, limited external validity across maneuvers/time, and insufficient integration between model reliability and interactive simulation deployment.

### 3.2. Background
Classical works model drone motion through Newton-Euler or parameterized dynamic equations, supporting interpretability and controller design [3], [4]. However, these approaches can become brittle when assumptions fail or environment conditions shift.

Recent machine learning studies report promising prediction/control behavior, including maneuver-specific simulations and reinforcement learning policies [5], [6], [8]. Despite this progress, many studies evaluate with limited split strategies (often random) and do not systematically report temporal robustness, maneuver-wise performance, and calibrated uncertainty together.

Unity-based and commercial simulators provide strong visualization and training experiences [2], [7], but custom AI-to-simulator bridges with reproducible model validation are still limited in the literature.

### 3.3. Justification for Choosing This Approach
The selected research path (Option 1 first, Option 4 second) is justified by:
- Fixed-data feasibility: the available dataset is sufficient for rigorous model benchmarking without new flight-data collection.
- Risk control: model validity is proven before Unity/VR engineering to prevent late-stage rework.
- Academic value: combining temporal robustness, maneuver-wise robustness, and uncertainty analysis strengthens methodological rigor.
- Practical value: validated model outputs can later drive a realistic, human-in-the-loop Unity/VR simulation.

## 4. Research Problem

### 4.1. Research Problem and Identification
Although drone simulation and AI-based prediction have advanced, a reproducible benchmark pipeline that simultaneously evaluates:
- temporal generalization,
- maneuver-wise generalization, and
- uncertainty reliability,

and then carries a validated model into Unity/VR human-in-the-loop simulation is still not clearly established in current practice.

### 4.2. Research Justification
This research is justified because it can:
- improve trustworthiness of drone prediction models for deployment,
- provide evidence-based readiness for real-time immersive simulation,
- reduce technical risk by staging development,
- support supervisor/stakeholder decision-making with measurable quality gates.

### 4.3. Scope of the Research
In scope:
- Multi-output drone state prediction from existing telemetry.
- Temporal split benchmarking.
- Maneuver-wise split benchmarking.
- Lightweight uncertainty benchmarking (without new data).
- Unity/VR integration after Phase 1 completion.

Out of scope (unless objectives are revised):
- New drone flight data collection.
- Full anomaly-classification pipeline as core objective.
- Heavy Bayesian framework as a primary modeling objective.

## 5. Objectives of Research

### 5.1. Research Aim
To develop and validate a robust AI-based drone flight prediction pipeline on fixed real-flight telemetry, and to integrate the validated model into a Unity/VR human-in-the-loop simulation environment.

### 5.2. Research Objectives
1. Build a reproducible preprocessing and modeling workflow using the existing dataset.
2. Benchmark model performance using temporal and maneuver-wise evaluation strategies.
3. Add uncertainty-aware evaluation to quantify prediction reliability.
4. Select a validated best model based on measurable quality gates.
5. Integrate model outputs into a Unity-based real-time simulation.
6. Demonstrate VR human-in-the-loop interaction as a Phase 2 extension.

### 5.3. Research Questions
RQ1. Can benchmark rigor (temporal + maneuver-wise + uncertainty evaluation) improve confidence in drone state prediction over baseline random-split results?

RQ2. Which model family best balances accuracy, robustness, and reproducibility under fixed-data constraints?

RQ3. Is a validated AI model deployable into Unity for real-time trajectory visualization with acceptable fidelity and responsiveness?

RQ4. Does VR human-in-the-loop interaction provide practical added value for training and qualitative validation?

## 6. Expected Outcomes
- A reproducible end-to-end pipeline for multi-output drone prediction.
- Benchmark report covering temporal, maneuver-wise, and uncertainty performance.
- Best-model selection with transparent justification.
- Unity prototype driven by model outputs.
- VR human-in-the-loop demonstration (Phase 2).
- Final research report with limitations, risks, and future directions.

## 7. Methodology

### 7.1. Systematic Literature Review
A structured review will be conducted to refine methods and justify design decisions.

Planned steps:
1. Define search strings around UAV simulation, drone dynamics prediction, temporal generalization, uncertainty estimation, Unity/VR teleoperation.
2. Search indexed sources (IEEE Xplore, Scopus, ScienceDirect, ACM, Google Scholar).
3. Apply inclusion/exclusion criteria (recency, relevance, peer-reviewed quality, method comparability).
4. Extract comparable fields: data type, model family, split strategy, uncertainty method, environment type, metrics.
5. Synthesize findings into a gap matrix directly tied to RQ1-RQ4.

### 7.2. Conceptual Framework and Hypotheses
Conceptual flow:
- Existing telemetry dataset -> preprocessing/feature engineering -> candidate models -> benchmark layer (temporal + maneuver-wise + uncertainty) -> validated model artifact -> Unity integration -> VR interaction and final evaluation.

Hypotheses:
- H1: The selected best model will outperform baseline performance on at least 4 of 6 output targets under temporal split evaluation.
- H2: Maneuver-wise evaluation will expose non-uniform performance, enabling targeted model improvements.
- H3: Uncertainty-aware evaluation (lightweight end-track) will improve interpretability of model reliability for deployment decisions.
- H4: A validated model can be integrated into Unity/VR with usable fidelity for human-in-the-loop demonstration.

### 7.3. Data Collection
Primary data source:
- Existing drone telemetry CSV dataset already available in the project workspace.

Data strategy:
- No new flight-data collection is required.
- Existing training/testing partitions and additional temporal/maneuver split definitions will be used for benchmarking.
- For Phase 2 qualitative evaluation, limited user feedback can be collected (if approved), but this is not a blocker for Phase 1 completion.

## 8. Time Plan
Proposed 24-week plan (adjustable with supervisor feedback):

| Period | Activities | Deliverables |
|---|---|---|
| Weeks x | Proposal finalization and supervisor alignment | Approved proposal |
| Weeks x | Systematic literature review and gap matrix | Literature chapter draft |
| Weeks x | Data audit, preprocessing freeze, baseline replication | Baseline benchmark table |
| Weeks x | Model tuning and comparative experiments | Model comparison report |
| Weeks x | Temporal and maneuver-wise benchmarking | Robustness report |
| Weeks x | Uncertainty benchmarking (lightweight end-track) | Reliability report |
| Weeks x | Best-model finalization and reproducibility reruns | Phase 1 completion package |
| Weeks x | Unity integration and VR human-in-the-loop demo | Phase 2 prototype demo |
| Weeks x | Final writing, revision, submission prep | Final dissertation/report package |

## 9. References
[1] A. I. B. A. Mairaj and A. Y. Javaid, "Application specific drone simulators: Recent advances and challenges," Simulation Modelling Practice and Theory, vol. 94, pp. 100-117, 2019.

[2] A. R.-M. Mora-Soto, J. Maldonado-Romo, and M. Aldape-Perez, "Building a realistic virtual simulator for unmanned aerial vehicle teleoperation," Applied Sciences, vol. 11, no. 24, 2021.

[3] D. Orbea et al., "Math model of UAV multi rotor prototype with fixed wing aerodynamic structure for a flight simulator," in Lecture Notes in Computer Science, Springer, 2017, pp. 199-211.

[4] H. C. T. E. Fernando et al., "Modelling, simulation and implementation of a quadrotor UAV," in 2013 IEEE 8th International Conference on Industrial and Information Systems (ICIIS), 2013, pp. 207-212.

[5] D. Sandaruwan, M. Jayasundara, N. Kodikara, and S. Pitigala, "Machine learning based approach to simulate drone dynamics related to figure of eight maneuvering pattern," European Journal of Computer Science and Information Technology, vol. 7, no. 5, pp. 16-25, 2019.

[6] J. Hwangbo, I. Sa, R. Siegwart, and M. Hutter, "Control of a quadrotor with reinforcement learning," IEEE Robotics and Automation Letters, 2017.

[7] DJI, "DJI Flight Simulator," 2023. [Online]. Available: https://www.dji.com/global/simulator

[8] A. Punjani and P. Abbeel, "Machine learning for helicopter dynamics models," University of California, Berkeley, Tech. Rep., 2014.

[9] S. Amarasooriya and D. Sandaruwan, "Mathematical and machine learning based methods for UAV simulation: A systematic literature review," International Journal of Engineering and Management Research, vol. 14, no. 2, 2024.

[10] D. Amarasooriya and K. D. Sandaruwan, "AI-Based 3D Simulation for Drone Flight Dynamics," International Journal on Advances in ICT for Emerging Regions, May 2025.
