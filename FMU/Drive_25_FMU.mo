within DrivetrainValidation.FMU;
model Drive_25_FMU


  Machines.BrushlessDCDrivetrain.Drive_25_Outputs drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Modelica.Blocks.Sources.RealExpression speedInput(y=speed/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-26,30},{-6,50}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In1
    annotation (Placement(transformation(extent={{-80,10},{-40,50}})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-80,44},{-40,84}})));
  Modelica.Blocks.Interfaces.RealOutput w
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{140,30},{160,50}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{76,4},{84,12}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{86,-4},{94,4}})));
  Modelica.Blocks.Interfaces.RealInput tau_in
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));

  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=60)
    annotation (Placement(transformation(extent={{28,48},{48,68}})));
equation
  connect(speedInput.y, drive.dutyCycleIn) annotation (Line(points={{-5,40},{10,
          40},{10,18.6},{24,18.6}},    color={0,0,127}));
  connect(drive.rotateCW_In, rotateCW_In1)
    annotation (Line(points={{24,14},{-20,14},{-20,30},{-60,30}},
                                                color={255,0,255}));
  connect(w, realExtend1.y[3]) annotation (Line(points={{150,0},{122,0},{122,
          0.266667},{94.4,0.266667}}, color={0,0,127}));
  connect(realExtend.y[3], tau_out) annotation (Line(points={{84.4,8.26667},{
          116,8.26667},{116,40},{150,40}}, color={0,0,127}));
  connect(drive.tau1, realExtend.u)
    annotation (Line(points={{52,11},{52,8},{75.2,8}}, color={0,0,127}));
  connect(drive.w1, realExtend1.u)
    annotation (Line(points={{47,11},{47,0},{85.2,0}}, color={0,0,127}));
  connect(drive.tau, tau_in) annotation (Line(points={{58,18},{62,18},{62,0},{
          -60,0}}, color={0,0,127}));
  connect(constantVoltage.p, drive.pin_p) annotation (Line(points={{28,58},{24,
          58},{24,24},{32,24}}, color={0,0,255}));
  connect(constantVoltage.n, drive.pin_n)
    annotation (Line(points={{48,58},{49.8,58},{49.8,24}}, color={0,0,255}));
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
end Drive_25_FMU;
