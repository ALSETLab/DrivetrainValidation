within DrivetrainValidation.Examples;
model AveragedSwitched_Drive45



  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=10000,                startValue=true)
    annotation (Placement(transformation(extent={{-118,4},{-98,24}})));
  Machines.BrushlessDCDrivetrain.Trapezoidal_Drive_45
                                                  drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.9,
    offset=0,
    startTime=5)                                    annotation (Placement(transformation(extent={{-118,34},
            {-98,54}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=60)
    annotation (Placement(transformation(extent={{38,50},{58,70}})));
  Modelica.Blocks.Sources.Constant dutyCycle1(k=-5.139)
                                                    annotation (Placement(transformation(extent={{96,8},{
            76,28}})));
  FMU.Trapezoidal trapezoidal
    annotation (Placement(transformation(extent={{32,-30},{50,-20}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=0.08, initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-68,34},{-48,54}})));
equation
  connect(drive.rotateCW_In, rotateCW.y) annotation (Line(points={{24,14},{-97,
          14}},                 color={255,0,255}));
  connect(constantVoltage.p, drive.pin_p)
    annotation (Line(points={{38,60},{32,60},{32,24}}, color={0,0,255}));
  connect(constantVoltage.n, drive.pin_n) annotation (Line(points={{58,60},{58,36},
          {49.8,36},{49.8,24}}, color={0,0,255}));
  connect(drive.tau, dutyCycle1.y)
    annotation (Line(points={{58,18},{75,18}}, color={0,0,127}));
  connect(trapezoidal.dutyCycle, drive.dutyCycleIn) annotation (Line(points={{
          30,-22},{4,-22},{4,44},{18,44},{18,18.6},{24,18.6}}, color={0,0,127}));
  connect(dutyCycle1.y, trapezoidal.tau) annotation (Line(points={{75,18},{66,
          18},{66,-6},{10,-6},{10,-25.2},{30,-25.2}}, color={0,0,127}));
  connect(trapezoidal.rotationCW, rotateCW.y) annotation (Line(points={{30,
          -29.2},{-12,-29.2},{-12,14},{-97,14}}, color={255,0,255}));
  connect(dutyCycle.y, firstOrder.u)
    annotation (Line(points={{-97,44},{-70,44}}, color={0,0,127}));
  connect(firstOrder.y, drive.dutyCycleIn) annotation (Line(points={{-47,44},{
          18,44},{18,18.6},{24,18.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-160,-100},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_fixedstepsize=1e-05,
      __Dymola_Algorithm="Rkfix4"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end AveragedSwitched_Drive45;
