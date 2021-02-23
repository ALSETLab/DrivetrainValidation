within DrivetrainValidation.Examples;
model AveragedSwitched_Drive45



  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=10000,                startValue=true)
    annotation (Placement(transformation(extent={{-118,4},{-98,24}})));
  Machines.BrushlessDCDrivetrain.Trapezoidal_Drive_45
                                                  drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-118,34},
            {-98,54}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=60)
    annotation (Placement(transformation(extent={{38,50},{58,70}})));
  Modelica.Blocks.Sources.Constant dutyCycle1(k=-5.139)
                                                    annotation (Placement(transformation(extent={{96,10},
            {76,30}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.08, initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-68,34},{-48,54}})));
  Modelica.Blocks.Sources.BooleanStep rotateCW1(startTime=1000, startValue=true)
    annotation (Placement(transformation(extent={{-94,-70},{-74,-50}})));
  Modelica.Blocks.Sources.Step     dutyCycle2(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-96,-38},
            {-76,-18}})));
  Machines.BrushlessDCDrivetrain.Sinusoidal_Drive_45
                                                  sinusoidal_Drive_45_1
    annotation (Placement(transformation(extent={{-18,-62},{12,-50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=60)
    annotation (Placement(transformation(extent={{-24,-30},{-4,-10}})));
  Modelica.Blocks.Sources.Constant const(k=-5.139)
    annotation (Placement(transformation(extent={{48,-64},{28,-44}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T=0.08, initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-56,-58},{-36,-38}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-97,
          14}},                 color={255,0,255}));
  connect(constantVoltage.p, drive.pin_p)
    annotation (Line(points={{38,60},{32,60},{32,24}}, color={0,0,255}));
  connect(constantVoltage.n, drive.pin_n) annotation (Line(points={{58,60},{58,36},
          {49.8,36},{49.8,24}}, color={0,0,255}));
  connect(drive.tau, dutyCycle1.y)
    annotation (Line(points={{58,18},{66,18},{66,20},{75,20}},
                                               color={0,0,127}));
  connect(dutyCycle.y, firstOrder.u)
    annotation (Line(points={{-97,44},{-70,44}}, color={0,0,127}));
  connect(firstOrder.y, drive.dutyCycleIn) annotation (Line(points={{-47,44},{
          18,44},{18,18.6},{24,18.6}}, color={0,0,127}));
  connect(sinusoidal_Drive_45_1.rotateCW_In, rotateCW1.y)
    annotation (Line(points={{-20,-60},{-73,-60}}, color={255,0,255}));
  connect(constantVoltage1.p, sinusoidal_Drive_45_1.pin_p) annotation (Line(
        points={{-24,-20},{-28,-20},{-28,-44},{-12,-44},{-12,-50}}, color={0,0,
          255}));
  connect(constantVoltage1.n, sinusoidal_Drive_45_1.pin_n)
    annotation (Line(points={{-4,-20},{5.8,-20},{5.8,-50}}, color={0,0,255}));
  connect(const.y, sinusoidal_Drive_45_1.tau) annotation (Line(points={{27,-54},
          {20,-54},{20,-56},{14,-56}}, color={0,0,127}));
  connect(sinusoidal_Drive_45_1.dutyCycleIn, firstOrder1.y) annotation (Line(
        points={{-20,-55.4},{-27.5,-55.4},{-27.5,-48},{-35,-48}}, color={0,0,
          127}));
  connect(firstOrder1.u, dutyCycle2.y) annotation (Line(points={{-58,-48},{-64,
          -48},{-64,-28},{-75,-28}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Radau"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"),
    __Dymola_experimentSetupOutput(
      textual=true,
      doublePrecision=true,
      events=false),
    __Dymola_experimentFlags(
      Advanced(
        EvaluateAlsoTop=false,
        GenerateVariableDependencies=false,
        OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end AveragedSwitched_Drive45;
