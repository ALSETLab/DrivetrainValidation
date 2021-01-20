within DrivetrainValidation.Records;
record Hacker_Q150_45_4 "(BLDCD) Trap: Hacker Q-150-45-4, 12 kWatt"
  import Modelica.Constants.pi;
  extends BrushlessDCDrives.Machines.Records.Base.Trapezoidal(
    p=21 "pole pairs",
    Rt=0.0155,
    fluxSource=BrushlessDCDrives.Common.Types.FluxSource.TorqueConst,
    k_tau=13.42e-2 "torque constant",
    k_speed=71 "speed constant",
    useLt=true,
    Lt=17e-6 "estimated value based on 5kW from paper",
    L =  Modelica.Constants.eps "to supress missing start-value warnings",
    M= Modelica.Constants.eps "to supress missing start-value warnings",
    Jr= Modelica.Constants.eps,
    u_s_nom=50,
    i_s_nom=177.8 "based on the current at the maximum efficiency 0.89",
    tau_nom=23.853,
    w_nom=Modelica.SIunits.Conversions.from_rpm(3365),
    I_0=9.8 "no load currenet",
    w_0=3550 "no load speed");
             //0.0155,
  annotation (Documentation(info="<html>
<p>The parameter <code>maxEMF_start</code> is chosen in a way to compare well to the MSL&apos;s PSM.</p>
</html>"));
end Hacker_Q150_45_4;
