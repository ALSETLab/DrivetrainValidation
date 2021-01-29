
%% plot speed vs reference (first step)
w = out.w.data;
time = out.w.time;
ref = out.ref.data;
time_ref = out.ref.time;
plot(time_ref,ref,time,w);xlim([5,15.5]);
legend('Reference','Brushless DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot speed vs reference (second step)
w = out.w.data;
time = out.w.time;
ref = out.ref.data;
time_ref = out.ref.time;
plot(time_ref,ref,time,w);xlim([10,10.5]);  %xlim([5,5.5]);
legend('Reference','Brushless DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot torque (first step)
tau = out.tau.data;
time = out.tau.time;
plot(time,tau);xlim([5,5.5]);  
%legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N*m)');

%% plot torque (second step)
tau = out.tau.data;
time = out.tau.time;
plot(time,tau);xlim([10,10.5]);  %xlim([5,5.5]);
%legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N*m)');
%% plot voltage
v = out.V.data;
time = out.V.time;

plot(time,v);
xlabel('Time(s)'); ylabel('Voltage (V)');

%% plot current (first step)
current = out.current.data;
time = out.current.time;

plot(time,current); xlim([5,5.5]); 
xlabel('Time(s)'); ylabel('Current (A)');

%% plot current (second step)
current = out.current.data;
time = out.current.time;

plot(time,current); xlim([10,10.5]); 
xlabel('Time(s)'); ylabel('Current (A)');
%% plot duty cycle (first step)

DC = out.pid_out.data;
time = out.pid_out.time;
plot(time,current); xlim([5,5.5]);  
xlabel('Time(s)'); ylabel('Duty cycle');

%% Comparisons
load('SimpleDC_noL.mat')
w_noL = out.w.data;
time_noL = out.w.time;
load('SimpleDC_L.mat')
w_L = out.w.data;
time_L = out.w.time;
ref = out.ref.data;
time_ref = out.ref.time;


plot(time_ref,ref,time_noL,w_noL,time_L,w_L);xlim([10,10.5]);
legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%%

load('SimpleDC_noL_control.mat')
w_noL = out.w.data;
time_noL = out.w.time;
current_noL = out.current.data;
load('SimpleDC_L_control.mat')
w_L = out.w.data;
time_L = out.w.time;
current_L = out.current.data;
ref = out.ref.data;
time_ref = out.ref.time;


plot(time_ref,ref,time_noL,w_noL,time_L,w_L);xlim([10,10.5]);
legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;
plot(time_noL, current_noL, time_L, current_L);xlim([9.5, 10.5]);
legend('Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Current (A)');