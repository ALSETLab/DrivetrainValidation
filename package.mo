within ;
package DrivetrainValidation
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  uses(
    Modelica(version="3.2.3"),
    DymolaModels(version="1.0.1"),
    Battery(version="2.1.3"),
    BrushlessDCDrives(version="1.1"),
    ModelicaServices(version="3.2.3"),
    ElectrifiedPowertrains(version="1.3.1")),
  version="1",
  conversion(noneFromVersion=""));
end DrivetrainValidation;
