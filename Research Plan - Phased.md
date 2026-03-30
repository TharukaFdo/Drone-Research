# Drone Research Master Plan (Option 1 Benchmark First, Option 4 VR Second)

Date: March 30, 2026

## Purpose
This document is the locked execution plan for the research discussed.
It is designed to prevent mid-project halts by separating mandatory work from later extensions.

## Scope Decision (Locked)
- Phase 1 is mandatory and must be completed first.
- Phase 2 is planned and starts only after Phase 1 exit criteria are met.
- No new data collection is required.
- Existing dataset and notebooks are the base.

## Existing Project Assets
- Core notebooks: [Final/Final/Preprocess.ipynb](Final/Final/Preprocess.ipynb), [Final/Final/ResearchFinal.ipynb](Final/Final/ResearchFinal.ipynb)
- Dataset folder: [Final/Final/Dataset](Final/Final/Dataset)
- Testing set folder: [Final/Final/testing](Final/Final/testing)
- Current problem statement: [Drone research problem.md](Drone%20research%20problem.md)

## Research Questions
1. How much can prediction quality be improved on the fixed drone dataset using stronger modeling and tuning?
2. Can the validated model be integrated into Unity for real-time trajectory simulation?
3. Can VR human-in-the-loop interaction improve practical training value?

## Why This Is The Best Option (Current Constraints)
- It fits the fixed-dataset constraint with no new data collection.
- It maximizes rigor first (generalization, robustness, confidence) before simulation integration.
- It reduces technical risk by validating model quality before Unity/VR engineering effort.
- It preserves novelty: strong Phase 1 benchmark + high-impact Phase 2 human-in-the-loop extension.

## Phase 1 (Mandatory): Option 1 - Temporal, Uncertainty, and Maneuver-wise Benchmarking
### Goal
Build and validate a robust drone flight prediction pipeline on the existing dataset using temporal split testing, uncertainty benchmarking, and maneuver-wise robustness evaluation.

### In Scope
- Data audit and schema freeze.
- Reproducible preprocessing and feature pipeline.
- Baseline replication and re-evaluation.
- Model comparison and tuning (for example: CNN, LSTM, Transformer-style sequence model if feasible).
- Quantitative testing and per-target error analysis.

### Outputs Required
- One reproducible end-to-end workflow.
- Model comparison table with selection rationale.
- Final metric report (MSE, RMSE, MAE, R2, variance explained).
- Saved test predictions and plots for review.

### Exit Criteria (Must Pass Before Phase 2)
- Pipeline runs end-to-end without manual fixes.
- Best model is clearly identified and documented.
- Results are reproducible on the same fixed dataset.
- Limitations and error patterns are clearly reported.

### Quality Gates (Measurable)
- Baseline improvement: best model improves baseline on at least 4 out of 6 targets under temporal split evaluation.
- Robustness evidence: maneuver-wise metrics are reported for all defined maneuver groups.
- Uncertainty calibration: for a nominal 90% prediction interval, empirical coverage is in the 85% to 95% band for key outputs.
- Reproducibility: at least 3 reruns are reported with metric drift <= 5% on selected key metrics.

## Phase 2 (Planned): Option 4 - Unity/VR Human-in-the-Loop Integration
### Goal
Integrate Phase 1 model outputs into a real-time Unity simulation, then add VR interaction.

### Prerequisites
- Phase 1 exit criteria completed.
- Stable model artifact selected for deployment.

### In Scope
- Python to Unity output bridge.
- Real-time trajectory and attitude visualization.
- VR headset interaction (pilot controls and scenario interaction).
- Quantitative and qualitative evaluation of simulation experience.

### Outputs Required
- Working Unity simulation prototype.
- VR human-in-the-loop demo.
- Evaluation report covering fidelity, latency, and user experience.

## Requirement Matrix (Anti-Halt Control)
### Required Now (Phase 1)
- Existing dataset usage.
- Model training, tuning, and quantitative validation.
- Reproducible pipeline documentation.

### Required Later (Phase 2)
- Unity integration implementation.
- VR human interaction module.
- Real-time simulation evaluation.

### Not Required Unless Scope Changes
- New dataset collection.
- New maneuver/anomaly labels (unless classification objective is added).
- Advanced uncertainty frameworks (unless confidence objective is added).

### Clarifications from Discussion
- Anomaly detection is optional unless the study is explicitly reframed as a classification objective.
- Uncertainty work is included in Phase 1, but can be executed as a lightweight end-track after core model benchmarking, without adding new data.

## Risk Controls
- Do not start Phase 2 tasks before Phase 1 sign-off.
- Keep one active objective list per phase.
- Keep weekly checkpoint logs with pass/fail against exit criteria.
- If Unity integration blocks, continue with non-blocking simulation interface tests and deferred VR tasks.

## Week 1 Action List
1. Freeze Phase 1 objective list and metrics template.
2. Run baseline models and record results in one comparison table.
3. Select candidate best model for deeper tuning.
4. Create Phase 1 completion checklist and sign-off notes.

## Improvement Backlog (After Core Baselines)
1. Add leave-one-flight-out evaluation for stronger temporal generalization testing.
2. Add explicit ablation table (features, model families, and split strategies).
3. Define maneuver labeling rules as a versioned protocol for consistent group-level evaluation.
4. Add a lightweight deployment interface contract (model input/output schema for Unity bridge).
5. Add a latency budget target for Phase 2 real-time simulation handoff.

## Sign-Off
- Phase 1 Start Approved: Yes
- Phase 2 Start Condition: Only after Phase 1 exit criteria are met
