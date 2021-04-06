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


plot(time_ref,w_ref,time_noL,w_noL,time_Bf,w_Bf,'--', time_Bs,w_Bs,':',time_Trap,w_Trap,'-.','LineWidth',2);xlim([5,5.5]);
legend('Second order reference','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Speed (rad/sec)','FontSize', 20);
figure;

plot(time_ref1,w_ref1,time_ref,w_ref,time_Bf,w_Bf,time_Bs,w_Bs,'LineWidth',2);xlim([5,5.5]);
legend('First order reference','Second order reference','Brushless DC motor first order response','Brushless DC motor second order response');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
figure;
plot(time_Trap,-i_Trap,'-.',time_noL,i_noL,time_Bf,i_Bf,'--', time_Bs,i_Bs,':','LineWidth',2);xlim([5,5.5]);ylim([0,90]);
legend('Trapezoidal DC motor','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Current (A)','FontSize', 20);

plot(time_noL,i_noL,time_Bf,i_Bf,'--', time_Bs,i_Bs,':','LineWidth',2);xlim([5,5.5]);
legend('Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Current (A)','FontSize', 20);
figure;
plot(time_Trap,-tau_Trap,'-.',time_noL,tau_noL,time_Bf,tau_Bf,'--', time_Bs,tau_Bs,':','LineWidth',2);xlim([5.02,5.03]);
legend('Trapezoidal DC motor','Simple DC motor','Simple DC motor with inductance','Brushless DC motor','Trapezoidal DC motor','FontSize', 14);
xlabel('Time(s)','FontSize', 20); ylabel('Torque (N)','FontSize', 20);

%% fix colors
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