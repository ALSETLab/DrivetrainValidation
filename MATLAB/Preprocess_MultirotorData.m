%% load
% load init
load ProcessedWithNewHeave
% startup = start_w;
% startup_act = start_act;
% startup_tau = start_tau;
%%
t_start = 3;
t_ramp=3;
t = (0:0.01:t_ramp)';
t_hold = 3;
t2 = t_start+(0:0.01:t_hold);

Axis = 'Roll';
%% Preprocess
init1 = [linspace(0,Data.(Axis).Rotor(1).SpeedCmd(1),length(t))';repmat(Data.(Axis).Rotor(1).SpeedCmd(1),length(t2),1)];
init2 = [linspace(0,Data.(Axis).Rotor(2).SpeedCmd(1),length(t))';repmat(Data.(Axis).Rotor(2).SpeedCmd(1),length(t2),1)];
init3 = [linspace(0,Data.(Axis).Rotor(3).SpeedCmd(1),length(t))';repmat(Data.(Axis).Rotor(3).SpeedCmd(1),length(t2),1)];
init4 = [linspace(0,Data.(Axis).Rotor(4).SpeedCmd(1),length(t))';repmat(Data.(Axis).Rotor(4).SpeedCmd(1),length(t2),1)];
init = [init1,init2,init3,init4];
time1 = Data.(Axis).T+t_ramp+t_hold;
spd = [Data.(Axis).Rotor(1).SpeedCmd,Data.(Axis).Rotor(2).SpeedCmd,Data.(Axis).Rotor(3).SpeedCmd,Data.(Axis).Rotor(4).SpeedCmd];
time =[t;t2';time1];
speedCmd = [init;spd];
%% Actual speed

init1 = [linspace(0,Data.(Axis).Rotor(1).SpeedActual(1),length(t))';repmat(Data.(Axis).Rotor(1).SpeedActual(1),length(t2),1)];
init2 = [linspace(0,Data.(Axis).Rotor(2).SpeedActual(1),length(t))';repmat(Data.(Axis).Rotor(2).SpeedActual(1),length(t2),1)];
init3 = [linspace(0,Data.(Axis).Rotor(3).SpeedActual(1),length(t))';repmat(Data.(Axis).Rotor(3).SpeedActual(1),length(t2),1)];
init4 = [linspace(0,Data.(Axis).Rotor(3).SpeedActual(1),length(t))';repmat(Data.(Axis).Rotor(4).SpeedActual(1),length(t2),1)];

init = [init1,init2,init3,init4];
%int= [startup_act(:,2),startup_act(:,2),startup_act(:,2),startup_act(:,2)];
time1 = Data.(Axis).T+t_ramp+t_hold;
spd = [Data.(Axis).Rotor(1).SpeedActual,Data.(Axis).Rotor(2).SpeedActual,Data.(Axis).Rotor(3).SpeedActual,Data.(Axis).Rotor(4).SpeedActual];
time =[t;t2';time1];
speedAct = [init;spd];


%% Acceleration


init1 = [repmat(Data.(Axis).Rotor(1).SpeedActual(1)/t_ramp,length(t),1);zeros(length(t),1)];
init2 = [repmat(Data.(Axis).Rotor(2).SpeedActual(1)/t_ramp,length(t),1);zeros(length(t),1)];
init3 = [repmat(Data.(Axis).Rotor(3).SpeedActual(1)/t_ramp,length(t),1);zeros(length(t),1)];
init4 = [repmat(Data.(Axis).Rotor(4).SpeedActual(1)/t_ramp,length(t),1);zeros(length(t),1)];
init = [init1,init2,init3,init4];
time1 = Data.(Axis).T+t_ramp+t_hold;
accel = [Data.(Axis).Rotor(1).SpeedDerivative,Data.(Axis).Rotor(2).SpeedDerivative,Data.(Axis).Rotor(3).SpeedDerivative,Data.(Axis).Rotor(4).SpeedDerivative];
time_accel =[t;t2';time1];
AccelCmd = [init;accel];


%% tau

init1 = [linspace(0,Data.(Axis).Rotor(1).AeroTorque(1),length(t))';repmat(Data.(Axis).Rotor(1).AeroTorque(1),length(t2),1)];
init2 = [linspace(0,Data.(Axis).Rotor(2).AeroTorque(1),length(t))';repmat(Data.(Axis).Rotor(2).AeroTorque(1),length(t2),1)];
init3 = [linspace(0,Data.(Axis).Rotor(3).AeroTorque(1),length(t))';repmat(Data.(Axis).Rotor(3).AeroTorque(1),length(t2),1)];
init4 = [linspace(0,Data.(Axis).Rotor(4).AeroTorque(1),length(t))';repmat(Data.(Axis).Rotor(4).AeroTorque(1),length(t2),1)];

init = [init1,init2,init3,init4];
time1 = Data.(Axis).T+t_ramp+t_hold;
tau1 = [Data.(Axis).Rotor(1).AeroTorque,Data.(Axis).Rotor(2).AeroTorque,Data.(Axis).Rotor(3).AeroTorque,Data.(Axis).Rotor(4).AeroTorque];
time_tau =[t;t2';time1];
tau = [init;tau1];