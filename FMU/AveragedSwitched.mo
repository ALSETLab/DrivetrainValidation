within DrivetrainValidation.FMU;
model AveragedSwitched

  Machines.BrushlessDCDrivetrain.AveragedSwitched_Drive_45 drive
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={104,62})));
  Modelica.Blocks.Interfaces.BooleanInput rotationCW
    annotation (Placement(transformation(extent={{-80,-32},{-40,8}})));
  Modelica.Blocks.Interfaces.RealInput dutyCycle
    annotation (Placement(transformation(extent={{-80,40},{-40,80}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,8},{-40,48}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{140,50},{160,70}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,30},{160,50}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{88,16},{96,24}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{88,-4},{96,4}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{50,-22},{70,-2}})));
  Modelica.Blocks.Interfaces.RealOutput phi1
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,-6},{160,14}})));
  Modelica.Blocks.Interfaces.RealOutput SOC
    annotation (Placement(transformation(extent={{140,-20},{160,0}})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{114,-20},{134,0}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{42,52},{62,72}})));
  Modelica.Blocks.Interfaces.RealOutput i
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,10},{160,30}})));
equation
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,42},
          {132,42},{132,62},{118,62}},          color={0,0,255}));
  connect(drive.rotateCW_In, rotationCW) annotation (Line(points={{24,14},{-20,
          14},{-20,-12},{-60,-12}}, color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{58,18},{66,18},{66,28},{-60,
          28}},    color={0,0,127}));
  connect(drive.w1, realExtend1.u)
    annotation (Line(points={{47,11},{47,0},{87.2,0}}, color={0,0,127}));
  connect(realExtend1.y[3], omega_out) annotation (Line(points={{96.4,0.266667},
          {126,0.266667},{126,40},{150,40}},
                                           color={0,0,127}));
  connect(realExtend.u, drive.tau1) annotation (Line(points={{87.2,20},{78,20},
          {78,8},{52,8},{52,11}}, color={0,0,127}));
  connect(realExtend.y[3], tau_out) annotation (Line(points={{96.4,20.2667},{
          118,20.2667},{118,24},{136,24},{136,60},{150,60}}, color={0,0,127}));
  connect(dutyCycle, drive.dutyCycleIn) annotation (Line(points={{-60,60},{-18,
          60},{-18,18.6},{24,18.6}}, color={0,0,127}));
  connect(drive.pin_p, potentialSensor.p)
    annotation (Line(points={{32,24},{32,-12},{50,-12}}, color={0,0,255}));
  connect(potentialSensor.phi, phi1) annotation (Line(points={{71,-12},{108,-12},
          {108,4},{150,4}}, color={0,0,127}));
  connect(SOC, meanSOC.y)
    annotation (Line(points={{150,-10},{135,-10}}, color={0,0,127}));
  connect(meanSOC.packBus, batteryPack.packBus) annotation (Line(
      points={{114,-10},{104,-10},{104,48}},
      color={83,189,255},
      thickness=0.5));
  connect(batteryPack.p, currentSensor.n)
    annotation (Line(points={{90,62},{62,62}}, color={0,0,255}));
  connect(currentSensor.p, drive.pin_p)
    annotation (Line(points={{42,62},{32,62},{32,24}}, color={0,0,255}));
  connect(currentSensor.i, i) annotation (Line(points={{52,51},{76,51},{76,20},
          {150,20}}, color={0,0,127}));
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
end AveragedSwitched;
