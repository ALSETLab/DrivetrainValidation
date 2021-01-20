within DrivetrainValidation.Records;
record Hacker_Q150_25_4 "(BLDCD) Trap: Hacker Q-150-25-4, 12 kWatt"
  import Modelica.Constants.pi;
  extends BrushlessDCDrives.Machines.Records.Base.Trapezoidal(
    p=21,
    Rt=0.0136,
    fluxSource=BrushlessDCDrives.Common.Types.FluxSource.TorqueConst,
    k_tau=0.0762,
    k_speed=125 "to supress missing start-value warnings",
    useLt=true,
    Lt=0.95e-3,
    L =  Modelica.Constants.eps "to supress missing start-value warnings",
    M= Modelica.Constants.eps "to supress missing start-value warnings",
    Jr= Modelica.Constants.eps,
    u_s_nom=50,
    i_s_nom=192.45,
    tau_nom=14.67,
    w_nom=Modelica.SIunits.Conversions.from_rpm(5941),
    I_0=12 "not available",
    w_0=6250);
             //0.0135,
  annotation (Documentation(info="<html>
<p>The parameter <code>maxEMF_start</code> is chosen in a way to compare well to the MSL&apos;s PSM.</p>
</html>"));
end Hacker_Q150_25_4;
