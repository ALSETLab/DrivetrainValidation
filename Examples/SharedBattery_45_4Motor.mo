within DrivetrainValidation.Examples;
model SharedBattery_45_4Motor

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Drive_45 drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell)
                                                 annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=270,
        origin={122,8})));
  Modelica.Blocks.Sources.Constant speed(k=500)
    annotation (Placement(transformation(extent={{-74,50},{-54,70}})));
  Modelica.Blocks.Sources.RealExpression speedInput(y=speed.y/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-120,68},{-100,88}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-40,
          14},{-40,0},{-99,0}}, color={255,0,255}));
  connect(drive.dutyCycleIn, dutyCycle.y)
    annotation (Line(points={{24,18.6},{-99,18.6},{-99,40}}, color={0,0,127}));
  connect(drive.pin_p, batteryPack.p) annotation (Line(points={{32,24},{32,42},
          {122,42},{122,22}}, color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,
          32},{88,32},{88,-16},{122,-16},{122,-6}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)),
    experiment(StopTime=1,__Dymola_NumberOfIntervals=1000),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SharedBattery_45_4Motor;
