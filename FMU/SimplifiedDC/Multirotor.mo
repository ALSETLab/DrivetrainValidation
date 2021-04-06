within DrivetrainValidation.FMU.SimplifiedDC;
model Multirotor
  Machines.SimplifiedDC.SimplifiedDrive_L_Battery_notgrounded drive_2
    annotation (Placement(transformation(extent={{-42,30},{-24,40}})));
  Machines.SimplifiedDC.SimplifiedDrive_L_Battery_notgrounded drive_1
    annotation (Placement(transformation(extent={{26,30},{44,40}})));
  Machines.SimplifiedDC.SimplifiedDrive_L_Battery_notgrounded drive_3
    annotation (Placement(transformation(extent={{-46,-38},{-28,-28}})));
  Machines.SimplifiedDC.SimplifiedDrive_L_Battery_notgrounded drive_4
    annotation (Placement(transformation(extent={{30,-36},{48,-26}})));
  Battery.Packs.Scaled.ScaledPackCylindric batteryPack(
    N_serialCells=15,
    N_parallelCells=20,
    N_verticalElements=5,
    redeclare Battery.Cells.Variants.DemoCell3dDAF cell,
    SOC_init=0.3)                                annotation (Placement(transformation(extent={{-14,-14},
            {14,14}},
        rotation=0,
        origin={-6,80})));
  Battery.Packs.Adapters.FromBus.MeanSOC meanSOC
    annotation (Placement(transformation(extent={{0,46},{20,66}})));
  Modelica.Blocks.Interfaces.RealInput tau_in2
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-30,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in1
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-68,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in4
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={64,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={80,120})));
  Modelica.Blocks.Interfaces.RealInput tau_in3
    "Accelerating torque acting at flange (= -flange.tau)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={20,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={24,120})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=tau_in2)
    annotation (Placement(transformation(extent={{-84,32},{-70,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=tau_in1)
    annotation (Placement(transformation(extent={{-2,32},{12,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=tau_in3)
    annotation (Placement(transformation(extent={{-80,-24},{-66,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=tau_in4)
    annotation (Placement(transformation(extent={{-10,-28},{4,-14}})));
  Modelica.Blocks.Interfaces.RealInput PWM1 "PWM" annotation (Placement(
        transformation(extent={{-140,60},{-100,100}}), iconTransformation(
          extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput PWM2 "PWM" annotation (Placement(
        transformation(extent={{-140,4},{-100,44}}), iconTransformation(extent=
            {{-140,4},{-100,44}})));
  Modelica.Blocks.Interfaces.RealInput PWM3 "PWM" annotation (Placement(
        transformation(extent={{-140,-48},{-100,-8}}), iconTransformation(
          extent={{-140,-48},{-100,-8}})));
  Modelica.Blocks.Interfaces.RealInput PWM4 "PWM" annotation (Placement(
        transformation(extent={{-140,-100},{-100,-60}}), iconTransformation(
          extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=PWM2)
    annotation (Placement(transformation(extent={{-84,20},{-70,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=PWM1)
    annotation (Placement(transformation(extent={{-2,20},{12,34}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=PWM3)
    annotation (Placement(transformation(extent={{-80,-44},{-66,-30}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=PWM4)
    annotation (Placement(transformation(extent={{-10,-40},{4,-26}})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-74,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW2 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-26,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW3 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={20,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={28,-120})));
  Modelica.Blocks.Interfaces.BooleanInput rotateCW4 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={66,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-120})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=rotateCW1)
    annotation (Placement(transformation(extent={{-2,10},{12,24}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=rotateCW2)
    annotation (Placement(transformation(extent={{-84,8},{-70,22}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y=rotateCW3)
    annotation (Placement(transformation(extent={{-80,-58},{-66,-44}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y=rotateCW4)
    annotation (Placement(transformation(extent={{-10,-54},{4,-40}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{52,60},{72,80}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out1
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,82},{120,102}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out2
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,64},{120,84}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out3
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,48},{120,68}})));
  Modelica.Blocks.Interfaces.RealOutput omega_out4
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out1
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,8},{120,28}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out2
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,-8},{120,12}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out3
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,-26},{120,-6}})));
  Modelica.Blocks.Interfaces.RealOutput tau_out4
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,-44},{120,-24}})));
  Modelica.Blocks.Interfaces.RealOutput V
    "Absolute angular velocity of flange_a as output signal"
    annotation (Placement(transformation(extent={{100,-66},{120,-46}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=drive_1.omega_out)
    annotation (Placement(transformation(extent={{74,84},{88,98}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=drive_2.omega_out)
    annotation (Placement(transformation(extent={{74,68},{88,82}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=drive_3.omega_out)
    annotation (Placement(transformation(extent={{74,50},{88,64}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=drive_4.omega_out)
    annotation (Placement(transformation(extent={{74,32},{88,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression12(y=drive_1.tau_out)
    annotation (Placement(transformation(extent={{76,12},{90,26}})));
  Modelica.Blocks.Sources.RealExpression realExpression13(y=drive_2.tau_out)
    annotation (Placement(transformation(extent={{76,-6},{90,8}})));
  Modelica.Blocks.Sources.RealExpression realExpression14(y=drive_3.tau_out)
    annotation (Placement(transformation(extent={{78,-24},{92,-10}})));
  Modelica.Blocks.Sources.RealExpression realExpression15(y=drive_4.tau_out)
    annotation (Placement(transformation(extent={{80,-42},{94,-28}})));
  Battery.Common.Interfaces.StateOfChargeOutput SOC
    annotation (Placement(transformation(extent={{100,-92},{120,-72}})));
  Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor
    annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  Modelica.Blocks.Sources.RealExpression realExpression16(y=potentialSensor.phi)
    annotation (Placement(transformation(extent={{80,-64},{94,-50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{-50,70},{-30,90}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{100,-104},{120,-84}})));
equation
  connect(meanSOC.packBus, batteryPack.packBus) annotation (Line(
      points={{0,56},{-6,56},{-6,66}},
      color={83,189,255},
      thickness=0.5));
  connect(drive_1.pin_n1, batteryPack.n)
    annotation (Line(points={{40,40},{40,80},{8,80}}, color={0,0,255}));
  connect(drive_2.tau_in, realExpression.y) annotation (Line(points={{-43.3,
          38.1},{-43.3,39},{-69.3,39}}, color={0,0,127}));
  connect(drive_1.tau_in, realExpression1.y)
    annotation (Line(points={{24.7,38.1},{12.7,39}}, color={0,0,127}));
  connect(drive_3.tau_in, realExpression2.y) annotation (Line(points={{-47.3,
          -29.9},{-58,-29.9},{-58,-17},{-65.3,-17}}, color={0,0,127}));
  connect(drive_4.tau_in, realExpression3.y) annotation (Line(points={{28.7,
          -27.9},{28.7,-28},{16,-28},{16,-21},{4.7,-21}}, color={0,0,127}));
  connect(drive_4.pin_n1, batteryPack.n) annotation (Line(points={{44,-26},{52,
          -26},{52,80},{8,80}}, color={0,0,255}));
  connect(drive_3.pin_n1, batteryPack.n) annotation (Line(points={{-32,-28},{
          -32,0},{52,0},{52,80},{8,80}}, color={0,0,255}));
  connect(drive_2.pin_p1, drive_3.pin_p1) annotation (Line(points={{-38,40},{
          -38,48},{-54,48},{-54,-14},{-42,-14},{-42,-28}}, color={0,0,255}));
  connect(drive_4.pin_p1, drive_3.pin_p1) annotation (Line(points={{34,-26},{36,
          -26},{36,-14},{-42,-14},{-42,-28}}, color={0,0,255}));
  connect(drive_1.pin_p1, drive_3.pin_p1) annotation (Line(points={{30,40},{30,
          48},{-54,48},{-54,-14},{-42,-14},{-42,-28}}, color={0,0,255}));
  connect(drive_2.pin_n1, batteryPack.n) annotation (Line(points={{-28,40},{-28,
          46},{40,46},{40,80},{8,80}}, color={0,0,255}));
  connect(realExpression4.y, drive_2.dutyCycleIn1) annotation (Line(points={{
          -69.3,27},{-48,27},{-48,34.7},{-43.3,34.7}}, color={0,0,127}));
  connect(drive_1.dutyCycleIn1, realExpression5.y) annotation (Line(points={{
          24.7,34.7},{16,34.7},{16,27},{12.7,27}}, color={0,0,127}));
  connect(drive_3.dutyCycleIn1, realExpression6.y) annotation (Line(points={{
          -47.3,-33.3},{-58,-33.3},{-58,-37},{-65.3,-37}}, color={0,0,127}));
  connect(drive_4.dutyCycleIn1, realExpression7.y)
    annotation (Line(points={{28.7,-31.3},{4.7,-33}}, color={0,0,127}));
  connect(booleanExpression.y, drive_1.rotateCW1) annotation (Line(points={{
          12.7,17},{24.7,17},{24.7,31.5}}, color={255,0,255}));
  connect(booleanExpression1.y, drive_2.rotateCW1) annotation (Line(points={{
          -69.3,15},{-46,15},{-46,31.5},{-43.3,31.5}}, color={255,0,255}));
  connect(booleanExpression2.y, drive_3.rotateCW1) annotation (Line(points={{
          -65.3,-51},{-52,-51},{-52,-36.5},{-47.3,-36.5}}, color={255,0,255}));
  connect(drive_4.rotateCW1, booleanExpression3.y) annotation (Line(points={{
          28.7,-34.5},{28,-34.5},{28,-36},{18,-36},{18,-47},{4.7,-47}}, color={
          255,0,255}));
  connect(ground.p, batteryPack.n)
    annotation (Line(points={{62,80},{8,80}}, color={0,0,255}));
  connect(omega_out1, realExpression8.y)
    annotation (Line(points={{110,92},{88.7,91}}, color={0,0,127}));
  connect(omega_out2, realExpression9.y)
    annotation (Line(points={{110,74},{110,75},{88.7,75}}, color={0,0,127}));
  connect(omega_out3, realExpression10.y)
    annotation (Line(points={{110,58},{88.7,57}}, color={0,0,127}));
  connect(omega_out4, realExpression11.y)
    annotation (Line(points={{110,40},{88.7,39}}, color={0,0,127}));
  connect(tau_out1, realExpression12.y)
    annotation (Line(points={{110,18},{110,19},{90.7,19}}, color={0,0,127}));
  connect(tau_out2, realExpression13.y)
    annotation (Line(points={{110,2},{90.7,1}}, color={0,0,127}));
  connect(tau_out3, realExpression14.y)
    annotation (Line(points={{110,-16},{92.7,-17}}, color={0,0,127}));
  connect(tau_out4, realExpression15.y)
    annotation (Line(points={{110,-34},{94.7,-35}}, color={0,0,127}));
  connect(meanSOC.y, SOC) annotation (Line(points={{21,56},{68,56},{68,-82},{
          110,-82}}, color={0,127,0}));
  connect(V, realExpression16.y) annotation (Line(points={{110,-56},{102,-56},{
          102,-57},{94.7,-57}}, color={0,0,127}));
  connect(currentSensor.p, drive_3.pin_p1) annotation (Line(points={{-50,80},{
          -54,80},{-54,-14},{-42,-14},{-42,-28}}, color={0,0,255}));
  connect(potentialSensor.p, drive_3.pin_p1) annotation (Line(points={{-46,60},
          {-54,60},{-54,-14},{-42,-14},{-42,-28}}, color={0,0,255}));
  connect(currentSensor.n, batteryPack.p)
    annotation (Line(points={{-30,80},{-20,80}}, color={0,0,255}));
  connect(currentSensor.i, i1) annotation (Line(points={{-40,69},{-88,69},{-88,
          -94},{110,-94}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
      Diagram(coordinateSystem(preserveAspectRatio=false)));
end Multirotor;
