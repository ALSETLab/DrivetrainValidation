within DrivetrainValidation.Examples;
model SharedBattery_45_4Motor

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Sources.Step     speed(
    height=100,
    offset=0,
    startTime=1)
    annotation (Placement(transformation(extent={{-54,64},{-34,84}})));
  Modelica.Blocks.Sources.Constant speed1(k=300)
    annotation (Placement(transformation(extent={{-118,-76},{-98,-56}})));
  Modelica.Blocks.Sources.Constant tau(k=-0.0296)
    annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
  FMU.Drive_45_FMU_2       drive_45_FMU_2_1(    batteryPack(N_parallelCells=500))
    annotation (Placement(transformation(extent={{24,-38},{82,-6}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.1)
    annotation (Placement(transformation(extent={{-14,34},{6,54}})));
equation
  connect(drive_45_FMU_2_1.rotationCW, rotateCW.y) annotation (Line(points={{
          17.5556,-35.44},{0,-35.44},{0,0},{-99,0}}, color={255,0,255}));
  connect(drive_45_FMU_2_1.tau, tau.y) annotation (Line(points={{17.5556,-22.64},
          {-99,-22.64},{-99,-30}}, color={0,0,127}));
  connect(speed.y, firstOrder.u) annotation (Line(points={{-33,74},{-22,74},{
          -22,44},{-16,44}}, color={0,0,127}));
  connect(firstOrder.y, drive_45_FMU_2_1.speed) annotation (Line(points={{7,44},
          {16,44},{16,-8},{17.5556,-8},{17.5556,-12.4}}, color={0,0,127}));
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
