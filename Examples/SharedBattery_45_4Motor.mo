within DrivetrainValidation.Examples;
model SharedBattery_45_4Motor

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{-100,0},
            {-80,20}})));
  Modelica.Blocks.Sources.Constant tau(k=-0.0296)
    annotation (Placement(transformation(extent={{122,-10},{102,10}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs
                           drive_45_Outputs
    annotation (Placement(transformation(extent={{-14,-10},{36,10}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={14,46})));
equation
  connect(drive_45_Outputs.tau, tau.y) annotation (Line(points={{39.3333,0},{
          101,0}},                 color={0,0,127}));
  connect(rotateCW.y, drive_45_Outputs.rotateCW_In) annotation (Line(points={{
          -79,-30},{-26,-30},{-26,-6.66667},{-17.3333,-6.66667}}, color={255,0,
          255}));
  connect(drive_45_Outputs.dutyCycleIn, dutyCycle.y) annotation (Line(points={{
          -17.3333,1},{-74,1},{-74,10},{-79,10}}, color={0,0,127}));
  connect(batteryPack.p, drive_45_Outputs.pin_p)
    annotation (Line(points={{0,46},{-4,46},{-4,10}}, color={0,0,255}));
  connect(batteryPack.n, drive_45_Outputs.pin_n) annotation (Line(points={{28,
          46},{34,46},{34,20},{25.6667,20},{25.6667,10}}, color={0,0,255}));
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
