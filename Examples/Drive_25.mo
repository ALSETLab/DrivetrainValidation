within DrivetrainValidation.Examples;
model Drive_25
  extends DrivetrainValidation.Templates.Basic(
    redeclare BrushlessDCDrives.Machines.Averaged machine(redeclare
        Records.Hacker_Q150_25_4 data),
    redeclare BrushlessDCDrives.Controller.NoController controller(
        useDirectionInput=true),
    redeclare BrushlessDCDrives.Modulation.NoModulation modulation,
    redeclare BrushlessDCDrives.Inverter.Averaged inverter(redeclare
        BrushlessDCDrives.Inverter.Records.Data.Averaged.Unidirectional data));

  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque speedDependentTorque(
    TorqueDirection=false,
    tau_nominal=-machine.data.tau_nom,
    w_nominal(displayUnit="rpm") = machine.data.w_nom)
                           annotation (Placement(transformation(extent={{160,-10},{140,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    phi(fixed=true, start=0),
    w(fixed=true, start=0),
    J=10e-6)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
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
  BrushlessDCDrives.Common.MachineEnergyAnalyser
                               machineAnalyser(useBusConnector=true)
    annotation (Placement(transformation(extent={{28,-48},{48,-28}})));
equation
  connect(multiSensorLoad.flange_a, inertia.flange_b) annotation (Line(points={{120,0},{115,0},{110,0}},       color={0,0,0}));
  connect(multiSensorLoad.flange_b, speedDependentTorque.flange)
    annotation (Line(points={{132,0},{136,0},{140,0}},       color={0,0,0}));
  connect(multiSensorMotor.flange_a, inertia.flange_a) annotation (Line(points={{80,0},{90,0}},              color={0,0,0}));
  connect(controller.dutyCycleOut, modulation.dutyCycleIn) annotation (Line(points={{-59,6},{-50.5,6},{-42,6}}, color={0,0,127}));
  connect(inverter.pin_p_Out, machine.pin_p) annotation (Line(points={{19.8,6},{29.9,6},{40,6}}, color={0,0,255}));
  connect(machine.pin_n, inverter.pin_n_Out) annotation (Line(points={{40,-6},{30,-6},{20,-6}}, color={0,0,255}));
  connect(modulation.dutyCycleOut, inverter.dutyCycleIn) annotation (Line(points={{-19,6},{-10.5,6},{-2,6}}, color={0,0,127}));
  connect(modulation.rotateCW, inverter.rotateCW) annotation (Line(points={{-19,0},{-2,0},{-2,0}}, color={255,0,255}));
  connect(controller.rotateCW_Out, modulation.rotateCW_In)
    annotation (Line(points={{-59,0},{-50.5,0},{-42,0}}, color={255,0,255}));
  connect(controller.dutyCycleIn, dutyCycleIn)
    annotation (Line(points={{-82,6},{-160,6}}, color={0,0,127}));
  connect(controller.rotateCW_In, rotateCW_In) annotation (Line(points={{-82,0},
          {-124,0},{-124,-40},{-160,-40}}, color={255,0,255}));
  connect(inverter.pin_p, pin_p)
    annotation (Line(points={{4,10},{4,60},{-80,60}}, color={0,0,255}));
  connect(inverter.pin_n, pin_n)
    annotation (Line(points={{16,10},{16,60},{98,60}}, color={0,0,255}));
  connect(machineAnalyser.bldcBus, inverter.bldcBus) annotation (Line(
      points={{38,-48},{38,-54},{10,-54},{10,-10}},
      color={0,100,120},
      thickness=0.5));
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
end Drive_25;
