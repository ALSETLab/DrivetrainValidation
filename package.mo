within ;
package DrivetrainValidation
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  uses(
    DymolaModels(version="1.2"),
    Battery(version="2.2.0"),
    BrushlessDCDrives(version="1.1.2"),
    ModelicaServices(version="4.0.0"),
    ElectrifiedPowertrains(version="1.3.3"),
    Modelica(version="4.0.0")),
  version="2",
  conversion(noneFromVersion=""));
end DrivetrainValidation;
