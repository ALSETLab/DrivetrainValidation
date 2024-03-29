within DrivetrainValidation.Machines.BrushlessDCDrivetrain;
model Drive_45_Outputs_Cooled
  extends DrivetrainValidation.Templates.Basic(
    redeclare BrushlessDCDrives.Machines.Averaged machine(redeclare
        Records.Hacker_Q150_45_4 data, useThermalPort=true),
    redeclare BrushlessDCDrives.Controller.NoController controller(
        useDirectionInput=true),
    redeclare BrushlessDCDrives.Modulation.NoModulation modulation,
    redeclare BrushlessDCDrives.Inverter.Averaged inverter(redeclare
        BrushlessDCDrives.Inverter.Records.Data.Averaged.Unidirectional data));

  Modelica.Mechanics.Rotational.Sources.Torque                     speedDependentTorque
                           annotation (Placement(transformation(extent={{156,-10},
            {136,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    phi(fixed=true, start=0), J=6.29e-2)
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
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{26,2},{34,10}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-70})));
  BrushlessDCDrives.Common.ThermalRC
                   winding(R_th=3.7, tau_th=13) annotation (Placement(transformation(extent={{58,30},
            {78,50}})));
  BrushlessDCDrives.Common.ThermalRC
                   housing(tau_th=550, R_th=0.75*15.1)
                                                     annotation (Placement(transformation(extent={{88,30},
            {108,50}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ambientTemperature(T=295.15)
    annotation (Placement(transformation(extent={{138,30},{118,50}})));
equation
  connect(multiSensorLoad.flange_a, inertia.flange_b) annotation (Line(points={{120,0},{115,0},{110,0}},       color={0,0,0}));
  connect(multiSensorLoad.flange_b, speedDependentTorque.flange)
    annotation (Line(points={{132,0},{136,0}},               color={0,0,0}));
  connect(multiSensorMotor.flange_a, inertia.flange_a) annotation (Line(points={{80,0},{90,0}},              color={0,0,0}));
  connect(controller.dutyCycleOut, modulation.dutyCycleIn) annotation (Line(points={{-59,6},{-50.5,6},{-42,6}}, color={0,0,127}));
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
  connect(speedDependentTorque.tau, tau)
    annotation (Line(points={{158,0},{180,0}}, color={0,0,127}));
  connect(multiSensorMotor.w, w1) annotation (Line(points={{70.4,-6.6},{70.4,
          -70},{70,-70}}, color={0,0,127}));
  connect(multiSensorMotor.tau, tau1) annotation (Line(points={{74,-6.6},{74,
          -28},{120,-28},{120,-70}}, color={0,0,127}));
  connect(inverter.pin_p_Out, currentSensor.p)
    annotation (Line(points={{19.8,6},{26,6}}, color={0,0,255}));
  connect(currentSensor.n, machine.pin_p)
    annotation (Line(points={{34,6},{40,6}}, color={0,0,255}));
  connect(currentSensor.i, i1)
    annotation (Line(points={{30,1.6},{30,-70}}, color={0,0,127}));
  connect(i1, i1)
    annotation (Line(points={{30,-70},{30,-70}}, color={0,0,127}));
  connect(machine.heatPort,winding. port_a) annotation (Line(points={{50,10},{
          50,40},{58,40}},                                                                             color={191,0,0}));
  connect(winding.port_b,housing. port_a) annotation (Line(points={{78,40},{88,
          40}},                                                                      color={191,0,0}));
  connect(ambientTemperature.port,housing. port_b) annotation (Line(points={{118,40},
          {108,40}},                                                                            color={191,0,0}));
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
end Drive_45_Outputs_Cooled;
