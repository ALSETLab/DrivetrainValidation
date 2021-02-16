within DrivetrainValidation.Templates;
model SimpleMotor
  // Parameter
  parameter SI.Resistance R "Phase Resistances R_ref at 20degC";
  parameter Boolean useL = true "Activate the internal inductance (electric dynamics)";
  parameter SI.Inductance L "Self inductance" annotation (Dialog(enable=useL));
  parameter SI.Inertia Jr "Rotor's moment of inertia" annotation (Dialog(group="Mechanics"));
  parameter SI.Inertia Js=Jr "Stator's moment of inertia (only has effect if stator not fixed (useSupport = false))"
    annotation (Dialog(group="Mechanics"));
  parameter SI.RotationalDampingConstant b "Damping coefficient" annotation (Dialog(group="Mechanics"));
  parameter Boolean useSupport=false "False: Stator is fixed internally, false: it can rotate"
    annotation (Dialog(group="Interfaces"));
  parameter Boolean useThermalPort = false "True: thermal connector is provided, false: temperature is fixed internally"
    annotation(Dialog(group = "Interfaces"));
  parameter SI.ElectricalTorqueConstant k "Transformation coefficient";

  // Icons
  extends BrushlessDCDrives.Common.Icons.PSM;
  extends BrushlessDCDrives.Common.Icons.SubIcons.Averaged;

  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  SI.AngularVelocity w "Rotors angular velocity";
  SI.Voltage v "Voltage at the motor";

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange "Shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p "Positive stator pin"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n "Negative stator pin"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R, useHeatPort=useThermalPort,
    T_ref=293.15,
    alpha=3.97e-3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,60})));

  Modelica.Electrical.Analog.Basic.RotationalEMF backEMF(useSupport=true, k=k)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Mechanics.Rotational.Components.Fixed fixed if (not useSupport)
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-26,-12})));

  Modelica.Mechanics.Rotational.Sensors.TorqueSensor airGapSensor annotation (Placement(transformation(extent={{26,-6},{38,6}})));
  Modelica.Blocks.Interfaces.RealOutput airgapTorque
    "Torque in flange flange_a and flange_b (tau = flange_a.tau = -flange_b.tau) as output signal"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Electrical.Analog.Basic.Inductor overallInductance(L=L) if useL
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={0,28})));

  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
  Modelica.Blocks.Interfaces.RealOutput i
    "Current in the branch from p to n as output signal"
    annotation (Placement(transformation(extent={{100,-74},{120,-54}})));
equation
  w = der(flange.phi);
  v =pin_p.v - pin_n.v;

  connect(pin_n, backEMF.n) annotation (Line(points={{-100,-60},{0,-60},{0,-10}},                             color={0,0,255}));
  connect(airGapSensor.flange_a, backEMF.flange) annotation (Line(points={{26,0},{26,0},{10,0}}, color={0,0,0}));
  connect(airGapSensor.tau, airgapTorque) annotation (Line(points={{27.2,-6.6},{27.2,-40},{110,-40}}, color={0,0,127}));
  connect(resistor.n, overallInductance.p) annotation (Line(points={{
          -1.77636e-15,50},{1.83187e-15,38}},                                                         color={0,0,255}));
  connect(overallInductance.n, backEMF.p) annotation (Line(points={{
          -1.83187e-15,18},{0,10}},                                                                           color={0,0,255}));
  connect(fixed.flange, backEMF.support)
    annotation (Line(points={{-26,-12},{-26,0},{-10,0}}, color={0,0,0}));
  connect(flange, airGapSensor.flange_b)
    annotation (Line(points={{100,0},{38,0}}, color={0,0,0}));
  connect(pin_p, currentSensor.p)
    annotation (Line(points={{-100,60},{-72,60}}, color={0,0,255}));
  connect(currentSensor.n, resistor.p) annotation (Line(points={{-52,60},{-14,
          60},{-14,74},{1.77636e-15,74},{1.77636e-15,70}}, color={0,0,255}));
  connect(currentSensor.i, i)
    annotation (Line(points={{-62,49},{-62,-64},{110,-64}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                  Line(points={{-50,100},{-20,100},{-20,70}},
            color={0,0,255}),
        Rectangle(
          extent={{-40,70},{40,50}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
                              Line(points={{50,100},{20,100},{20,70}},
            color={0,0,255})}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>DC machine model which can be useful for very fast simulations of DC/BLDC machines. It uses a subset of the parameters of a BLDC machine. From a simulation point of view it simplifies all of the events/zero crossings that are necessary to operate a BLDC motor. Therefore the model simulates very fast. </p>
<h4>Friction:</h4>
<p>Within the machine a linear fricition element (<a href=\"Modelica.Mechanics.Rotational.Components.Damper\">damper</a>) generates an internal friction torque which lets the rotating machine consume current event if there is no load attached to the machine. This mimics the real phyical behavior. The parameter for the friction element is computed from I_0 and w_0, setting I_0 to zero will result in no damping. The behaviour of the damper results in the internal friction torque scaleing linearly with the rotational velocity. Therefore it does not perfectly fit the behavior of common BLDC machines as they tend to have an offset in the friction torque when plotted over the speed. Still this offset is usually not specified within the motor&apos;s datasheets, therefore it is not used in this model.</p>
<h4>Limitations:</h4>
<ul>
<li>Due to the simplifications no torque/current ripple will be simulated when using this model.</li>
<li>Torque will be a little bit higher compared to the trapezoidal machine, as the time needed to commutate the currents from one phase to the other is not accounted for in the model.</li>
<li>Because of the constant values used for the inductances, the model&apos;s precision is limited in the application where strong saturation is to be expected.</li>
</ul>
</html>"));
end SimpleMotor;
