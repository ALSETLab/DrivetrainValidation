within DrivetrainValidation.Examples;
model Trapezoidal

  Modelica.Blocks.Sources.BooleanStep rotateCW(startTime=1000, startValue=true)
    annotation (Placement(transformation(extent={{6,38},{26,58}})));
  Modelica.Blocks.Sources.Step     dutyCycle(
    height=0.0533,
    offset=0.33,
    startTime=5)                                    annotation (Placement(transformation(extent={{6,68},{
            26,88}})));
  FMU.Thermal.Trapezoidal trapezoidal
    annotation (Placement(transformation(extent={{122,60},{140,74}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder(
    w=11.5,
    D=0.8,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{52,68},{72,88}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=0.000173989880442095*
        trapezoidal.w^2)
    annotation (Placement(transformation(extent={{6,10},{26,30}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{66,10},{86,30}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=10, f=45)
    annotation (Placement(transformation(extent={{6,-8},{26,12}})));
equation
  connect(rotateCW.y, trapezoidal.rotateCW_In1) annotation (Line(points={{27,48},
          {50,48},{50,46},{54,46},{54,67},{120,67}}, color={255,0,255}));
  connect(dutyCycle.y, secondOrder.u)
    annotation (Line(points={{27,78},{50,78}}, color={0,0,127}));
  connect(secondOrder.y, trapezoidal.speed) annotation (Line(points={{73,78},{
          90,78},{90,72},{120,72},{120,72.25}}, color={0,0,127}));
  connect(realExpression.y, add1.u1) annotation (Line(points={{27,20},{56,20},{
          56,26},{64,26}}, color={0,0,127}));
  connect(add1.y, trapezoidal.tau)
    annotation (Line(points={{87,20},{120,20},{120,61.75}}, color={0,0,127}));
  connect(add1.u2, sine.y)
    annotation (Line(points={{64,14},{32,14},{32,2},{27,2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{0,-20},{160,100}},
        initialScale=0.1)),                                      Diagram(coordinateSystem(preserveAspectRatio=false,
        extent={{0,-20},{160,100}},
        initialScale=0.1)),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Radau"),
    __Dymola_Commands(file="modelica://BrushlessDCDrives/Resources/Scripts/ExamplesLevelOfDetail.mos" "plot"),
    Documentation(info="<html>
<p>See <a href=\"BrushlessDCDrives.Examples.LevelOfDetail.ReadMe\">Read me</a> for a description.</p>
</html>"));
end Trapezoidal;
