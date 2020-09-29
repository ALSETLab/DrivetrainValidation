within ARMAC.Examples;
model DirectionChangeAveraged

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(                 startTime=0.5, startValue=true)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Drive drive annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=10,
    N_parallelCells=2,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell)
                                                 annotation (Placement(transformation(extent={{28,44},
            {56,72}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-40,
          14},{-40,0},{-99,0}}, color={255,0,255}));
  connect(drive.dutyCycleIn, dutyCycle.y)
    annotation (Line(points={{24,18.6},{-99,18.6},{-99,40}}, color={0,0,127}));
  connect(batteryPack.p, drive.pin_p) annotation (Line(points={{28,58},{12,58},
          {12,28},{32,28},{32,24}}, color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{50,24},
          {50,36},{70,36},{70,58},{56,58}}, color={0,0,255}));
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
end DirectionChangeAveraged;
