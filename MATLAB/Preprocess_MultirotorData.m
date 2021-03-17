%% load
load start
startup = start_w;
startup_act = start_act;
startup_tau = start_tau;
%% Preprocess
 
t= (0:0.01:3)';
init1 = repmat(Data.Heave.Rotor(1).SpeedCmd(1),301,1);
init2 = repmat(Data.Heave.Rotor(2).SpeedCmd(1),301,1);
init3 = repmat(Data.Heave.Rotor(3).SpeedCmd(1),301,1);
init4 = repmat(Data.Heave.Rotor(4).SpeedCmd(1),301,1);
%init = [init1,init2,init3,init4];
init = [startup(:,2),startup(:,2),startup(:,2),startup(:,2)];
time1 = Data.Heave.T+3;
spd = [Data.Heave.Rotor(1).SpeedCmd,Data.Heave.Rotor(2).SpeedCmd,Data.Heave.Rotor(3).SpeedCmd,Data.Heave.Rotor(4).SpeedCmd];
time =[startup(:,1);time1];
speedCmd = [init;spd];
%% Actual speed
t = (0:0.01:3)';
init1 = repmat(Data.Heave.Rotor(1).SpeedActual(1),301,1);
init2 = repmat(Data.Heave.Rotor(2).SpeedActual(1),301,1);
init3 = repmat(Data.Heave.Rotor(3).SpeedActual(1),301,1);
init4 = repmat(Data.Heave.Rotor(4).SpeedActual(1),301,1);
%init = [init1,init2,init3,init4];
int= [startup_act(:,2),startup_act(:,2),startup_act(:,2),startup_act(:,2)];
time1 = Data.Heave.T+3;
spd = [Data.Heave.Rotor(1).SpeedActual,Data.Heave.Rotor(2).SpeedActual,Data.Heave.Rotor(3).SpeedActual,Data.Heave.Rotor(4).SpeedActual];
time =[startup_act(:,1);time1];
speedAct = [init;spd];


%% Acceleration

t = (0:0.01:3)';
init1 = repmat(Data.Heave.Rotor(1).SpeedDerivative(1),301,1);
init2 = repmat(Data.Heave.Rotor(2).SpeedDerivative(1),301,1);
init3 = repmat(Data.Heave.Rotor(3).SpeedDerivative(1),301,1);
init4 = repmat(Data.Heave.Rotor(4).SpeedDerivative(1),301,1);
init = [init1,init2,init3,init4];

time1 = Data.Heave.T+3;
accel = [Data.Heave.Rotor(1).SpeedDerivative,Data.Heave.Rotor(2).SpeedDerivative,Data.Heave.Rotor(3).SpeedDerivative,Data.Heave.Rotor(4).SpeedDerivative];
time_accel =[t;time1];
AccelCmd = [init;accel];


%% tau
t = (0:0.01:3)';
init1 = repmat(Data.Heave.Rotor(1).AeroTorque(1),301,1);
init2 = repmat(Data.Heave.Rotor(2).AeroTorque(1),301,1);
init3 = repmat(Data.Heave.Rotor(3).AeroTorque(1),301,1);
init4 = repmat(Data.Heave.Rotor(4).AeroTorque(1),301,1);
%init = [init1,init2,init3,init4];
init = [startup_tau(:,2),startup_tau(:,2),startup_tau(:,2),startup_tau(:,2)];
time1 = Data.Heave.T+3;
tau1 = [Data.Heave.Rotor(1).AeroTorque,Data.Heave.Rotor(2).AeroTorque,Data.Heave.Rotor(3).AeroTorque,Data.Heave.Rotor(4).AeroTorque];
time_tau =[startup_tau(:,1);time1];
tau = [init;tau1];