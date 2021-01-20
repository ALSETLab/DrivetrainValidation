within DrivetrainValidation.Examples;
model SharedBattery_45_4Motor

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Sources.Constant speed(k=100)
    annotation (Placement(transformation(extent={{-54,64},{-34,84}})));
  Modelica.Blocks.Sources.Constant speed1(k=300)
    annotation (Placement(transformation(extent={{-118,-76},{-98,-56}})));
  Modelica.Blocks.Sources.Constant tau(k=-0.0296)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  FMU.Drive_45_FMU_2       drive_fmu   annotation (Placement(transformation(extent={{28,-78},
            {60,-62}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=1.69e-6*drive_fmu.omega_out
        ^3) annotation (Placement(transformation(extent={{-52,-98},{-32,-78}})));
equation
  connect(drive_fmu.tau, realExpression.y) annotation (Line(points={{24.4444,
          -70.32},{-4,-70.32},{-4,-88},{-31,-88}}, color={0,0,127}));
  connect(drive_fmu.dutyCycle, speed1.y) annotation (Line(points={{24.4444,
          -65.2},{-35.7778,-65.2},{-35.7778,-66},{-97,-66}}, color={0,0,127}));
  connect(drive_fmu.rotationCW, rotateCW.y) annotation (Line(points={{24.4444,
          -76.72},{24.4444,0},{-99,0}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SharedBattery_45_4Motor;
