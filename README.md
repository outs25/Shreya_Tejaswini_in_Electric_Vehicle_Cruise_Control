# Electric Vehicle Cruise Control System

## Project Overview
This project demonstrates the design and simulation of an Electric Vehicle (EV) Cruise Control System using MATLAB.
A PI (Proportional–Integral) controller is implemented to maintain the desired vehicle speed while improving stability and reducing steady-state error.

The project also includes:
- Closed-loop system analysis
- Disturbance analysis
- Performance evaluation
- Automatic PI controller tuning

---

## Objectives
- Model the EV cruise control system
- Design a PI controller
- Simulate step response
- Analyze system performance
- Study disturbance rejection capability

---

## System Model

The vehicle is modeled using the transfer function:
\[
G(s) = 1/{5s + 1}
\]
This represents the simplified dynamics of the electric vehicle.

---

## Controller Design

A PI controller is used:

\[
C(s) = Kp+ Ki/s;
\]

Controller Parameters:
- Kp = 1.2
- Ki = 0.4

---

## Features
- Closed-loop speed control
- Open-loop vs closed-loop comparison
- Disturbance response analysis
- Performance metrics calculation
- Steady-state error analysis
- Automatic PI tuning using MATLAB

---

## Performance Metrics
The following metrics are analyzed:
- Rise Time
- Settling Time
- Overshoot
- Peak Value
- Steady-State Error

---

## Disturbance Analysis
Disturbances are introduced to simulate:
- Road slope variations
- External load disturbances
- Real-world driving conditions

The controller stabilizes the system and restores the vehicle speed close to the desired reference value.

---

## Files Included

### MATLAB Code
- `EV_Cruise_Control.m`

### Images
Located inside the `Images` folder:
- Step Response
- Open vs Closed Loop Comparison
- Disturbance Response
- Auto Tuned PI Response
- Other simulation outputs

---

## Software Used
- MATLAB Online
- Control System Toolbox

---

## Applications
- Electric vehicle cruise control
- Automotive control systems
- Intelligent transportation systems
- Autonomous driving research

---

## Future Improvements
- Adaptive Cruise Control
- Obstacle Detection
- AI-based Speed Prediction
- Road Condition Detection
- Real-time Hardware Implementation

---

## Conclusion
The project successfully demonstrates the implementation of a PI-controlled EV cruise control system. The controller improves system stability, reduces steady-state error, and maintains stable operation under disturbance conditions.

---

## Author
Shreya Tejaswini
