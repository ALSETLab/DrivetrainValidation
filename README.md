# Drivetrain Modeling
## Scope
This library has models that were used to validate multi-domain drivetrain behavior. It consists of multiple model variants for:
- Machines
- Controllers
- Batteries

### Goals
The goals of this library is to perform multi-domain analysis on a drivetrain for a quadcopter at varying degrees of modeling fidelity. These models are also developed for integration with other software tools as an FMU.

## Contents
All sub-systems and simulation cases are contained within the ./DrivetrainValidation/package.mo package. Each model is saved individually as its own file. The Dassault Brushless DC Drives and Dassault Battery libraries are required to run models with non-ideal power systems using batteries and certain DC motor configurations. These examples are also configured to run with speed control and torque input from the Rensselaer Multicopter Analysis Code (RMAC): <https://move.rpi.edu/publications/conference-papers/development-and-validation-rensselaer-multicopter-analysis-code-rmac>

This library is divided into sub-packages as follows:
- Examples
    - Multi-rotor configuration examples 
- Machines
    - Simplified DC
    - Brushless DC
- Templates
- Records
- FMU

### Simulating the system
1. Open ``./DrivetrainValidation/package.mo``
2. Set as ``Simulation model`` the model under ``DrivetrainValidation.Examples.CompareAllMotors``
![Alt text](/Pictures/ExampleModel.png "Example model") 
3. Go to the ``Simulation`` tab and simulate the model for 10 seconds.
4. This model should compare the results of the 4 drivetrain configurations, the torque produced by the trapezoidal motor drivetrain models are shown below. 

![Alt text](/Pictures/TrapezoidalTorque.png "Torque produced by the trapezoidal motor models") 

#### FMU Generation
It is possible to generate an FMU from the Modelica model to simulate the drivetrain with other software tools. Under the 'FMU' sub-package, the any model configuration in the package can be used. For this example, we will use the model ``DrivetrainValidation.FMU.Drive_45_FMU``. To generate the FMU using Dymola 2019 FD01 (64-bit) under Windows 10, follow the next steps:

1. Open ``./DrivetrainValidation/package.mo``
2. Set as ``Simulation model`` the model under ``DrivetrainValidation.FMU.Drive_45_FMU``
![Alt text](/Pictures/FMUModel.png "Example model for FMU generation")
3. Go to the ``Simulation Setup`` menu ``Simulation>Translate>FMU``... and provide the following configurations in the different tabs shown below:
![Alt text](/Pictures/FMUOptions.png "FMU configuration options") 


This can then be integrated into Simulink with RMAC using the FMI Toolbox.


