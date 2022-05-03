Axis = 'Cruise14ms';

TorqueFront = repmat(17.8,100001,1);
TorqueBack = repmat(22.1,100001,1);
SpeedFront = repmat(207,100001,1);
SpeedBack = repmat(229,100001,1);

Data.(Axis).Rotor(1).SpeedCmd = SpeedFront;
Data.(Axis).Rotor(2).SpeedCmd = SpeedFront;
Data.(Axis).Rotor(3).SpeedCmd = SpeedBack;
Data.(Axis).Rotor(4).SpeedCmd = SpeedBack;

Data.(Axis).Rotor(1).SpeedActual = SpeedFront;
Data.(Axis).Rotor(2).SpeedActual = SpeedFront;
Data.(Axis).Rotor(3).SpeedActual = SpeedBack;
Data.(Axis).Rotor(4).SpeedActual = SpeedBack;

Data.(Axis).Rotor(1).AeroTorque = TorqueFront;
Data.(Axis).Rotor(2).AeroTorque = TorqueFront;
Data.(Axis).Rotor(3).AeroTorque = TorqueBack;
Data.(Axis).Rotor(4).AeroTorque = TorqueBack;