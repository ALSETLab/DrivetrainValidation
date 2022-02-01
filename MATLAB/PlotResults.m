
%% plot speed vs reference (first step)
w = out.w.data;
time = out.w.time;
ref = out.ref1.data;
time_ref = out.ref1.time;
plot(time_ref,ref,time,w);xlim([0,1]);
legend('Reference','Brushless DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot speed vs reference (second step)
w = out.w.data;
time = out.w.time;
ref = out.ref1.data;
time_ref = out.ref1.time;
plot(time_ref,ref,time,w); xlim([5,5.5]);
legend('Reference','Brushless DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot torque (first step)
tau = out.tau.data;
time = out.tau.time;
plot(time,tau);xlim([0,10.5]);  
%legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N*m)');

%% plot torque (second step)
tau = out.tau.data;
time = out.tau.time;
plot(time,tau);xlim([5,5.5]);  %xlim([5,5.5]);
%legend('Reference','Ideal DC motor','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N*m)');
%% plot voltage
v = out.V.data;
time = out.V.time;

plot(time,v);xlim([4,6]);
xlabel('Time(s)'); ylabel('Voltage (V)');

%% plot current (first step)
current = out.current.data;
time = out.current.time;

plot(time,current); xlim([0,0.5]); 
xlabel('Time(s)'); ylabel('Current (A)');

%% plot current (second step)
current = out.current.data;
time = out.current.time;

plot(time,current); xlim([5,5.5]); 
xlabel('Time(s)'); ylabel('Current (A)');

%% plot losses (second step)
loss = out.Ploss.data;
time = out.Ploss.time;

plot(time,loss); xlim([5,5.5]); 
xlabel('Time(s)'); ylabel('Battery thermal losses (W)');

power = v.*current;
eff = (power - loss)./power * 100;
figure;plot(time,eff);  
xlabel('Time(s)'); ylabel('Efficiency (%)');
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

load('Simple_L_firstorder.mat','out')
i_Bs = out.current.data;
time_Bs = out.current.time;
w_Bs = out.w.data;
tau_Bs = out.tau.data;
w_ref1 = out.ref.data;
time_ref1 = out.ref.time;
load('Brushless_firstorder.mat','out')
i_Bf = out.current.data;
time_Bf = out.current.time;
w_Bf = out.w.data;
tau_Bf = out.tau.data;
w_ref = out.ref1.data;
time_ref = out.ref1.time;
load('Simple_noL_firstorder.mat')
i_noL = out.current.data;
time_noL = out.current.time;
w_noL = out.w.data;
tau_noL = out.tau.data;
load('Trapezoidal_firstorder.mat')
i_Trap = out.current.data;
time_Trap = out.current.time;
w_Trap = out.w.data;
tau_Trap = out.tau.data;


plot(time_ref1,w_ref1,time_noL, w_noL,time_Bf,w_Bf,'--', time_Bs,w_Bs,':',time_Trap,w_Trap,'-.','LineWidth',2);xlim([5,5.5]);
legend('First order reference','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Speed (rad/sec)','FontSize', 20);
figure;

plot(time_ref1,w_ref1,time_ref,w_ref,'--',time_Bf,w_Bf,time_Bs,w_Bs,':',time_Trap,w_Trap,'-.','LineWidth',2);xlim([5,5.5]);
legend('First order reference','Brushless DC motor first order response','Brushless DC motor second order response','Trapezoidal DC motor');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;
plot(time_noL, i_noL,time_Bf,i_Bf,'--',time_Bs,i_Bs,':','LineWidth',2);xlim([5.,5.5]);
legend('Simple DC motor','Simple DC motor with inductance','Brushless DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Current (A)','FontSize', 20);
figure;
plot(time_Bf,i_Bf,time_Bs,i_Bs,'--','LineWidth',2);xlim([5.,5.5]);
legend('Brushless DC motor','Simplified DC motor');
xlabel('Time(s)'); ylabel('Current (A)');



%% second order

load('Simple_L_secondorder.mat','out')
i_Bs = out.current.data;
time_Bs = out.current.time;
w_Bs = out.w.data;
w_ref1 = out.ref.data;
tau_Bs = out.tau.data;
time_ref1 = out.ref.time;
load('Brushless_secondorder.mat','out')
i_Bf = out.current.data;
time_Bf = out.current.time;
w_Bf = out.w.data;
w_ref = out.ref1.data;
tau_Bf = tau_Bs;
time_ref = out.ref1.time;
% load('Trapezoidal_secondorder.mat','out')
% i_Trap = out.current.data*2.8;
% time_Trap = out.current.time;
% w_Trap = out.w.data;
% tau_Trap = out.tau.data;
% w_ref = out.ref1.data;
% time_ref = out.ref1.time;
% 
% trap = [time_Trap,i_Trap,w_Trap,tau_Trap];
load('Trapezoidal_secondorder_filtered.mat','trap')
time_Trap = trap(:,1);
i_Trap = trap(:,2);
w_Trap = trap(:,3);
tau_Trap = trap(:,4);
load('Simple_noL_secondorder.mat')
i_noL = out.current.data;
time_noL = out.current.time;
w_noL = out.w.data;
tau_noL = out.tau.data;


plot(time_ref,w_ref,time_noL,w_noL,time_Bf,w_Bf,'--', time_Bs,w_Bs,':',time_Trap,w_Trap,'-.','LineWidth',2);xlim([5,5.05]);
legend('Second order reference','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Speed (rad/sec)','FontSize', 20);set(gca,'FontSize',16)
figure;

plot(time_ref1,w_ref1,time_ref,w_ref,time_Bf,w_Bf,time_Bs,w_Bs,'LineWidth',2);xlim([5,5.5]);
legend('First order reference','Second order reference','Brushless DC motor first order response','Brushless DC motor second order response');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');set(gca,'FontSize',16)
figure;
plot(time_Trap,-i_Trap,'-.',time_noL,i_noL,time_Bf,i_Bf,'--', time_Bs,i_Bs,':','LineWidth',2);xlim([5,5.5]);ylim([0,90]);
legend('Trapezoidal DC motor','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Current (A)','FontSize', 20);set(gca,'FontSize',16)

plot(time_noL,i_noL,time_Bf,i_Bf,'--', time_Bs,i_Bs,':','LineWidth',2);xlim([5,5.5]);
legend('Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Current (A)','FontSize', 20);set(gca,'FontSize',16)
figure;
plot(time_Trap,-tau_Trap,'-.',time_noL,tau_noL,time_Bf,tau_Bf,'--', time_Bs,tau_Bs,':','LineWidth',2);xlim([5.0,5.05]);ylim([0,10]);
legend('Trapezoidal DC motor','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Torque (N)','FontSize', 20);set(gca,'FontSize',16)

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

%% edit colors
newcolors=[ 
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
     0.4660    0.6740    0.1880 
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840];
colororder(newcolors);

def = [         0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840];
colororder(def)