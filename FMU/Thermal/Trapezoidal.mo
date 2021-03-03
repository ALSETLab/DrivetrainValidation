within DrivetrainValidation.FMU.Thermal;
model Trapezoidal

  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In1
    annotation (Placement(transformation(extent={{-80,0},{-40,40}}),
        iconTransformation(extent={{-80,0},{-40,40}})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-80,60},{-40,100}}),
        iconTransformation(extent={{-80,60},{-40,100}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,-60},{-40,-20}}),
        iconTransformation(extent={{-80,-60},{-40,-20}})));
  Modelica.Blocks.Interfaces.RealOutput w
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,50},{160,70}}),
        iconTransformation(extent={{140,50},{160,70}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    annotation (Placement(transformation(extent={{140,80},{160,100}}),
        iconTransformation(extent={{140,80},{160,100}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,-6},{160,14}})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{108,-36},{128,-16}})));
  Battery.Common.Interfaces.StateOfChargeOutput SOC
    annotation (Placement(transformation(extent={{140,-34},{160,-14}}),
        iconTransformation(extent={{140,-34},{160,-14}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{114,18},{134,38}})));
  Modelica.Blocks.Interfaces.RealOutput V
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,22},{160,42}}),
        iconTransformation(extent={{140,22},{160,42}})));
  Battery.Packs.Adapters.FromBus.LossPower lossPower
    annotation (Placement(transformation(extent={{108,-58},{128,-38}})));
  DymolaModels.Blocks.Interfaces.PowerOutput Ploss annotation (Placement(
        transformation(extent={{140,-60},{160,-40}}), iconTransformation(extent=
           {{140,-60},{160,-40}})));
  Machines.BrushlessDCDrivetrain.Trapezoidal_Drive_45
                                                  drive
    annotation (Placement(transformation(extent={{28,18},{58,30}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={38,66})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{226,48},{206,68}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{224,78},{204,98}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{226,12},{206,32}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{222,-70},{202,-50}})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{144,90},
            {204,110}})));
equation
  connect(meanSOC.y, SOC)
    annotation (Line(points={{129,-26},{140,-26},{140,-24},{150,-24}},
                                                   color={0,127,0}));
  connect(potentialSensor.phi, V)
    annotation (Line(points={{135,28},{142,28},{142,32},{150,32}},
                                                 color={0,0,127}));
  connect(lossPower.y, Ploss) annotation (Line(points={{129,-48},{140,-48},{140,
          -50},{150,-50}}, color={0,0,127}));
  connect(batteryPack.n,drive. pin_n) annotation (Line(points={{52,66},{56,66},
          {56,34},{51.8,34},{51.8,30}},
                              color={0,0,255}));
  connect(packTopTemperatureBoundary.port,housingHeatPort. top)
    annotation (Line(points={{204,88},{174.063,88},{174.063,100.05}},      color={191,0,0}));
  connect(batteryPack.housingHeatPort,housingHeatPort)
    annotation (Line(points={{38,80},{38,100},{174,100}},      color={255,0,0}));
  connect(packBottomTemperatureBoundary.port,housingHeatPort. bottom)
    annotation (Line(points={{206,58},{174.063,58},{174.063,100.05}},                        color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. left)
    annotation (Line(points={{206,22},{174.063,22},{174.063,100.05}},                  color={191,0,0}));
  connect(packLeftRightTemperatureBoundary.port,housingHeatPort. right)
    annotation (Line(points={{206,22},{174.063,22},{174.063,100.05}},        color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. front)
    annotation (Line(points={{202,-60},{174.063,-60},{174.063,100.05}},      color={191,0,0}));
  connect(packFrontBackTemperatureBoundary.port,housingHeatPort. back)
    annotation (Line(points={{202,-60},{174.063,-60},{174.063,100.05}},                                 color={191,0,0}));
  connect(batteryPack.p, drive.pin_p) annotation (Line(points={{24,66},{14,66},
          {14,46},{34,46},{34,30}}, color={0,0,255}));
  connect(potentialSensor.p, drive.pin_p)
    annotation (Line(points={{114,28},{34,42},{34,30}}, color={0,0,255}));
  connect(drive.dutyCycleIn, speed) annotation (Line(points={{26,24.6},{-7,24.6},
          {-7,80},{-60,80}}, color={0,0,127}));
  connect(drive.rotateCW_In, rotateCW_In1)
    annotation (Line(points={{26,20},{-60,20}}, color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{60,24},{80,24},{80,-42},{
          -60,-42},{-60,-40}}, color={0,0,127}));
  connect(tau_out, drive.tau1) annotation (Line(points={{150,90},{96,90},{96,17},
          {54,17}}, color={0,0,127}));
  connect(w, drive.w1) annotation (Line(points={{150,60},{104,60},{104,4},{49,4},
          {49,17}}, color={0,0,127}));
  connect(i1, drive.i1) annotation (Line(points={{150,4},{132,4},{132,0},{46.6,
          0},{46.6,17}}, color={0,0,127}));
  connect(meanSOC.packBus, batteryPack.packBus) annotation (Line(
      points={{108,-26},{38,-26},{38,52}},
      color={83,189,255},
      thickness=0.5));
  connect(lossPower.packBus, batteryPack.packBus) annotation (Line(
      points={{108,-48},{38,-48},{38,52}},
      color={83,189,255},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-60},{140,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-60},{140,100}},
        initialScale=0.1)),
    experiment(
      StopTime=150,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end Trapezoidal;
