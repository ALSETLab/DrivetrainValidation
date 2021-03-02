within DrivetrainValidation.Examples;
model Test

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=10000, startValue=true)
    annotation (Placement(transformation(extent={{-170,4},{-150,24}})));
  Machines.BrushlessDCDrivetrain.Trapezoidal_Drive_45
                                                  drive
    annotation (Placement(transformation(extent={{-26,12},{4,24}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-170,34},
            {-150,54}})));
  Modelica.Blocks.Sources.Constant dutyCycle1(k=3.139)
                                                    annotation (Placement(transformation(extent={{44,10},
            {24,30}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder(
    w=11.5,
    D=0.8,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-120,34},{-100,54}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={-4,58})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{102,30},{82,50}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{100,60},{80,80}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{102,-6},{82,14}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{102,-38},{82,-18}})));
  Modelica.Blocks.Sources.BooleanStep rotateCW1(startTime=10000, startValue=
        true)
    annotation (Placement(transformation(extent={{-180,-126},{-160,-106}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive1
    annotation (Placement(transformation(extent={{-36,-118},{-6,-106}})));
  Modelica.Blocks.Sources.Step     dutyCycle2(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-180,
            -96},{-160,-76}})));
  Modelica.Blocks.Sources.Constant dutyCycle3(k=3.139)
                                                    annotation (Placement(transformation(extent={{34,-120},
            {14,-100}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder1(
    w=11.5,
    D=0.8,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-130,-96},{-110,-76}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack1(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={-14,-72})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary1(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{92,-100},{72,-80}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary1(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{90,-70},{70,-50}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary1(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{92,-136},{72,-116}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary1(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{92,-168},{72,-148}})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{20,72},
            {80,92}})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort1(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{10,-58},
            {70,-38}})));
equation
  connect(drive.rotateCW_In,rotateCW. y) annotation (Line(points={{-28,14},{
          -149,14}},            color={255,0,255}));
  connect(drive.tau,dutyCycle1. y)
    annotation (Line(points={{6,18},{14,18},{14,20},{23,20}},
                                               color={0,0,127}));
  connect(dutyCycle.y,secondOrder. u)
    annotation (Line(points={{-149,44},{-122,44}},
                                                 color={0,0,127}));
  connect(secondOrder.y,drive. dutyCycleIn) annotation (Line(points={{-99,44},{
          -34,44},{-34,18.6},{-28,18.6}},
                                       color={0,0,127}));
  connect(batteryPack.p,drive. pin_p) annotation (Line(points={{-18,58},{-22,58},
          {-22,60},{-26,60},{-26,24},{-20,24}},
                                            color={0,0,255}));
  connect(batteryPack.n,drive. pin_n) annotation (Line(points={{10,58},{14,58},
          {14,24},{-2.2,24}}, color={0,0,255}));
  connect(packTopTemperatureBoundary.port,housingHeatPort. top)
    annotation (Line(points={{80,70},{50.0625,70},{50.0625,82.05}},        color={191,0,0}));
  connect(batteryPack.housingHeatPort,housingHeatPort)
    annotation (Line(points={{-4,72},{-4,82},{50,82}},         color={255,0,0}));
  connect(packBottomTemperatureBoundary.port,housingHeatPort. bottom)
    annotation (Line(points={{82,40},{50.0625,40},{50.0625,82.05}},                          color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. left)
    annotation (Line(points={{82,4},{50.0625,4},{50.0625,82.05}},                      color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. right)
    annotation (Line(points={{82,4},{50.0625,4},{50.0625,82.05}},            color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. back)
    annotation (Line(points={{82,-28},{50.0625,-28},{50.0625,82.05}},                                   color={191,0,0}));
  connect(drive1.rotateCW_In, rotateCW1.y)
    annotation (Line(points={{-38,-116},{-159,-116}}, color={255,0,255}));
  connect(drive1.tau, dutyCycle3.y) annotation (Line(points={{-4,-112},{4,-112},
          {4,-110},{13,-110}}, color={0,0,127}));
  connect(dutyCycle2.y, secondOrder1.u)
    annotation (Line(points={{-159,-86},{-132,-86}}, color={0,0,127}));
  connect(secondOrder1.y, drive1.dutyCycleIn) annotation (Line(points={{-109,
          -86},{-44,-86},{-44,-111.4},{-38,-111.4}}, color={0,0,127}));
  connect(batteryPack1.p, drive1.pin_p) annotation (Line(points={{-28,-72},{-32,
          -72},{-32,-70},{-36,-70},{-36,-106},{-30,-106}}, color={0,0,255}));
  connect(batteryPack1.n, drive1.pin_n) annotation (Line(points={{0,-72},{4,-72},
          {4,-106},{-12.2,-106}}, color={0,0,255}));
  connect(packTopTemperatureBoundary1.port, housingHeatPort1.top) annotation (
      Line(points={{70,-60},{40.0625,-60},{40.0625,-47.95}}, color={191,0,0}));
  connect(batteryPack1.housingHeatPort, housingHeatPort1)
    annotation (Line(points={{-14,-58},{-14,-48},{40,-48}}, color={255,0,0}));
  connect(packBottomTemperatureBoundary1.port, housingHeatPort1.bottom)
    annotation (Line(points={{72,-90},{40.0625,-90},{40.0625,-47.95}}, color={
          191,0,0}));
  connect(packLeftRightTemperatureBoundary1.port, housingHeatPort1.left)
    annotation (Line(points={{72,-126},{40.0625,-126},{40.0625,-47.95}}, color=
          {191,0,0}));
  connect(packLeftRightTemperatureBoundary1.port, housingHeatPort1.right)
    annotation (Line(points={{72,-126},{40.0625,-126},{40.0625,-47.95}}, color=
          {191,0,0}));
  connect(packFrontBackTemperatureBoundary1.port, housingHeatPort1.back)
    annotation (Line(points={{72,-158},{40.0625,-158},{40.0625,-47.95}}, color=
          {191,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-200,-180},{160,100}})), Icon(
        coordinateSystem(extent={{-200,-180},{160,100}})));
end Test;
