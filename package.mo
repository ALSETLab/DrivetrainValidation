within ;
package DrivetrainValidation
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  uses(
    Modelica(version="3.2.3"),
    BrushlessDCDrives(version="1.1.1"),
    DymolaModels(version="1.1"),
    Battery(version="2.1.4")),
  version="1",
  conversion(noneFromVersion=""));
end DrivetrainValidation;
