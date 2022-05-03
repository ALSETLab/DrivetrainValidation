within DrivetrainValidation.Examples;
model MultiRotor_Simulation
  FMU.MultiRotor_ColdPlate
                 multiRotor_ColdPlate
    annotation (Placement(transformation(extent={{-50,-34},{54,38}})));
  Modelica.Blocks.Sources.Constant const(k=-22.1)
    annotation (Placement(transformation(extent={{-96,68},{-76,88}})));
  Modelica.Blocks.Sources.Constant const1(k=0.5)
    annotation (Placement(transformation(extent={{-96,22},{-76,42}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression
    annotation (Placement(transformation(extent={{-94,-80},{-74,-60}})));
equation
  connect(const.y, multiRotor_ColdPlate.tau_in1) annotation (Line(points=
          {{-75,78},{-36.6286,78},{-36.6286,44.5455}}, color={0,0,127}));
  connect(const.y, multiRotor_ColdPlate.tau_in2) annotation (Line(points=
          {{-75,78},{-11.3714,78},{-11.3714,44.5455}}, color={0,0,127}));
  connect(const.y, multiRotor_ColdPlate.tau_in3) annotation (Line(points=
          {{-75,78},{13.8857,78},{13.8857,44.5455}}, color={0,0,127}));
  connect(const.y, multiRotor_ColdPlate.tau_in4) annotation (Line(points=
          {{-75,78},{39.1429,78},{39.1429,44.5455}}, color={0,0,127}));
  connect(const1.y, multiRotor_ColdPlate.dutyCycleIn1) annotation (Line(
        points={{-75,32},{-68,32},{-68,31.4545},{-57.4286,31.4545}},
        color={0,0,127}));
  connect(multiRotor_ColdPlate.dutyCycleIn2, multiRotor_ColdPlate.dutyCycleIn1)
    annotation (Line(points={{-57.4286,14.4364},{-70,14.4364},{-70,32},{
          -68,32},{-68,31.4545},{-57.4286,31.4545}}, color={0,0,127}));
  connect(multiRotor_ColdPlate.dutyCycleIn3, multiRotor_ColdPlate.dutyCycleIn1)
    annotation (Line(points={{-57.4286,-4.54545},{-70,-4.54545},{-70,32},
          {-68,32},{-68,31.4545},{-57.4286,31.4545}}, color={0,0,127}));
  connect(multiRotor_ColdPlate.dutyCycleIn4, multiRotor_ColdPlate.dutyCycleIn1)
    annotation (Line(points={{-57.4286,-20.9091},{-70,-20.9091},{-70,30},
          {-68,30},{-68,31.4545},{-57.4286,31.4545}}, color={0,0,127}));
  connect(booleanExpression.y, multiRotor_ColdPlate.rotateCW4)
    annotation (Line(points={{-73,-70},{40,-70},{40,-40.5455},{39.1429,
          -40.5455}}, color={255,0,255}));
  connect(multiRotor_ColdPlate.rotateCW3, multiRotor_ColdPlate.rotateCW4)
    annotation (Line(points={{13.8857,-40.5455},{13.8857,-70},{40,-70},{
          40,-40.5455},{39.1429,-40.5455}}, color={255,0,255}));
  connect(multiRotor_ColdPlate.rotateCW2, multiRotor_ColdPlate.rotateCW4)
    annotation (Line(points={{-10.6286,-40.5455},{-10.6286,-70},{40,-70},
          {40,-40.5455},{39.1429,-40.5455}}, color={255,0,255}));
  connect(multiRotor_ColdPlate.rotateCW1, multiRotor_ColdPlate.rotateCW4)
    annotation (Line(points={{-37.3714,-40.5455},{-37.3714,-70},{40,-70},
          {40,-40.5455},{39.1429,-40.5455}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end MultiRotor_Simulation;
