within DrivetrainValidation.Examples;
model Test

  Rotor2_fmu rotor_fmu
    annotation (Placement(transformation(extent={{-36,-18},{28,46}})));
  Modelica.Blocks.Sources.Constant const(k=400)
    annotation (Placement(transformation(extent={{-80,56},{-60,76}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-82,18},{-62,38}})));
  Modelica.Blocks.Sources.Constant const2(k=0.1524)
    annotation (Placement(transformation(extent={{-84,-12},{-64,8}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-82,-48},{-62,-28}})));
equation
  connect(rotor_fmu.In1, const.y) annotation (Line(points={{-37.28,39.6},{-59,
          39.6},{-59,66}}, color={0,0,127}));
  connect(const2.y, rotor_fmu.In4) annotation (Line(points={{-63,-2},{-50,-2},{
          -50,-5.2},{-37.28,-5.2}}, color={0,0,127}));
  connect(rotor_fmu.In5, booleanConstant.y) annotation (Line(points={{-37.28,
          -11.6},{-37.28,-24.8},{-61,-24.8},{-61,-38}}, color={255,0,255}));
  connect(const1.y, rotor_fmu.In2_1_) annotation (Line(points={{-61,28},{-50.5,
          28},{-50.5,33.2},{-37.28,33.2}}, color={0,0,127}));
  connect(const1.y, rotor_fmu.In2_2_) annotation (Line(points={{-61,28},{-50,28},
          {-50,26.8},{-37.28,26.8}}, color={0,0,127}));
  connect(const1.y, rotor_fmu.In2_3_) annotation (Line(points={{-61,28},{-50,28},
          {-50,20.4},{-37.28,20.4}}, color={0,0,127}));
  connect(const1.y, rotor_fmu.In3_1_) annotation (Line(points={{-61,28},{-48,28},
          {-48,14},{-37.28,14}}, color={0,0,127}));
  connect(const1.y, rotor_fmu.In3_2_) annotation (Line(points={{-61,28},{-61,17},
          {-37.28,17},{-37.28,7.6}}, color={0,0,127}));
  connect(const1.y, rotor_fmu.In3_3_) annotation (Line(points={{-61,28},{-48,28},
          {-48,1.2},{-37.28,1.2}}, color={0,0,127}));
end Test;
