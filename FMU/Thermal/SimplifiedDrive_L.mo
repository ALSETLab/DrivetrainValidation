within DrivetrainValidation.FMU.Thermal;
model SimplifiedDrive_L

  Machines.SimplifiedDC.SimplifiedDrive_L_Battery
                                                drive
    annotation (Placement(transformation(extent={{28,2},{50,14}})));
  Modelica.Blocks.Interfaces.BooleanInput rotationCW
    annotation (Placement(transformation(extent={{-80,40},{-40,80}})));
  Modelica.Blocks.Interfaces.RealInput omega
    annotation (Placement(transformation(extent={{-80,80},{-40,120}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-82,-20},{-42,20}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{140,100},{160,120}}),
        iconTransformation(extent={{140,100},{160,120}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,72},{160,92}}),
        iconTransformation(extent={{140,72},{160,92}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{90,56},{98,64}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{90,46},{98,54}})));
  Modelica.Blocks.Interfaces.RealOutput phi1
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,44},{160,64}}),
        iconTransformation(extent={{140,44},{160,64}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,16},{160,36}}),
        iconTransformation(extent={{140,16},{160,36}})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{68,-26},{88,-6}})));
  Battery.Common.Interfaces.StateOfChargeOutput SOC
    annotation (Placement(transformation(extent={{140,-12},{160,8}}),
        iconTransformation(extent={{140,-12},{160,8}})));
  Battery.Packs.Adapters.FromBus.LossPower lossPower
    annotation (Placement(transformation(extent={{68,-40},{88,-20}})));
  DymolaModels.Blocks.Interfaces.PowerOutput Ploss annotation (Placement(
        transformation(extent={{140,-40},{160,-20}}), iconTransformation(extent={{140,-40},
            {160,-20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{234,68},{214,88}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{232,98},{212,118}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{234,32},{214,52}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{230,-50},{210,-30}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={46,86})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{152,110},
            {212,130}})));
equation
  connect(realExtend1.y[3], omega_out) annotation (Line(points={{98.4,50.2667},
          {126,50.2667},{126,82},{150,82}},color={0,0,127}));
  connect(realExtend.y[3], tau_out) annotation (Line(points={{98.4,60.2667},{
          114,60.2667},{114,110},{150,110}},                 color={0,0,127}));
  connect(drive.tau_out, realExtend.u) annotation (Line(points={{51.2222,11.6},
          {72,11.6},{72,60},{89.2,60}}, color={0,0,127}));
  connect(drive.omega_out, realExtend1.u) annotation (Line(points={{51.2222,9.2},
          {74,9.2},{74,50},{89.2,50}},
                                     color={0,0,127}));
  connect(drive.tau_in, tau) annotation (Line(points={{26.4111,11.72},{-9.3,
          11.72},{-9.3,0},{-62,0}},   color={0,0,127}));
  connect(drive.rotateCW1, rotationCW) annotation (Line(points={{26.4111,3.8},{
          11.7,3.8},{11.7,60},{-60,60}},   color={255,0,255}));
  connect(drive.dutyCycleIn1, omega) annotation (Line(points={{26.4111,7.64},{
          -8.0111,7.64},{-8.0111,100},{-60,100}},color={0,0,127}));
  connect(drive.phi1, phi1) annotation (Line(points={{51.2222,6.8},{122,6.8},{
          122,54},{150,54}},  color={0,0,127}));
  connect(drive.i1, i1) annotation (Line(points={{51.2222,2.96},{80,2.96},{80,2},
          {102,2},{102,26},{150,26}},
                                    color={0,0,127}));
  connect(meanSOC.y, SOC)
    annotation (Line(points={{89,-16},{120,-16},{120,-2},{150,-2}},
                                                  color={0,127,0}));
  connect(lossPower.y,Ploss)  annotation (Line(points={{89,-30},{150,-30}},
                           color={0,0,127}));
  connect(meanSOC.packBus, lossPower.packBus) annotation (Line(
      points={{68,-16},{46,-16},{46,-30},{68,-30}},
      color={83,189,255},
      thickness=0.5));
  connect(packTopTemperatureBoundary.port,housingHeatPort. top)
    annotation (Line(points={{212,108},{182.063,108},{182.063,120.05}},    color={191,0,0}));
  connect(packBottomTemperatureBoundary.port,housingHeatPort. bottom)
    annotation (Line(points={{214,78},{182.063,78},{182.063,120.05}},                        color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. left)
    annotation (Line(points={{214,42},{182.063,42},{182.063,120.05}},                  color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. right)
    annotation (Line(points={{214,42},{182.063,42},{182.063,120.05}},        color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. front)
    annotation (Line(points={{210,-40},{182.063,-40},{182.063,120.05}},      color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. back)
    annotation (Line(points={{210,-40},{182.063,-40},{182.063,120.05}},                                 color={191,0,0}));
  connect(batteryPack.p, drive.pin_p1) annotation (Line(points={{32,86},{28,86},
          {28,22},{32.8889,22},{32.8889,14}}, color={0,0,255}));
  connect(batteryPack.n, drive.pin_n1) annotation (Line(points={{60,86},{66,86},
          {66,60},{45.1111,60},{45.1111,14}}, color={0,0,255}));
  connect(batteryPack.housingHeatPort, housingHeatPort)
    annotation (Line(points={{46,100},{46,120},{182,120}}, color={191,0,0}));
  connect(batteryPack.packBus, lossPower.packBus) annotation (Line(
      points={{46,72},{46,-30},{68,-30}},
      color={83,189,255},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-40},{140,120}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-40},{140,120}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end SimplifiedDrive_L;
