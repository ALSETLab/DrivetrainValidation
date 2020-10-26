within DrivetrainValidation.FMU;
model Drive_25_FMU_2

  Examples.Drive_25_varyingload_2
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
  Modelica.Blocks.Sources.RealExpression speedInput(y=omega/drive.machine.data.w_nom)
    annotation (Placement(transformation(extent={{-26,30},{-6,50}})));
  Modelica.Blocks.Interfaces.BooleanInput rotationCW
    annotation (Placement(transformation(extent={{-80,-32},{-40,8}})));
  Modelica.Blocks.Interfaces.RealInput omega
    annotation (Placement(transformation(extent={{-80,40},{-40,80}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,8},{-40,48}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{140,48},{160,68}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,-4},{160,16}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{88,16},{96,24}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{88,-4},{96,4}})));
equation
  connect(drive.pin_p, batteryPack.p) annotation (Line(points={{32,24},{32,62},{
          90,62}},           color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,42},
          {132,42},{132,62},{118,62}},          color={0,0,255}));
  connect(speedInput.y, drive.dutyCycleIn) annotation (Line(points={{-5,40},{10,
          40},{10,18.6},{24,18.6}},    color={0,0,127}));
  connect(drive.rotateCW_In, rotationCW) annotation (Line(points={{24,14},{-20,
          14},{-20,-12},{-60,-12}}, color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{58,18},{66,18},{66,28},{-60,
          28}},    color={0,0,127}));
  connect(drive.w1, realExtend1.u)
    annotation (Line(points={{47,11},{47,0},{87.2,0}}, color={0,0,127}));
  connect(realExtend1.y[3], omega_out) annotation (Line(points={{96.4,0.266667},
          {126,0.266667},{126,6},{150,6}}, color={0,0,127}));
  connect(realExtend.u, drive.tau1) annotation (Line(points={{87.2,20},{78,20},
          {78,8},{52,8},{52,11}}, color={0,0,127}));
  connect(realExtend.y[3], tau_out) annotation (Line(points={{96.4,20.2667},{
          118,20.2667},{118,24},{136,24},{136,58},{150,58}}, color={0,0,127}));
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
end Drive_25_FMU_2;
