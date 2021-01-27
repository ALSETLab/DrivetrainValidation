within DrivetrainValidation.Templates;
model SimpleMotor_EMF "Simplified DC motor model with EMF"

  Modelica.Electrical.Analog.Basic.Inductor inductor(L=X_s)
                                                           "Reactance"
    annotation (Placement(transformation(extent={{-10,8},{10,28}})));

  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R_trs)
    "Effective resistance for transport  ac loss"
    annotation (Placement(transformation(extent={{-50,8},{-30,28}})));
  parameter Modelica.Units.SI.Resistance R_trs=1e-6
    "Effective resistance for transport  ac loss";
  parameter Modelica.Units.SI.Inductance X_s=0.041 "Reactance";
  Modelica.Electrical.Analog.Basic.Resistor hysteresis(R=R_hyst)
    "Effective resistance for hysteresis ac loss" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  parameter Modelica.Units.SI.Resistance R_hyst=149
    "Effective resistance for hysteresis ac loss";
  parameter Modelica.Units.SI.ElectricalTorqueConstant k=0.021
    "Transformation coefficient of back EMF";
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange1
                                                           "Flange"
    annotation (Placement(transformation(extent={{94,-10},{114,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{46,28},{66,8}})));
  Modelica.Blocks.Interfaces.RealOutput i1
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf1(k=k)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
equation
  connect(inductor.p, resistor.n)
    annotation (Line(points={{-10,18},{-30,18}}, color={0,0,255}));
  connect(inductor.n, hysteresis.p)
    annotation (Line(points={{10,18},{40,18},{40,10}}, color={0,0,255}));
  connect(resistor.p, p)
    annotation (Line(points={{-50,18},{-100,18},{-100,60}}, color={0,0,255}));
  connect(currentSensor.p, hysteresis.p)
    annotation (Line(points={{46,18},{40,18},{40,10}}, color={0,0,255}));
  connect(currentSensor.i, i1)
    annotation (Line(points={{56,29},{56,60},{110,60}}, color={0,0,127}));
  connect(flange1, emf1.flange)
    annotation (Line(points={{104,0},{90,0}}, color={0,0,0}));
  connect(currentSensor.n, emf1.p)
    annotation (Line(points={{66,18},{80,18},{80,10}}, color={0,0,255}));
  connect(emf1.n, n) annotation (Line(points={{80,-10},{78,-10},{78,-60},{-100,
          -60}}, color={0,0,255}));
  connect(hysteresis.n, n)
    annotation (Line(points={{40,-10},{40,-60},{-100,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-62,28},{74,-20}},
          lineColor={28,108,200},
          textString="motor")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SimpleMotor_EMF;
