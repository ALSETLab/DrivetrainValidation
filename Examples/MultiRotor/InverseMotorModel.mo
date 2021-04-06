within DrivetrainValidation.Examples.MultiRotor;
model InverseMotorModel
  parameter Real I = 0.0629 "inertia";
  parameter Real Ke = 0.136;
  parameter Real CQ = 5.5e-4;
  parameter Real R = 0.06;
  parameter Real Ra = 0.155;
  parameter Real Om = 200;
  parameter Real V0 = 60;
  parameter Real zeta = 0.8;
  parameter Real w_cm = 11.5;
  parameter Real KI = 0.0184;
  parameter Real Kp = 0.00368;

  Modelica.Blocks.Math.Gain gain(k=I)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{10,4},{30,24}})));
  Modelica.Blocks.Math.Gain gain1(k=Ke^2/Ra + 2*CQ*1.23*Modelica.Constants.pi*R
        ^5*Om)
    annotation (Placement(transformation(extent={{-80,-8},{-60,12}})));
  Modelica.Blocks.Interfaces.RealInput accel "acceleration"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput w "speed"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Gain gain2(k=Ra/(Ke*V0))
    annotation (Placement(transformation(extent={{52,4},{72,24}})));
  Modelica.Blocks.Interfaces.RealOutput PWM "Output signal connector"
    annotation (Placement(transformation(extent={{100,4},{120,24}})));
equation
  connect(gain.y, add.u1)
    annotation (Line(points={{-59,40},{2,40},{2,20},{8,20}}, color={0,0,127}));
  connect(gain1.y, add.u2)
    annotation (Line(points={{-59,2},{0,2},{0,8},{8,8}}, color={0,0,127}));
  connect(gain.u, accel) annotation (Line(points={{-82,40},{-94,40},{-94,60},{
          -120,60}}, color={0,0,127}));
  connect(gain1.u, w) annotation (Line(points={{-82,2},{-94,2},{-94,-60},{-120,
          -60}}, color={0,0,127}));
  connect(add.y, gain2.u)
    annotation (Line(points={{31,14},{50,14}}, color={0,0,127}));
  connect(gain2.y, PWM)
    annotation (Line(points={{73,14},{110,14}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end InverseMotorModel;
