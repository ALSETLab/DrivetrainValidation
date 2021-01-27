within DrivetrainValidation.Machines.SimplifiedDC;
model SimplifiedDrive_Battery

  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{180,50},{200,70}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{180,30},{200,50}})));
  Templates.SimpleMotor_EMF simpleMotor_EMF(
    R_trs=0.0155,
    X_s=0,
    R_hyst=1000,
    k=0.1365) annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Mechanics.Rotational.Sources.Torque                     speedDependentTorque
                           annotation (Placement(transformation(extent={{160,20},
            {140,40}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensorLoad
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={78,30})));
  Modelica.Blocks.Interfaces.RealInput tau_in
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(extent={{-40,34},{0,74}}), iconTransformation(
          extent={{-26,48},{0,74}})));
  BrushlessDCDrives.Inverter.Averaged averaged(redeclare
      BrushlessDCDrives.Inverter.Records.Data.Averaged.Unidirectional data)
    annotation (Placement(transformation(extent={{12,20},{32,40}})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn1
                                                             "Ratio of on-time to period duration"
    annotation (Placement(transformation(extent={{-40,0},{0,40}}),
        iconTransformation(extent={{-26,14},{0,40}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW1 annotation (Placement(
        transformation(extent={{-40,-32},{0,8}}), iconTransformation(extent={{
            -26,-18},{0,8}})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{34,40},{44,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(phi(fixed=true,
        start=0), J=3e-3)
    annotation (Placement(transformation(extent={{94,20},{114,40}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  Modelica.Blocks.Interfaces.RealOutput phi1
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{180,10},{200,30}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{180,-22},{200,-2}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
    annotation (Placement(transformation(extent={{30,70},{50,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
    annotation (Placement(transformation(extent={{130,70},{150,90}})));
equation
  connect(multiSensorLoad.flange_a, simpleMotor_EMF.flange1)
    annotation (Line(points={{72,30},{60.4,30}}, color={0,0,0}));
  connect(multiSensorLoad.tau, tau_out) annotation (Line(points={{78,23.4},{78,
          14},{122,14},{122,60},{190,60}}, color={0,0,127}));
  connect(multiSensorLoad.w, omega_out) annotation (Line(points={{81.6,23.4},{
          81.8,23.4},{81.8,40},{190,40}},
                                        color={0,0,127}));
  connect(speedDependentTorque.tau, tau_in)
    annotation (Line(points={{162,30},{162,54},{-20,54}}, color={0,0,127}));
  connect(simpleMotor_EMF.n, averaged.pin_n_Out)
    annotation (Line(points={{40,24},{32,24}}, color={0,0,255}));
  connect(averaged.dutyCycleIn, dutyCycleIn1) annotation (Line(points={{10,36},
          {0,36},{0,20},{-20,20}}, color={0,0,127}));
  connect(averaged.rotateCW, rotateCW1) annotation (Line(points={{10,30},{6,30},
          {6,-12},{-20,-12}}, color={255,0,255}));
  connect(speedDependentTorque.flange, inertia.flange_b)
    annotation (Line(points={{140,30},{114,30}}, color={0,0,0}));
  connect(inertia.flange_a, multiSensorLoad.flange_b)
    annotation (Line(points={{94,30},{84,30}}, color={0,0,0}));
  connect(potentialSensor.phi, phi1) annotation (Line(points={{151,0},{160,0},{
          160,20},{190,20}}, color={0,0,127}));
  connect(simpleMotor_EMF.p, averaged.pin_p_Out)
    annotation (Line(points={{40,36},{31.8,36}}, color={0,0,255}));
  connect(simpleMotor_EMF.i1, i1) annotation (Line(points={{61,36},{124,36},{
          124,-12},{190,-12}}, color={0,0,127}));
  connect(ground2.p, averaged.pin_n) annotation (Line(points={{39,50},{34,50},{
          34,40},{28,40}}, color={0,0,255}));
  connect(potentialSensor.p, averaged.pin_p)
    annotation (Line(points={{130,0},{16,0},{16,40}}, color={0,0,255}));
  connect(averaged.pin_p, pin_p1) annotation (Line(points={{16,40},{20,40},{20,
          80},{40,80}}, color={0,0,255}));
  connect(averaged.pin_n, pin_n1) annotation (Line(points={{28,40},{64,40},{64,
          80},{140,80}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{0,-20},{180,80}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{0,-20},{180,80}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SimplifiedDrive_Battery;
