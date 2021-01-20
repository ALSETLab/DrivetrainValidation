within DrivetrainValidation.Examples;
model SimplifiedMotor

  extends DymolaModels.Icons.Basic.Example;

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000, startValue=false)
    annotation (Placement(transformation(extent={{40,10},{60,30}})));
  Modelica.Blocks.Sources.Constant dutyCycle(k=0.9) annotation (Placement(transformation(extent={{42,70},
            {62,90}})));
  Modelica.Blocks.Sources.Constant tau(k=-3.8)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  FMU.SimplifiedDrive_fmu simplifiedDrive_fmu
    annotation (Placement(transformation(extent={{116,34},{136,48}})));
equation
  connect(rotateCW.y, simplifiedDrive_fmu.rotationCW) annotation (Line(points={{61,20},
          {104,20},{104,35.12},{113.778,35.12}},         color={255,0,255}));
  connect(tau.y, simplifiedDrive_fmu.tau) annotation (Line(points={{61,50},{86,
          50},{86,40.72},{113.778,40.72}}, color={0,0,127}));
  connect(dutyCycle.y, simplifiedDrive_fmu.omega) annotation (Line(points={{63,80},
          {88,80},{88,45.2},{113.778,45.2}},     color={0,0,127}));
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
