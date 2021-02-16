
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

figure;
plot(time_noL,i_noL,time_L,i_L, 'LineWidth',2);xlim([5,5.5]);
legend('Ideal DC motor','DC motor with inductance');
xlabel('Time(s)'); ylabel('Current (A)');
%%

load('Simple_L_firstorder.mat')
i_L = out.current.data;
time_L = out.current.time;
load('Brushless_firstorder.mat')
i_B = out.current.data;
time_B = out.current.time;
load('Simple_noL_firstorder.mat')
i_noL = out.current.data;
time_noL = out.current.time;

plot(time_noL,i_noL,time_L,i_L,time_B,i_B,'LineWidth',2);xlim([5,5.5]);
legend('Ideal DC motor','DC motor with inductance','Brushless DC motor');
xlabel('Time(s)'); ylabel('Current (A)');

%% first order

load('Simple_L_secondorder.mat','out')
i_Bs = out.current.data;
time_Bs = out.current.time;
w_Bs = out.w.data;
w_ref1 = out.ref.data;
time_ref1 = out.ref.time;
load('Brushless_secondorder.mat','out')
i_Bf = out.current.data;
time_Bf = out.current.time;
w_Bf = out.w.data;
w_ref = out.ref1.data;
time_ref = out.ref1.time;
load('Simple_noL_secondorder.mat')
i_noL = out.current.data;
time_noL = out.current.time;
w_noL = out.w.data;


plot(time_ref,w_ref,time_noL, w_noL,time_Bf,w_Bf,'--', time_Bs,w_Bs,':','LineWidth',2);xlim([5,5.5]);
legend('Second order reference','Simple DC motor','Simple DC motor with inductance','Brushless DC motor');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;

plot(time_ref1,w_ref1,time_ref,w_ref,time_Bf,w_Bf,time_Bs,w_Bs,'LineWidth',2);xlim([5,5.5]);
legend('First order reference','Second order reference','Brushless DC motor first order response','Brushless DC motor second order response');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;
plot(time_Bf,i_Bf,time_Bs,i_Bs,'--','LineWidth',2);xlim([5.1,5.15]);
legend('Brushless DC motor','Simplified DC motor');
xlabel('Time(s)'); ylabel('Current (A)');



%% second order

load('Simple_L_secondorder.mat','out')
i_Bs = out.current.data;
time_Bs = out.current.time;
w_Bs = out.w.data;
w_ref1 = out.ref.data;
time_ref1 = out.ref.time;
load('Brushless_secondorder.mat','out')
i_Bf = out.current.data;
time_Bf = out.current.time;
w_Bf = out.w.data;
w_ref = out.ref1.data;
time_ref = out.ref1.time;


plot(time_ref,w_ref,time_Bf,w_Bf,'--', time_Bs,w_Bs,':','LineWidth',2);xlim([5,5.5]);
legend('Second order reference','Simple DC motor','Brushless DC motor');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;

plot(time_ref1,w_ref1,time_ref,w_ref,time_Bf,w_Bf,time_Bs,w_Bs,'LineWidth',2);xlim([5,5.5]);
legend('First order reference','Second order reference','Brushless DC motor first order response','Brushless DC motor second order response');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;
plot(time_Bf,i_Bf,time_Bs,i_Bs,'LineWidth',2);xlim([5,5.5]);
legend('Brushless DC motor first order response','Brushless DC motor second order response');
xlabel('Time(s)'); ylabel('Current (A)');

%% Plot battery current and voltage compared
load('Brushless_battery_current.mat','out')
time_high = out.V.time;
v_high = out.V.data;
w_high = out.w.data;
i_high = out.current.data;
load('Simplified_battery_current.mat','out')
time_low = out.V.time;
v_low = out.V.data;
w_low = out.w.data;
i_low = -out.current.data;


plot(time_high,v_high, time_low, v_low,'LineWidth',2);
legend('Initial SoC = 1','Initial SoC = 0.3');
xlabel('Time(s)'); ylabel('Voltage (V)');
figure;
plot(time_high,w_high, time_low, w_low,'LineWidth',2);xlim([5,5.5]);
legend('Initial SoC = 1','Initial SoC = 0.3');

plot(time_ref,ref,time_noL,w_noL,time_L,w_L);xlim([10,10.5]);
legend('Reference','Ideal DC motor','DC motor with added inductance');

xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;


plot(time_ref,ref,time_noL,w_noL,time_L,w_L);xlim([10,10.5]);
legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;

plot(time_noL, current_noL, time_L, current_L);xlim([9.5, 10.5]);
legend('Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Current (A)');