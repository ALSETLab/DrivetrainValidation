within DrivetrainValidation.FMU;
model Drive_45_FMU

  Examples.Drive_45_varyingload
                    drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell)
                                                 annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={104,62})));
  Modelica.Blocks.Sources.RealExpression speedInput(y=speed/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-26,30},{-6,50}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In1
    annotation (Placement(transformation(extent={{-80,10},{-40,50}})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-80,44},{-40,84}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
equation
  connect(drive.pin_p, batteryPack.p) annotation (Line(points={{32,24},{32,62},{
          90,62}},           color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,42},
          {132,42},{132,62},{118,62}},          color={0,0,255}));
  connect(speedInput.y, drive.dutyCycleIn) annotation (Line(points={{-5,40},{10,
          40},{10,18.6},{24,18.6}},    color={0,0,127}));
  connect(drive.rotateCW_In, rotateCW_In1)
    annotation (Line(points={{24,14},{-20,14},{-20,30},{-60,30}},
                                                color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{58,18},{110,18},{110,0},{
          -60,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-20},{140,80}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-20},{140,80}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end Drive_45_FMU;
