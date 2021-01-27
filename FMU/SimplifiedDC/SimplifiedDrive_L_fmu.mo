within DrivetrainValidation.FMU.SimplifiedDC;
model SimplifiedDrive_L_fmu

  Machines.SimplifiedDC.SimplifiedDrive_L drive
    annotation (Placement(transformation(extent={{28,2},{56,24}})));
  Modelica.Blocks.Interfaces.BooleanInput rotationCW
    annotation (Placement(transformation(extent={{-80,-32},{-40,8}})));
  Modelica.Blocks.Interfaces.RealInput omega
    annotation (Placement(transformation(extent={{-80,40},{-40,80}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,8},{-40,48}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{140,50},{160,70}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,32},{160,52}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{90,56},{98,64}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{90,46},{98,54}})));
  Modelica.Blocks.Interfaces.RealOutput phi1
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,10},{160,30}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
equation
  connect(realExtend1.y[3], omega_out) annotation (Line(points={{98.4,50.2667},
          {126,50.2667},{126,42},{150,42}},color={0,0,127}));
  connect(realExtend.y[3], tau_out) annotation (Line(points={{98.4,60.2667},{
          114,60.2667},{114,60},{150,60}},                   color={0,0,127}));
  connect(drive.tau_out, realExtend.u) annotation (Line(points={{57.5556,19.6},
          {72,19.6},{72,60},{89.2,60}}, color={0,0,127}));
  connect(drive.omega_out, realExtend1.u) annotation (Line(points={{57.5556,
          15.2},{74,15.2},{74,50},{89.2,50}},
                                     color={0,0,127}));
  connect(drive.tau_in, tau) annotation (Line(points={{25.9778,19.82},{-9.3,
          19.82},{-9.3,28},{-60,28}}, color={0,0,127}));
  connect(drive.rotateCW1, rotationCW) annotation (Line(points={{25.9778,5.3},{
          11.7,5.3},{11.7,-12},{-60,-12}}, color={255,0,255}));
  connect(drive.dutyCycleIn1, omega) annotation (Line(points={{25.9778,12.34},{
          -8.0111,12.34},{-8.0111,60},{-60,60}}, color={0,0,127}));
  connect(drive.phi1, phi1) annotation (Line(points={{57.5556,10.8},{122,10.8},
          {122,20},{150,20}}, color={0,0,127}));
  connect(drive.i1, i1) annotation (Line(points={{57.5556,3.76},{80,3.76},{80,4},
          {102,4},{102,0},{150,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-20},{140,80}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-20},{140,80}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SimplifiedDrive_L_fmu;
