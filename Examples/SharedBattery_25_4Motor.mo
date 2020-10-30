within DrivetrainValidation.Examples;
model SharedBattery_25_4Motor

  extends DymolaModels.Icons.Basic.Example;


  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-118,4},{-98,24}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,40},
            {-100,60}})));
  Drive_25_varyingload_2
           drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage
                                           batteryPack(V=60)
                                                 annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=270,
        origin={122,8})));
  Modelica.Blocks.Sources.RealExpression speedInput(y=speed.y/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-120,62},{-100,82}})));
  Modelica.Blocks.Sources.Constant speed(k=400)
    annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
  Modelica.Blocks.Sources.Constant tau(k=3.8964)
    annotation (Placement(transformation(extent={{-118,-28},{-98,-8}})));
  FMU.Drive_25_FMU_control drive_fmu   annotation (Placement(transformation(extent={{26,-72},{58,-56}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-97,
          14}},                 color={255,0,255}));
  connect(drive.pin_p, batteryPack.p) annotation (Line(points={{32,24},{32,42},{
          122,42},{122,22}}, color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,32},
          {88,32},{88,-16},{122,-16},{122,-6}}, color={0,0,255}));
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
