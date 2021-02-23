within DrivetrainValidation.Examples;
model CompareMotor



  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000,                 startValue=true)
    annotation (Placement(transformation(extent={{-156,20},{-136,40}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-158,52},
            {-138,72}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_45_Outputs
    annotation (Placement(transformation(extent={{-80,28},{-50,40}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=60)
    annotation (Placement(transformation(extent={{-86,60},{-66,80}})));
  Modelica.Blocks.Sources.Constant const(k=-5.139)
    annotation (Placement(transformation(extent={{-14,24},{-34,44}})));
  Modelica.Blocks.Sources.BooleanStep rotateCW1(startTime=1000, startValue=true)
    annotation (Placement(transformation(extent={{-156,-86},{-136,-66}})));
  Modelica.Blocks.Sources.Step     dutyCycle1(
    height=0.5,
    offset=0.3,
    startTime=5)                                    annotation (Placement(transformation(extent={{-156,
            -54},{-136,-34}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V=60)
    annotation (Placement(transformation(extent={{-76,-22},{-56,-2}})));
  Modelica.Blocks.Sources.Constant const1(k=-5.139)
    annotation (Placement(transformation(extent={{-156,-24},{-136,-4}})));
  Machines.SimplifiedDC.SimplifiedDrive_L_Battery simplifiedDrive_L_Battery
    annotation (Placement(transformation(extent={{-82,-48},{-64,-38}})));
equation
  connect(drive_45_Outputs.rotateCW_In, rotateCW.y)
    annotation (Line(points={{-82,30},{-135,30}}, color={255,0,255}));
  connect(drive_45_Outputs.dutyCycleIn, dutyCycle.y) annotation (Line(points={{-82,
          34.6},{-126,34.6},{-126,62},{-137,62}},     color={0,0,127}));
  connect(constantVoltage.p, drive_45_Outputs.pin_p) annotation (Line(points={{
          -86,70},{-90,70},{-90,46},{-74,46},{-74,40}}, color={0,0,255}));
  connect(constantVoltage.n, drive_45_Outputs.pin_n) annotation (Line(points={{
          -66,70},{-56.2,70},{-56.2,40}}, color={0,0,255}));
  connect(const.y, drive_45_Outputs.tau)
    annotation (Line(points={{-35,34},{-48,34}}, color={0,0,127}));
  connect(simplifiedDrive_L_Battery.rotateCW1, rotateCW1.y) annotation (Line(
        points={{-83.3,-46.5},{-83.3,-76},{-135,-76}}, color={255,0,255}));
  connect(constantVoltage1.p, simplifiedDrive_L_Battery.pin_p1) annotation (
      Line(points={{-76,-12},{-86,-12},{-86,-28},{-78,-28},{-78,-38}}, color={0,
          0,255}));
  connect(constantVoltage1.n, simplifiedDrive_L_Battery.pin_n1) annotation (
      Line(points={{-56,-12},{-50,-12},{-50,-26},{-70,-26},{-70,-38},{-68,-38}},
        color={0,0,255}));
  connect(dutyCycle1.y, simplifiedDrive_L_Battery.dutyCycleIn1)
    annotation (Line(points={{-135,-44},{-83.3,-43.3}}, color={0,0,127}));
  connect(const1.y, simplifiedDrive_L_Battery.tau_in) annotation (Line(points={
          {-135,-14},{-88,-14},{-88,-39.9},{-83.3,-39.9}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{0,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{0,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end CompareMotor;
