within DrivetrainValidation.Machines.BrushlessDCDrivetrain;
model Trapezoidal_Drive_45
  extends DrivetrainValidation.Templates.Basic(
    redeclare BrushlessDCDrives.Machines.Trapezoidal
                                                  machine(redeclare
        Records.Hacker_Q150_45_4 data,
      useThermalPort=false,            redeclare
        BrushlessDCDrives.Sensors.HalfRotationHall angleSensor),
    redeclare BrushlessDCDrives.Controller.SixStep      controller(
        useDirectionInput=true, redeclare
        BrushlessDCDrives.Controller.Records.Data.SixStep.Default data),
    redeclare BrushlessDCDrives.Modulation.BlockModulation
                                                        modulation,
    redeclare BrushlessDCDrives.Inverter.AveragedPWM
                                                  inverter);

  Modelica.Mechanics.Rotational.Sources.Torque                     speedDependentTorque
                           annotation (Placement(transformation(extent={{156,-10},
            {136,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=6.29e-2)
    annotation (Placement(transformation(extent={{90,-8},{106,8}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensorLoad
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={126,0})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn
    "Ratio of on-time to period duration"
    annotation (Placement(transformation(extent={{-180,-14},{-140,26}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In
    annotation (Placement(transformation(extent={{-180,-60},{-140,-20}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{88,50},{108,70}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{200,-20},{160,20}})));
  Modelica.Blocks.Interfaces.RealOutput w1
    "Absolute angular velocity of flange_a as output signal" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-70})));
  Modelica.Blocks.Interfaces.RealOutput tau1
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={120,-70})));
  BrushlessDCDrives.Common.Interfaces.Adapters.FromBus.CurrentDC currentDC
    annotation (Placement(transformation(extent={{50,-50},{62,-38}})));
  DymolaModels.Blocks.Interfaces.ElectricCurrentOutput i1
                                                         "Output signal connector"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-70})));
equation
  connect(multiSensorLoad.flange_a, inertia.flange_b) annotation (Line(points={{120,0},
          {106,0}},                                                                                            color={0,0,0}));
  connect(multiSensorLoad.flange_b, speedDependentTorque.flange)
    annotation (Line(points={{132,0},{136,0}},               color={0,0,0}));
  connect(controller.dutyCycleOut, modulation.dutyCycleIn) annotation (Line(points={{-59,6},{-50.5,6},{-42,6}}, color={0,0,127}));
  connect(controller.rotateCW_In, rotateCW_In) annotation (Line(points={{-82,0},
          {-124,0},{-124,-40},{-160,-40}}, color={255,0,255}));
  connect(inverter.pin_p, pin_p)
    annotation (Line(points={{4,10},{4,60},{-80,60}}, color={0,0,255}));
  connect(inverter.pin_n, pin_n)
    annotation (Line(points={{16,10},{16,60},{98,60}}, color={0,0,255}));
  connect(speedDependentTorque.tau, tau)
    annotation (Line(points={{158,0},{180,0}}, color={0,0,127}));
  connect(multiSensorMotor.w, w1) annotation (Line(points={{70.4,-6.6},{70.4,
          -70},{70,-70}}, color={0,0,127}));
  connect(multiSensorMotor.tau, tau1) annotation (Line(points={{74,-6.6},{74,
          -28},{120,-28},{120,-70}}, color={0,0,127}));
  connect(machine.plug_p, inverter.plug)
    annotation (Line(points={{40,0},{20,0}}, color={0,0,255}));
  connect(inverter.u, modulation.y)
    annotation (Line(points={{-2,0},{-19,0}}, color={255,0,255}));
  connect(modulation.halfBridgeInput, controller.halfBridgeOutput)
    annotation (Line(points={{-42,0},{-59,0}}, color={52,200,41}));
  connect(controller.dutyCycleIn, dutyCycleIn)
    annotation (Line(points={{-82,6},{-160,6}}, color={0,0,127}));
  connect(inverter.dutyCycleIn, modulation.dutyCycleOut)
    annotation (Line(points={{-2,6},{-19,6}}, color={0,0,127}));
  connect(inertia.flange_a, multiSensorMotor.flange_a)
    annotation (Line(points={{90,0},{80,0}}, color={0,0,0}));
  connect(currentDC.bldcBus, machine.bldcBus) annotation (Line(
      points={{50,-44},{44,-44},{44,-20},{50,-20},{50,-10}},
      color={0,100,120},
      thickness=0.5));
  connect(currentDC.y, i1) annotation (Line(points={{62.6,-44},{66,-44},{66,-56},
          {46,-56},{46,-70}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-140,-60},{160,60}},
        initialScale=0.1), graphics={Rectangle(extent={{-140,60},{160,-60}},
            lineColor={28,108,200})}),                           Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-140,-60},{160,60}},
        initialScale=0.1)),
    experiment(StopTime=1,__Dymola_NumberOfIntervals=1000),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end Trapezoidal_Drive_45;
