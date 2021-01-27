within DrivetrainValidation.Examples;
model SimplifiedMotor


  FMU.SimplifiedDC.SimplifiedDrive_fmu simplifiedDrive_fmu
    annotation (Placement(transformation(extent={{70,62},{98,82}})));
  Modelica.Blocks.Sources.Constant const(k=300)
    annotation (Placement(transformation(extent={{12,68},{32,88}})));
equation
  connect(simplifiedDrive_fmu.omega, const.y)
    annotation (Line(points={{66.8889,78},{33,78}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{0,0},{160,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{0,0},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SimplifiedMotor;
