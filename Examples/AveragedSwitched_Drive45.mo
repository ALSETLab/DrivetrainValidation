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
  Modelica.Blocks.Sources.Constant dutyCycle1(k=3.139)
                                                    annotation (Placement(transformation(extent={{96,10},
            {76,30}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder(
    w=11.5,
    D=0.8,                                                 initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-68,34},{-48,54}})));
  Modelica.Blocks.Sources.BooleanStep rotateCW1(startTime=1000, startValue=true)
    annotation (Placement(transformation(extent={{-94,-70},{-74,-50}})));
  Modelica.Blocks.Sources.Step     dutyCycle2(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-96,-38},
            {-76,-18}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_45_Outputs
    annotation (Placement(transformation(extent={{-18,-62},{12,-50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=60)
    annotation (Placement(transformation(extent={{-24,-30},{-4,-10}})));
  Modelica.Blocks.Sources.Constant const(k=3.139)
    annotation (Placement(transformation(extent={{48,-64},{28,-44}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={48,58})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{154,30},{134,50}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{152,60},{132,80}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{154,-6},{134,14}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{150,-88},{130,-68}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder1(
    w=11.5,
    D=0.8,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-60,-52},{-40,-32}})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{72,72},
            {132,92}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-97,
          14}},                 color={255,0,255}));
  connect(drive.tau, dutyCycle1.y)
    annotation (Line(points={{58,18},{66,18},{66,20},{75,20}},
                                               color={0,0,127}));
  connect(dutyCycle.y, secondOrder.u)
    annotation (Line(points={{-97,44},{-70,44}}, color={0,0,127}));
  connect(secondOrder.y, drive.dutyCycleIn) annotation (Line(points={{-47,44},{
          18,44},{18,18.6},{24,18.6}}, color={0,0,127}));
  connect(drive_45_Outputs.rotateCW_In, rotateCW1.y)
    annotation (Line(points={{-20,-60},{-73,-60}}, color={255,0,255}));
  connect(constantVoltage1.p, drive_45_Outputs.pin_p) annotation (Line(points={
          {-24,-20},{-28,-20},{-28,-44},{-12,-44},{-12,-50}}, color={0,0,255}));
  connect(constantVoltage1.n, drive_45_Outputs.pin_n)
    annotation (Line(points={{-4,-20},{5.8,-20},{5.8,-50}}, color={0,0,255}));
  connect(const.y, drive_45_Outputs.tau) annotation (Line(points={{27,-54},{20,
          -54},{20,-56},{14,-56}}, color={0,0,127}));
  connect(batteryPack.p, drive.pin_p) annotation (Line(points={{34,58},{30,58},
          {30,60},{26,60},{26,24},{32,24}}, color={0,0,255}));
  connect(batteryPack.n, drive.pin_n) annotation (Line(points={{62,58},{66,58},
          {66,24},{49.8,24}}, color={0,0,255}));
  connect(packTopTemperatureBoundary.port,housingHeatPort. top)
    annotation (Line(points={{132,70},{102.063,70},{102.063,82.05}},       color={191,0,0}));
  connect(batteryPack.housingHeatPort,housingHeatPort)
    annotation (Line(points={{48,72},{48,82},{102,82}},        color={255,0,0}));
  connect(packBottomTemperatureBoundary.port,housingHeatPort. bottom)
    annotation (Line(points={{134,40},{102.063,40},{102.063,82.05}},                         color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. left)
    annotation (Line(points={{134,4},{102.063,4},{102.063,82.05}},                     color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. right)
    annotation (Line(points={{134,4},{102.063,4},{102.063,82.05}},           color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. front)
    annotation (Line(points={{130,-78},{102.063,-78},{102.063,82.05}},       color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. back)
    annotation (Line(points={{130,-78},{102.063,-78},{102.063,82.05}},                                  color={191,0,0}));
  connect(dutyCycle2.y, secondOrder1.u) annotation (Line(points={{-75,-28},{-68,
          -28},{-68,-42},{-62,-42}}, color={0,0,127}));
  connect(drive_45_Outputs.dutyCycleIn, secondOrder1.y) annotation (Line(points
        ={{-20,-55.4},{-32,-55.4},{-32,-42},{-39,-42}}, color={0,0,127}));
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
