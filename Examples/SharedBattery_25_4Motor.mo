within DrivetrainValidation.Examples;
model SharedBattery_25_4Motor

  extends DymolaModels.Icons.Basic.Example;


  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=10000,                startValue=true)
    annotation (Placement(transformation(extent={{-118,4},{-98,24}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,40},
            {-100,60}})));
  Machines.Drive_25_Outputs drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Modelica.Blocks.Sources.RealExpression speedInput(y=speed.y/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-120,62},{-100,82}})));
  Modelica.Blocks.Sources.Constant speed(k=400)
    annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
  Modelica.Blocks.Sources.Constant tau(k=3.8964)
    annotation (Placement(transformation(extent={{-118,-28},{-98,-8}})));
  FMU.Drive_25_FMU_control drive_fmu   annotation (Placement(transformation(extent={{26,-72},{58,-56}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=50,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell)
                                                 annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={94,66})));
  Machines.Drive_45_Outputs drive1
    annotation (Placement(transformation(extent={{82,-36},{112,-24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack1(
    N_serialCells=15,
    N_parallelCells=500,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={104,0})));
  Modelica.Blocks.Sources.Constant tau1(k=5.12)
    annotation (Placement(transformation(extent={{4,-14},{24,6}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-97,
          14}},                 color={255,0,255}));
  connect(speedInput.y, drive.dutyCycleIn) annotation (Line(points={{-99,72},{
          10,72},{10,18.6},{24,18.6}}, color={0,0,127}));
  connect(tau.y, drive.tau) annotation (Line(points={{-97,-18},{70,-18},{70,18},
          {58,18}}, color={0,0,127}));
  connect(drive_fmu.omega, speed.y) annotation (Line(points={{22.4444,-59.2},{
          -99,-59.2},{-99,-60}},
                             color={0,0,127}));
  connect(drive_fmu.tau, drive.tau) annotation (Line(points={{22.4444,-64.32},{
          -22,-64.32},{-22,-18},{70,-18},{70,18},{58,18}},
                                                       color={0,0,127}));
  connect(drive_fmu.rotationCW, rotateCW.y) annotation (Line(points={{22.4444,
          -70.72},{-74,-70.72},{-74,14},{-97,14}},
                                           color={255,0,255}));
  connect(batteryPack.p, drive.pin_p)
    annotation (Line(points={{80,66},{32,66},{32,24}}, color={0,0,255}));
  connect(batteryPack.n, drive.pin_n) annotation (Line(points={{108,66},{118,66},
          {118,34},{49.8,34},{49.8,24}}, color={0,0,255}));
  connect(batteryPack1.p, drive1.pin_p) annotation (Line(points={{90,
          1.77636e-15},{88,1.77636e-15},{88,-24},{88,-24}}, color={0,0,255}));
  connect(batteryPack1.n, drive1.pin_n) annotation (Line(points={{118,
          1.77636e-15},{120,1.77636e-15},{120,0},{124,0},{124,-16},{105.8,-16},
          {105.8,-24}}, color={0,0,255}));
  connect(drive1.rotateCW_In, rotateCW.y) annotation (Line(points={{80,-34},{
          -10,-34},{-10,14},{-97,14}}, color={255,0,255}));
  connect(drive1.tau, drive.tau) annotation (Line(points={{114,-30},{132,-30},{
          132,18},{58,18}}, color={0,0,127}));
  connect(drive1.dutyCycleIn, tau1.y) annotation (Line(points={{80,-29.4},{52,
          -29.4},{52,-4},{25,-4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SharedBattery_25_4Motor;
