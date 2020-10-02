within DrivetrainValidation.Records;
record Hacker_Q150_25_4 "(BLDCD) Trap: Hacker Q-150-25-4, 12 kWatt"
  import Modelica.Constants.pi;
  extends BrushlessDCDrives.Machines.Records.Base.Trapezoidal(
    p=42,
    Rt=1.43,
    fluxSource=BrushlessDCDrives.Common.Types.FluxSource.TorqueConst,
    k_tau=0.0764,
    k_speed=125 "to supress missing start-value warnings",
    useLt=true,
    Lt=0.95e-3,
    L=0 "to supress missing start-value warnings",
    M=0 "to supress missing start-value warnings",
    Jr=0.0629,
    u_s_nom=50,
    i_s_nom=12,
    tau_nom=7.62e-2,
    w_nom=Modelica.SIunits.Conversions.from_rpm(5250),
    I_0=0 "not available",
    w_0=6250);
  annotation (Documentation(info="<html>
<p>The parameter <code>maxEMF_start</code> is chosen in a way to compare well to the MSL&apos;s PSM.</p>
</html>"));
end Hacker_Q150_25_4;
