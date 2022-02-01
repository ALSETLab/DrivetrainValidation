within DrivetrainValidation.Examples;
model MultiRotor_Simulation
  FMU.MultiRotor multiRotor
    annotation (Placement(transformation(extent={{-50,-34},{54,38}})));
  Modelica.Blocks.Sources.Constant const(k=22.1)
    annotation (Placement(transformation(extent={{-96,68},{-76,88}})));
  Modelica.Blocks.Sources.Constant const1(k=0.9)
    annotation (Placement(transformation(extent={{-96,22},{-76,42}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression
    annotation (Placement(transformation(extent={{-94,-80},{-74,-60}})));
equation
  connect(const.y, multiRotor.tau_in1) annotation (Line(points={{-75,78},
          {-36.6286,78},{-36.6286,45.2}}, color={0,0,127}));
  connect(const.y, multiRotor.tau_in2) annotation (Line(points={{-75,78},
          {-11.3714,78},{-11.3714,45.2}}, color={0,0,127}));
  connect(const.y, multiRotor.tau_in3) annotation (Line(points={{-75,78},
          {13.8857,78},{13.8857,45.2}}, color={0,0,127}));
  connect(const.y, multiRotor.tau_in4) annotation (Line(points={{-75,78},
          {39.1429,78},{39.1429,45.2}}, color={0,0,127}));
  connect(const1.y, multiRotor.dutyCycleIn1) annotation (Line(points={{
          -75,32},{-68,32},{-68,30.8},{-57.4286,30.8}}, color={0,0,127}));
  connect(multiRotor.dutyCycleIn2, multiRotor.dutyCycleIn1) annotation (
      Line(points={{-57.4286,12.08},{-70,12.08},{-70,32},{-68,32},{-68,
          30.8},{-57.4286,30.8}}, color={0,0,127}));
  connect(multiRotor.dutyCycleIn3, multiRotor.dutyCycleIn1) annotation (
      Line(points={{-57.4286,-8.8},{-70,-8.8},{-70,32},{-68,32},{-68,30.8},
          {-57.4286,30.8}}, color={0,0,127}));
  connect(multiRotor.dutyCycleIn4, multiRotor.dutyCycleIn1) annotation (
      Line(points={{-57.4286,-26.8},{-70,-26.8},{-70,30},{-68,30},{-68,
          30.8},{-57.4286,30.8}}, color={0,0,127}));
  connect(booleanExpression.y, multiRotor.rotateCW4) annotation (Line(
        points={{-73,-70},{40,-70},{40,-41.2},{39.1429,-41.2}}, color={
          255,0,255}));
  connect(multiRotor.rotateCW3, multiRotor.rotateCW4) annotation (Line(
        points={{13.8857,-41.2},{13.8857,-70},{40,-70},{40,-41.2},{
          39.1429,-41.2}}, color={255,0,255}));
  connect(multiRotor.rotateCW2, multiRotor.rotateCW4) annotation (Line(
        points={{-10.6286,-41.2},{-10.6286,-70},{40,-70},{40,-41.2},{
          39.1429,-41.2}}, color={255,0,255}));
  connect(multiRotor.rotateCW1, multiRotor.rotateCW4) annotation (Line(
        points={{-36.6286,-41.2},{-36.6286,-70},{40,-70},{40,-41.2},{
          39.1429,-41.2}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end MultiRotor_Simulation;
