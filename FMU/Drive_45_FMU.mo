within DrivetrainValidation.FMU;
model Drive_45_FMU

  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive(inertia(J=3e-6))
    annotation (Placement(transformation(extent={{26,12},{56,24}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=0.4)                                annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={104,62})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In1
    annotation (Placement(transformation(extent={{-80,10},{-40,50}})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-80,44},{-40,84}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{86,-10},{94,-2}})));
  Modelica.Blocks.Interfaces.RealOutput w
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,48},{160,68}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    annotation (Placement(transformation(extent={{140,60},{160,80}})));
  RealExtend realExtend2
    annotation (Placement(transformation(extent={{74,8},{82,16}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,-4},{160,16}})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{108,-26},{128,-6}})));
  Battery.Common.Interfaces.StateOfChargeOutput SOC
    annotation (Placement(transformation(extent={{140,-26},{160,-6}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{114,18},{134,38}})));
  Modelica.Blocks.Interfaces.RealOutput V
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,18},{160,38}})));
equation
  connect(drive.pin_p, batteryPack.p) annotation (Line(points={{32,24},{32,62},{
          90,62}},           color={0,0,255}));
  connect(drive.pin_n, batteryPack.n) annotation (Line(points={{49.8,24},{49.8,42},
          {132,42},{132,62},{118,62}},          color={0,0,255}));
  connect(drive.rotateCW_In, rotateCW_In1)
    annotation (Line(points={{24,14},{-20,14},{-20,30},{-60,30}},
                                                color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{58,18},{110,18},{110,0},{
          -60,0}}, color={0,0,127}));
  connect(w,realExtend1. y[3]) annotation (Line(points={{150,58},{134,58},{134,
          -2},{136,-2},{136,-30},{100,-30},{100,-5.73333},{94.4,-5.73333}},
                                      color={0,0,127}));
  connect(drive.w1,realExtend1. u)
    annotation (Line(points={{47,11},{47,-6},{85.2,-6}},
                                                       color={0,0,127}));
  connect(drive.tau1, realExtend2.u) annotation (Line(points={{52,11},{52,6},{
          68,6},{68,12},{73.2,12}}, color={0,0,127}));
  connect(realExtend2.y[1], tau_out) annotation (Line(points={{82.4,
          11.7333},{136,11.7333},{136,70},{150,70}},
                                           color={0,0,127}));
  connect(i1, drive.i1) annotation (Line(points={{150,6},{86,6},{86,4},{43,4},{
          43,11}}, color={0,0,127}));
  connect(meanSOC.packBus, batteryPack.packBus) annotation (Line(
      points={{108,-16},{104,-16},{104,48}},
      color={83,189,255},
      thickness=0.5));
  connect(meanSOC.y, SOC)
    annotation (Line(points={{129,-16},{150,-16}}, color={0,127,0}));
  connect(potentialSensor.phi, V)
    annotation (Line(points={{135,28},{150,28}}, color={0,0,127}));
  connect(potentialSensor.p, batteryPack.p) annotation (Line(points={{114,28},{
          32,28},{32,62},{90,62}}, color={0,0,255}));
  connect(drive.dutyCycleIn, speed) annotation (Line(points={{24,18.6},{-12,
          18.6},{-12,64},{-60,64}}, color={0,0,127}));
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
