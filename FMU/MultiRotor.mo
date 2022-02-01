within DrivetrainValidation.FMU;
model MultiRotor
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_1
    annotation (Placement(transformation(extent={{-64,16},{-34,28}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_2
    annotation (Placement(transformation(extent={{40,18},{70,30}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_3
    annotation (Placement(transformation(extent={{-64,-70},{-34,-58}})));
  Machines.BrushlessDCDrivetrain.Drive_45_Outputs drive_4
    annotation (Placement(transformation(extent={{40,-70},{70,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=tau_in1)
    annotation (Placement(transformation(extent={{-2,12},{-22,32}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=tau_in2)
    annotation (Placement(transformation(extent={{98,14},{78,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=tau_in3)
    annotation (Placement(transformation(extent={{0,-74},{-20,-54}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=tau_in4)
    annotation (Placement(transformation(extent={{98,-74},{78,-54}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=rotateCW1)
    annotation (Placement(transformation(extent={{-96,8},{-76,28}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=
        rotateCW3)
    annotation (Placement(transformation(extent={{-94,-78},{-74,-58}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y=
        rotateCW2)
    annotation (Placement(transformation(extent={{12,10},{32,30}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y=
        rotateCW4)
    annotation (Placement(transformation(extent={{10,-78},{30,-58}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=dutyCycleIn1)
    annotation (Placement(transformation(extent={{-96,22},{-76,42}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=dutyCycleIn3)
    annotation (Placement(transformation(extent={{-94,-64},{-74,-44}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=dutyCycleIn2)
    annotation (Placement(transformation(extent={{12,24},{32,44}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=dutyCycleIn4)
    annotation (Placement(transformation(extent={{10,-62},{30,-42}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=20,
    N_verticalElements=20,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=1)                                  annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={4,-4})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{16,-40},{36,-20}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=drive_1.w1)
    annotation (Placement(transformation(extent={{104,70},{124,90}})));
  RealExtend realExtend
    annotation (Placement(transformation(extent={{134,76},{142,84}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=drive_2.w1)
    annotation (Placement(transformation(extent={{104,54},{124,74}})));
  RealExtend realExtend1
    annotation (Placement(transformation(extent={{134,60},{142,68}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=drive_3.w1)
    annotation (Placement(transformation(extent={{104,34},{124,54}})));
  RealExtend realExtend2
    annotation (Placement(transformation(extent={{134,40},{142,48}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=drive_4.w1)
    annotation (Placement(transformation(extent={{104,16},{124,36}})));
  RealExtend realExtend3
    annotation (Placement(transformation(extent={{134,22},{142,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression12(y=drive_1.tau1)
    annotation (Placement(transformation(extent={{104,0},{124,20}})));
  RealExtend realExtend4
    annotation (Placement(transformation(extent={{134,6},{142,14}})));
  Modelica.Blocks.Sources.RealExpression realExpression13(y=drive_2.tau1)
    annotation (Placement(transformation(extent={{104,-16},{124,4}})));
  RealExtend realExtend5
    annotation (Placement(transformation(extent={{134,-10},{142,-2}})));
  Modelica.Blocks.Sources.RealExpression realExpression14(y=drive_3.tau1)
    annotation (Placement(transformation(extent={{104,-36},{124,-16}})));
  RealExtend realExtend6
    annotation (Placement(transformation(extent={{134,-30},{142,-22}})));
  Modelica.Blocks.Sources.RealExpression realExpression15(y=drive_4.tau1)
    annotation (Placement(transformation(extent={{104,-54},{124,-34}})));
  RealExtend realExtend7
    annotation (Placement(transformation(extent={{134,-48},{142,-40}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{-44,-38},{-24,-18}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{-42,-14},{-22,6}})));
  Modelica.Blocks.Sources.RealExpression realExpression16(y=currentSensor.i)
    annotation (Placement(transformation(extent={{128,-74},{148,-54}})));
  Modelica.Blocks.Sources.RealExpression realExpression17(y=
        potentialSensor.phi)
    annotation (Placement(transformation(extent={{128,-88},{148,-68}})));
  Modelica.Blocks.Sources.RealExpression realExpression18(y=meanSOC.y)
    annotation (Placement(transformation(extent={{128,-102},{148,-82}})));
  Modelica.Blocks.Interfaces.RealOutput w1
    annotation (Placement(transformation(extent={{180,70},{200,90}})));
  Modelica.Blocks.Interfaces.RealOutput w2
    annotation (Placement(transformation(extent={{180,54},{200,74}})));
  Modelica.Blocks.Interfaces.RealOutput w3
    annotation (Placement(transformation(extent={{180,36},{200,56}})));
  Modelica.Blocks.Interfaces.RealOutput w4
    annotation (Placement(transformation(extent={{180,18},{200,38}})));
  Modelica.Blocks.Interfaces.RealOutput tau1
    annotation (Placement(transformation(extent={{180,0},{200,20}})));
  Modelica.Blocks.Interfaces.RealOutput tau2
    annotation (Placement(transformation(extent={{180,-16},{200,4}})));
  Modelica.Blocks.Interfaces.RealOutput tau3
    annotation (Placement(transformation(extent={{180,-36},{200,-16}})));
  Modelica.Blocks.Interfaces.RealOutput tau4
    annotation (Placement(transformation(extent={{180,-54},{200,-34}})));
  Modelica.Blocks.Interfaces.RealOutput i "Value of Real output"
    annotation (Placement(transformation(extent={{180,-74},{200,-54}})));
  Modelica.Blocks.Interfaces.RealOutput V "Value of Real output"
    annotation (Placement(transformation(extent={{180,-88},{200,-68}})));
  Modelica.Blocks.Interfaces.RealOutput SOC "Value of Real output"
    annotation (Placement(transformation(extent={{180,-102},{200,-82}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{38,-30},{58,-10}})));
  Modelica.Blocks.Interfaces.RealInput tau_in1
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-64,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in2
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-20,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={4,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in3
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={24,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={72,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in4
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={140,120})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn1
    "Ratio of on-time to period duration" annotation (Placement(
        transformation(extent={{-140,60},{-100,100}}), iconTransformation(
          extent={{-140,60},{-100,100}})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn2
    "Ratio of on-time to period duration" annotation (Placement(
        transformation(extent={{-140,8},{-100,48}}), iconTransformation(
          extent={{-140,8},{-100,48}})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn3
    "Ratio of on-time to period duration" annotation (Placement(
        transformation(extent={{-140,-50},{-100,-10}}),
        iconTransformation(extent={{-140,-50},{-100,-10}})));
  DymolaModels.Blocks.Interfaces.NormalizedInput dutyCycleIn4
    "Ratio of on-time to period duration" annotation (Placement(
        transformation(extent={{-140,-100},{-100,-60}}),
        iconTransformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-64,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW2 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-20,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={6,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW3 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={20,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={72,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW4 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={62,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={140,-120})));
equation
  connect(drive_1.tau, realExpression.y)
    annotation (Line(points={{-32,22},{-23,22}}, color={0,0,127}));
  connect(drive_2.tau, realExpression1.y)
    annotation (Line(points={{72,24},{77,24}}, color={0,0,127}));
  connect(drive_3.tau, realExpression2.y)
    annotation (Line(points={{-32,-64},{-21,-64}}, color={0,0,127}));
  connect(drive_4.tau, realExpression3.y)
    annotation (Line(points={{72,-64},{77,-64}}, color={0,0,127}));
  connect(drive_1.rotateCW_In, booleanExpression.y)
    annotation (Line(points={{-66,18},{-75,18}}, color={255,0,255}));
  connect(drive_3.rotateCW_In, booleanExpression1.y)
    annotation (Line(points={{-66,-68},{-73,-68}}, color={255,0,255}));
  connect(drive_2.rotateCW_In, booleanExpression2.y)
    annotation (Line(points={{38,20},{33,20}}, color={255,0,255}));
  connect(drive_4.rotateCW_In, booleanExpression3.y)
    annotation (Line(points={{38,-68},{31,-68}}, color={255,0,255}));
  connect(realExpression4.y, drive_1.dutyCycleIn) annotation (Line(points
        ={{-75,32},{-72,32},{-72,22.6},{-66,22.6}}, color={0,0,127}));
  connect(realExpression5.y, drive_3.dutyCycleIn) annotation (Line(points
        ={{-73,-54},{-68,-54},{-68,-63.4},{-66,-63.4}}, color={0,0,127}));
  connect(drive_2.dutyCycleIn, realExpression6.y) annotation (Line(points
        ={{38,24.6},{38,34},{33,34}}, color={0,0,127}));
  connect(realExpression8.y, drive_4.dutyCycleIn) annotation (Line(points
        ={{31,-52},{32,-52},{32,-63.4},{38,-63.4}}, color={0,0,127}));
  connect(meanSOC.packBus,batteryPack. packBus) annotation (Line(
      points={{16,-30},{4,-30},{4,-18}},
      color={83,189,255},
      thickness=0.5));
  connect(drive_3.pin_p, drive_1.pin_p)
    annotation (Line(points={{-58,-58},{-58,28}}, color={0,0,255}));
  connect(drive_2.pin_p, drive_1.pin_p) annotation (Line(points={{46,30},
          {46,50},{-58,50},{-58,28}}, color={0,0,255}));
  connect(drive_4.pin_p, drive_1.pin_p) annotation (Line(points={{46,-58},
          {46,-38},{-58,-38},{-58,28}}, color={0,0,255}));
  connect(realExpression7.y, realExtend.u)
    annotation (Line(points={{125,80},{133.2,80}}, color={0,0,127}));
  connect(realExpression9.y, realExtend1.u)
    annotation (Line(points={{125,64},{133.2,64}}, color={0,0,127}));
  connect(realExtend2.u, realExpression10.y)
    annotation (Line(points={{133.2,44},{125,44}}, color={0,0,127}));
  connect(realExtend3.u, realExpression11.y)
    annotation (Line(points={{133.2,26},{125,26}}, color={0,0,127}));
  connect(realExpression12.y, realExtend4.u)
    annotation (Line(points={{125,10},{133.2,10}}, color={0,0,127}));
  connect(realExpression13.y, realExtend5.u)
    annotation (Line(points={{125,-6},{133.2,-6}}, color={0,0,127}));
  connect(realExtend6.u, realExpression14.y)
    annotation (Line(points={{133.2,-26},{125,-26}}, color={0,0,127}));
  connect(realExtend7.u, realExpression15.y)
    annotation (Line(points={{133.2,-44},{125,-44}}, color={0,0,127}));
  connect(batteryPack.p, currentSensor.n)
    annotation (Line(points={{-10,-4},{-22,-4}}, color={0,0,255}));
  connect(currentSensor.p, drive_1.pin_p) annotation (Line(points={{-42,
          -4},{-58,-4},{-58,28}}, color={0,0,255}));
  connect(potentialSensor.p, drive_1.pin_p) annotation (Line(points={{-44,
          -28},{-58,-28},{-58,28}}, color={0,0,255}));
  connect(tau4, tau4)
    annotation (Line(points={{190,-44},{190,-44}}, color={0,0,127}));
  connect(realExpression16.y, i)
    annotation (Line(points={{149,-64},{190,-64}}, color={0,0,127}));
  connect(realExpression17.y, V)
    annotation (Line(points={{149,-78},{190,-78}}, color={0,0,127}));
  connect(realExpression18.y, SOC)
    annotation (Line(points={{149,-92},{190,-92}}, color={0,0,127}));
  connect(w1, realExtend.y[1]) annotation (Line(points={{190,80},{166,80},
          {166,79.7333},{142.4,79.7333}}, color={0,0,127}));
  connect(w2, realExtend1.y[1]) annotation (Line(points={{190,64},{166,64},
          {166,63.7333},{142.4,63.7333}}, color={0,0,127}));
  connect(w3, realExtend2.y[1]) annotation (Line(points={{190,46},{142.4,
          46},{142.4,43.7333}}, color={0,0,127}));
  connect(w4, realExtend3.y[1]) annotation (Line(points={{190,28},{170,28},
          {170,26},{148,26},{148,25.7333},{142.4,25.7333}}, color={0,0,
          127}));
  connect(tau1, realExtend4.y[1]) annotation (Line(points={{190,10},{166,
          10},{166,9.73333},{142.4,9.73333}}, color={0,0,127}));
  connect(realExtend5.y[1], tau2) annotation (Line(points={{142.4,
          -6.26667},{166,-6.26667},{166,-6},{190,-6}}, color={0,0,127}));
  connect(realExtend6.y[1], tau3) annotation (Line(points={{142.4,
          -26.2667},{166,-26.2667},{166,-26},{190,-26}}, color={0,0,127}));
  connect(realExtend7.y[1], tau4) annotation (Line(points={{142.4,
          -44.2667},{166,-44.2667},{166,-44},{190,-44}}, color={0,0,127}));
  connect(batteryPack.n, ground.p) annotation (Line(points={{18,-4},{48,
          -4},{48,-10}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{180,100}})), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{180,100}})));
end MultiRotor;
