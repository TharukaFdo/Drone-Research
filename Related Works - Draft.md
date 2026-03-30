# Related Works (Draft)

Date: March 30, 2026
Project alignment: Phase 1 Option 1 (Temporal + Uncertainty + Maneuver-wise benchmarking), then Phase 2 Option 4 (Unity/VR human-in-the-loop integration)

## 1. Scope of This Review
This related-works draft synthesizes prior studies in drone dynamics simulation, machine learning based prediction, and interactive simulation environments. The review is organized to support the locked project sequence:
- Phase 1: robust prediction benchmarking on fixed real-flight data.
- Phase 2: Unity/VR integration after model validation.

Primary source already available in workspace:
- [717-Article Text-1586-1-10-20250601.md](717-Article%20Text-1586-1-10-20250601.md)

Supporting project context:
- [Research Plan - Phased.md](Research%20Plan%20-%20Phased.md)
- [Drone research gap analysis by UR.md](Drone%20research%20gap%20analysis%20by%20UR.md)

## 2. Thematic Review

### 2.1 UAV Simulation Foundations
Application-specific UAV simulators have been discussed as tools for training, R&D validation, and technology evaluation (for example, [4] in the article reference list). This literature highlights simulator usefulness but also recurring challenges in fidelity, extensibility, and scenario transfer.

Why this matters to our work:
- Confirms simulation value for safety and cost reduction.
- Motivates a staged approach where model reliability is established before immersive integration.

### 2.2 Physics-Based Drone Dynamics Models
Classical dynamics simulation studies (for example, Orbea et al. [10], Newton-Euler quadrotor modeling in [11]) model relationships among attitude states, velocities, and forces/torques. These studies provide interpretable motion equations and control insights.

Observed limitations in literature:
- High sensitivity to assumptions and parameter settings.
- Difficulty scaling to varied maneuver conditions and operational disturbances.

Relevance to our plan:
- Useful baseline perspective for understanding kinematics and dynamics coupling.
- Reinforces the need for data-driven benchmarking under temporal and maneuver variability.

### 2.3 Data-Driven and ML-Based Dynamics Modeling
Machine-learning approaches for dynamic behavior prediction have shown promising results in specific maneuver contexts (for example, figure-eight pattern in [25]). Related ML control work includes reinforcement learning based quadrotor control (for example, [21]).

Observed limitations in literature:
- Many studies focus on specific maneuvers or constrained test settings.
- Generalization across time and maneuver categories is often underreported.
- Confidence and uncertainty calibration are usually not central evaluation criteria.

Relevance to our plan:
- Directly motivates Phase 1 Option 1 focus on temporal split testing, maneuver-wise evaluation, and uncertainty benchmarking.

### 2.4 Virtual Environments and Unity-Based Simulation
Unity-based UAV simulation and teleoperation frameworks are reported (for example, [15]). Commercial simulators (RealFlight, DroneSimPro, Liftoff, Heli-X, DJI simulator in [16]-[20]) provide mature environments for training and scenario rendering.

Observed limitations in literature:
- Commercial platforms are often not flexible for custom research pipelines.
- Integration with custom AI prediction outputs and research-specific telemetry constraints is limited.

Relevance to our plan:
- Supports Phase 2 Option 4 as a custom Unity bridge approach after model validation.
- Justifies deferring Unity engineering until a stable model artifact is available.

### 2.5 Systematic Reviews and Research Gaps
Recent review efforts (for example, [26]) emphasize fragmentation between mathematical simulators and ML simulators, and limited AI-grounded 3D flight dynamics replication in some settings.

Gap confirmed for this study:
- Need for a reproducible benchmark-first pipeline that proves robustness before immersive simulation deployment.

## 3. Synthesis Table (Initial)

| Theme | Representative Works | Strengths | Common Gaps | Our Response |
|---|---|---|---|---|
| UAV simulation frameworks | [4], [16]-[20] | Training utility, practical environments | Limited research flexibility, proprietary constraints | Build custom research pipeline and Unity bridge |
| Physics-based modeling | [10], [11] | Interpretability, dynamics grounding | Parameter-heavy, assumption-sensitive | Use as conceptual baseline, prioritize empirical benchmark |
| ML dynamics prediction | [21], [25] | Strong nonlinear modeling potential | Limited temporal/maneuver generalization analysis | Temporal + maneuver-wise benchmark design |
| Review literature | [26] | Broad landscape and limitations | Few integrated benchmark-to-immersion pipelines | Two-phase Option 1 -> Option 4 strategy |

## 4. Positioning of This Research
This study is positioned as a two-stage contribution:
1. A benchmark-rigorous prediction phase on fixed real-flight logs (temporal robustness, maneuver-wise robustness, uncertainty-aware reporting).
2. A deployment-oriented immersive phase that integrates validated model outputs into Unity/VR human-in-the-loop simulation.

This positioning addresses a practical research gap: many works either stop at model accuracy or provide simulation environments without a robust, reproducible model validation gate.

## 5. How This Related Work Supports Current Plan
The reviewed literature supports the current decision in [Research Plan - Phased.md](Research%20Plan%20-%20Phased.md):
- Phase 1 first: reduce risk and establish trustworthy model behavior.
- Phase 2 second: convert validated model outputs into interactive simulation.

This prevents mid-project halts due to premature Unity/VR integration before model stability is proven.

## 6. Immediate Next Steps for Related Work Expansion
1. Expand this draft with 10-15 additional recent papers (2020-2026) on:
   - Sequence models for trajectory prediction.
   - Uncertainty estimation for regression (conformal, interval methods).
   - Human-in-the-loop or VR training outcomes for UAV systems.
2. Add a comparison matrix with consistent fields:
   - Data type, model family, split strategy, uncertainty method, environment type, evaluation metrics.
3. Convert numbered placeholders [4], [10], etc. into full citation entries in your final citation style.

## 7. Starter Reference Mapping (from existing article)
- [4] Application-specific drone simulators and challenges.
- [10] Numerical UAV modeling with SISO-style relationships.
- [11] Newton-Euler quadrotor dynamics simulation.
- [15] Unity-based realistic UAV teleoperation simulator.
- [16]-[20] Commercial drone simulators and tooling.
- [21] Reinforcement learning control of quadrotor.
- [25] ML approach for figure-eight drone dynamics simulation.
- [26] Systematic review of mathematical and ML-based UAV simulation methods.

Note: This is a working draft for thesis/report writing. Keep language and citation style consistent with your target submission format in the final version.
