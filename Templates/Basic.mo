within DrivetrainValidation.Templates;
partial model Basic "Basic components of a BLDC drive with power supply"

  replaceable BrushlessDCDrives.Controller.Interfaces.Controller controller
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  replaceable BrushlessDCDrives.Modulation.Interfaces.HalfBridgeToBoolean modulation
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  replaceable BrushlessDCDrives.Inverter.Interfaces.SupplyDC inverter
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensorMotor annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={74,0})));
  replaceable BrushlessDCDrives.Machines.Interfaces.Basic machine
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=270,
        origin={22,20})));
equation
  connect(controller.bldcBus, modulation.bldcBus)
    annotation (Line(
      points={{-70,-10},{-70,-20},{-30,-20},{-30,-10}},
      color={0,100,120},
      thickness=0.5));
  connect(modulation.bldcBus, inverter.bldcBus)
    annotation (Line(
      points={{-30,-10},{-30,-20},{10,-20},{10,-10}},
      color={0,100,120},
      thickness=0.5));
  connect(multiSensorMotor.flange_b, machine.flange) annotation (Line(points={{68,0},{68,0},{60,0}}, color={0,0,0}));
  connect(inverter.bldcBus, machine.bldcBus)
    annotation (Line(
      points={{10,-10},{10,-20},{50,-20},{50,-10}},
      color={0,100,120},
      thickness=0.5));
  connect(controller.dutyCycleOut, modulation.dutyCycleIn) annotation (Line(points={{-59,6},{-42,6},{-42,6}}, color={0,0,127}));
  connect(inverter.pin_n, ground.p)
    annotation (Line(points={{16,10},{16,20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)));
end Basic;
