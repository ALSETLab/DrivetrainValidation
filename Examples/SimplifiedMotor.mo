within DrivetrainValidation.Examples;
model SimplifiedMotor


  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000, startValue=true)
    annotation (Placement(transformation(extent={{6,38},{26,58}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.0533,
    offset=0.33,
    startTime=5)                                    annotation (Placement(transformation(extent={{6,68},{
            26,88}})));
  FMU.Thermal.Trapezoidal trapezoidal
    annotation (Placement(transformation(extent={{122,60},{140,74}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder(
    w=11.5,
    D=0.8,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{52,68},{72,88}})));
  FMU.Thermal.Drive_45_FMU drive_45_FMU1
    annotation (Placement(transformation(extent={{122,30},{140,48}})));
  FMU.SimplifiedDC.SimplifiedDrive_L_fmu
                                simplifiedDrive_L_fmu
    annotation (Placement(transformation(extent={{122,6},{140,22}})));
  FMU.Trapezoidal_Battery trapezoidal_Battery
    annotation (Placement(transformation(extent={{122,80},{140,90}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=0.000173989880442095*
        trapezoidal.w^2)
    annotation (Placement(transformation(extent={{6,10},{26,30}})));
equation
  connect(rotateCW.y, trapezoidal.rotateCW_In1) annotation (Line(points={{27,48},
          {50,48},{50,46},{54,46},{54,67},{120,67}}, color={255,0,255}));
  connect(dutyCycle.y, secondOrder.u)
    annotation (Line(points={{27,78},{50,78}}, color={0,0,127}));
  connect(secondOrder.y, trapezoidal.speed) annotation (Line(points={{73,78},{
          90,78},{90,72},{120,72},{120,72.25}}, color={0,0,127}));
  connect(drive_45_FMU1.speed, trapezoidal.speed) annotation (Line(points={{120,
          44},{90,44},{90,72},{120,72},{120,72.25}}, color={0,0,127}));
  connect(drive_45_FMU1.rotateCW_In1, trapezoidal.rotateCW_In1) annotation (
      Line(points={{120,38},{86,38},{86,46},{54,46},{54,67},{120,67}}, color={
          255,0,255}));
  connect(simplifiedDrive_L_fmu.omega, trapezoidal.speed) annotation (Line(
        points={{120,18.8},{112,18.8},{112,22},{110,22},{110,44},{90,44},{90,72},
          {120,72},{120,72.25}}, color={0,0,127}));
  connect(simplifiedDrive_L_fmu.rotationCW, trapezoidal.rotateCW_In1)
    annotation (Line(points={{120,7.28},{106,7.28},{106,38},{86,38},{86,46},{54,
          46},{54,67},{120,67}}, color={255,0,255}));
  connect(trapezoidal_Battery.rotationCW, trapezoidal.rotateCW_In1) annotation (
     Line(points={{120,80.8},{108,66},{108,67},{120,67}}, color={255,0,255}));
  connect(trapezoidal_Battery.dutyCycle, trapezoidal.speed) annotation (Line(
        points={{120,88},{100,88},{100,72},{120,72},{120,72.25}}, color={0,0,
          127}));
  connect(drive_45_FMU1.tau, trapezoidal_Battery.tau) annotation (Line(points={
          {120,32},{114,32},{114,30},{108,30},{108,84.8},{120,84.8}}, color={0,
          0,127}));
  connect(drive_45_FMU1.tau, trapezoidal.tau) annotation (Line(points={{120,32},
          {98,32},{98,62},{120,62},{120,61.75}}, color={0,0,127}));
  connect(realExpression.y, simplifiedDrive_L_fmu.tau) annotation (Line(points=
          {{27,20},{104,20},{104,13.68},{120,13.68}}, color={0,0,127}));
  connect(drive_45_FMU1.tau, simplifiedDrive_L_fmu.tau) annotation (Line(points=
         {{120,32},{98,32},{98,20},{104,20},{104,13.68},{120,13.68}}, color={0,
          0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{0,0},{160,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{0,0},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Radau"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SimplifiedMotor;
