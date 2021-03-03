within DrivetrainValidation.FMU.Thermal;
model Drive_45_FMU

  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{108,-26},{128,-6}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{114,28},{134,48}})));
  Battery.Packs.Adapters.FromBus.LossPower lossPower
    annotation (Placement(transformation(extent={{108,-48},{128,-28}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive
    annotation (Placement(transformation(extent={{28,28},{58,40}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=5,
    redeclare Battery.Packs.Scaled.Housings.IdealHousingCylindric housing,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={38,76})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature     [batteryPack.N_x, batteryPack.N_y]
    packBottomTemperatureBoundary(each T=293.15)
                                  "Fixed housing temperature boundary"
    annotation (Placement(transformation(extent={{226,58},{206,78}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_x, batteryPack.N_y]
    packTopTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary on the top"
    annotation (Placement(transformation(extent={{224,88},{204,108}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packLeftRightTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary left and right"
    annotation (Placement(transformation(extent={{226,22},{206,42}})));
public
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[batteryPack.N_y, batteryPack.N_z]
    packFrontBackTemperatureBoundary(each T=293.15)
    "Fixed housing temperature boundary front and back"
    annotation (Placement(transformation(extent={{222,-60},{202,-40}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW_In1
    annotation (Placement(transformation(extent={{-80,10},{-40,50}}),
        iconTransformation(extent={{-80,0},{-40,40}})));
  Modelica.Blocks.Interfaces.RealInput speed
    annotation (Placement(transformation(extent={{-80,70},{-40,110}}),
        iconTransformation(extent={{-80,60},{-40,100}})));
  Modelica.Blocks.Interfaces.RealInput tau
    "Accelerating torque acting at flange (= -flange.tau)"
    annotation (Placement(transformation(extent={{-80,-50},{-40,-10}}),
        iconTransformation(extent={{-80,-60},{-40,-20}})));
  Modelica.Blocks.Interfaces.RealOutput w
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{140,60},{160,80}}),
        iconTransformation(extent={{140,50},{160,70}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out
    annotation (Placement(transformation(extent={{140,90},{160,110}}),
        iconTransformation(extent={{140,80},{160,100}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{140,4},{160,24}})));
  Battery.Common.Interfaces.StateOfChargeOutput SOC
    annotation (Placement(transformation(extent={{140,-24},{160,-4}}),
        iconTransformation(extent={{140,-34},{160,-14}})));
  Modelica.Blocks.Interfaces.RealOutput V
    "Absolute voltage potential as output signal"
    annotation (Placement(transformation(extent={{140,32},{160,52}}),
        iconTransformation(extent={{140,22},{160,42}})));
  DymolaModels.Blocks.Interfaces.PowerOutput Ploss annotation (Placement(
        transformation(extent={{140,-50},{160,-30}}), iconTransformation(extent=
           {{140,-60},{160,-40}})));
protected
  Battery.Common.Interfaces.HousingHeatPort housingHeatPort1(
    N_x=batteryPack.N_x,
    N_y=batteryPack.N_y,
    N_z=batteryPack.N_z,
    pinHeatTransfer=false) annotation (Placement(transformation(extent={{144,100},
            {204,120}})));
equation
  connect(meanSOC.y,SOC)
    annotation (Line(points={{129,-16},{140,-16},{140,-14},{150,-14}},
                                                   color={0,127,0}));
  connect(potentialSensor.phi,V)
    annotation (Line(points={{135,38},{142,38},{142,42},{150,42}},
                                                 color={0,0,127}));
  connect(lossPower.y,Ploss)  annotation (Line(points={{129,-38},{140,-38},{140,
          -40},{150,-40}}, color={0,0,127}));
  connect(batteryPack.n,drive. pin_n) annotation (Line(points={{52,76},{56,76},
          {56,44},{51.8,44},{51.8,40}},
                              color={0,0,255}));
  connect(packTopTemperatureBoundary.port, housingHeatPort1.top) annotation (
      Line(points={{204,98},{174.063,98},{174.063,110.05}}, color={191,0,0}));
  connect(batteryPack.housingHeatPort, housingHeatPort1)
    annotation (Line(points={{38,90},{38,110},{174,110}}, color={255,0,0}));
  connect(packBottomTemperatureBoundary.port, housingHeatPort1.bottom)
    annotation (Line(points={{206,68},{174.063,68},{174.063,110.05}}, color={
          191,0,0}));
  connect(packLeftRightTemperatureBoundary.port, housingHeatPort1.left)
    annotation (Line(points={{206,32},{174.063,32},{174.063,110.05}}, color={
          191,0,0}));
  connect(packLeftRightTemperatureBoundary.port, housingHeatPort1.right)
    annotation (Line(points={{206,32},{174.063,32},{174.063,110.05}}, color={
          191,0,0}));
  connect(packFrontBackTemperatureBoundary.port, housingHeatPort1.front)
    annotation (Line(points={{202,-50},{174.063,-50},{174.063,110.05}}, color={
          191,0,0}));
  connect(packFrontBackTemperatureBoundary.port, housingHeatPort1.back)
    annotation (Line(points={{202,-50},{174.063,-50},{174.063,110.05}}, color={
          191,0,0}));
  connect(batteryPack.p, drive.pin_p) annotation (Line(points={{24,76},{14,76},
          {14,56},{34,56},{34,40}}, color={0,0,255}));
  connect(potentialSensor.p, drive.pin_p)
    annotation (Line(points={{114,38},{34,52},{34,40}}, color={0,0,255}));
  connect(drive.dutyCycleIn, speed) annotation (Line(points={{26,34.6},{-7,34.6},
          {-7,90},{-60,90}}, color={0,0,127}));
  connect(drive.rotateCW_In, rotateCW_In1)
    annotation (Line(points={{26,30},{-60,30}}, color={255,0,255}));
  connect(drive.tau, tau) annotation (Line(points={{60,34},{80,34},{80,-32},{
          -60,-32},{-60,-30}}, color={0,0,127}));
  connect(tau_out, drive.tau1) annotation (Line(points={{150,100},{96,100},{96,
          27},{54,27}}, color={0,0,127}));
  connect(w, drive.w1) annotation (Line(points={{150,70},{104,70},{104,14},{49,
          14},{49,27}}, color={0,0,127}));
  connect(i1, drive.i1) annotation (Line(points={{150,14},{132,14},{132,10},{45,
          10},{45,27}}, color={0,0,127}));
  connect(meanSOC.packBus, batteryPack.packBus) annotation (Line(
      points={{108,-16},{38,-16},{38,62}},
      color={83,189,255},
      thickness=0.5));
  connect(lossPower.packBus, batteryPack.packBus) annotation (Line(
      points={{108,-38},{38,-38},{38,62}},
      color={83,189,255},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-60},{140,120}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{-40,-60},{140,120}},
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
