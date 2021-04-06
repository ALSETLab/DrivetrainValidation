load Indv_FullCharge_Heave.mat
t = out.w1.time;
w1 = out.w1.data;


time_ref = time;
ref1 = speedCmd(:,1);


i_indv = out.current1.data; 
v_indv = out.V1.data; 
p_indv = v_indv.*i_indv;
tau_indv = out.tau1.data;


load Averaged_CentralBattery.mat
t1=out.w1.time;
w1_central_full = out.w1.data;
i_central_full = out.current.data;
v_central_full = out.V.data;
p_central_full = v_central_full.*-i_central_full;
tau_central_full = out.tau1.data;

%

load Ideal_Heave.mat
t_ideal=out.w1.time;
w1_ideal = out.w1.data;

i_ideal = out.current1.data;
v_ideal = out.V1.data;
p_ideal = v_ideal.*i_ideal;
tau_ideal = out.tau1.data;
%

load Averaged_Heave_LowSoC.mat
t_central_low = out.w1.time;
w1_central_low = out.w1.data;
i_central_low = out.current.data;
v_central_low = out.V.data;
p_central_low = -v_central_low.*i_central_low;
tau_central_low = out.tau1.data;

load Indv_LowSoC_Heave.mat
t_ind_low = out.w1.time;
w1_ind_low = out.w1.data;
i_ind_low = out.current1.data;
v_ind_low = out.V1.data;
p_ind_low = v_ind_low.*i_ind_low;
tau_ind_low = out.tau1.data;

load CentralizedIdeal_Heave.mat
t_ideal_cent = out.w1.time;
w_ideal_cent = out.w1.data;
i_ideal_cent = out.current.data; 
v_ideal_cent = out.V.data; 
p_ideal_cent = v_indv.*i_indv;
tau_ideal_cent = out.tau1.data;

figure(1);
plot(time_ref,ref1,t_ideal_cent,w_ideal_cent,t,w1,t1,w1_central_full,':',t_ind_low,w1_ind_low,'--',t_central_low,w1_central_low,'-.','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',12);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);

figure(11);
plot(time_ref,ref1,t_ideal,w1_ideal,t,w1,':',t_ind_low,w1_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);

figure(2);
plot(t_ideal,i_ideal,t,i_indv,':',t_ind_low,i_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(21);
plot(t_ideal_cent,-i_ideal_cent,t1,-i_central_full,':',t_central_low,-i_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(3);
plot(t_ideal,v_ideal,t,v_indv,':',t_ind_low,v_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);

figure(31);
plot(t_ideal_cent,v_ideal_cent,t1,v_central_full,':',t_central_low,v_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);


figure(4);
plot(t_ideal,p_ideal,t,p_indv,':',t_ind_low,p_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Power (W)','FontSize',20);

figure(41);
plot(t_ideal_cent,p_ideal_cent,t1,p_central_full,':',t_central_low,p_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge''Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Power (W)','FontSize',20);

figure(5);
plot(t_ideal,tau_ideal,t_ind_low,tau_ind_low,':',t_ind_low,tau_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Torque (N)','FontSize',20);

figure(51);
plot(t_ideal_cent,tau_ideal_cent,t1,tau_central_full,':',t_central_low,tau_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Torque (N)','FontSize',20);

%% Pitch

load Indv_FullCharge_Pitch.mat
t = out.w1.time;
w1 = out.w1.data;
w2 = out.w2.data;
w3 = out.w3.data;
w4 = out.w4.data;

time_ref = time;
ref1 = speedCmd(:,1);
ref2 = speedCmd(:,2);
ref3 = speedCmd(:,3);
ref4 = speedCmd(:,4);

i_indv = out.current1.data; 
v_indv = out.V1.data; 
tau_indv = out.tau1.data;
load CentralBattery_Pitch.mat
t1=out.w1.time;
w1_central_full = out.w1.data;
w2_central_full = out.w3.data;
i_central_full = out.current.data;
v_central_full = out.V.data;
tau_central_full = out.tau1.data;
%
load Averaged_Pitch_LowSoC.mat
t_central_low = out.w1.time;
w1_central_low = out.w1.data;
w2_central_low = out.w3.data;
i_central_low = out.current.data;
v_central_low = out.V.data;
tau_central_low = out.tau1.data;
load Indv_LowSoC_Pitch.mat
t_ind_low = out.w1.time;
w1_ind_low = out.w1.data;
w2_ind_low = out.w2.data;
i_ind_low = out.current1.data;
v_ind_low = out.V1.data;
tau_ind_low = out.tau1.data;
load Ideal_Pitch.mat
t_ideal=out.w1.time;
w1_ideal = out.w1.data;
w2_ideal = out.w3.data;
i_ideal = out.current1.data;
v_ideal = out.V1.data;
tau_ideal = out.tau1.data;
load CentralizedIdeal_Pitch.mat
t_ideal_cent = out.w1.time;
w_ideal_cent = out.w1.data;
w2_ideal_cent = out.w3.data;
i_ideal_cent = out.current.data; 
v_ideal_cent = out.V.data; 
p_ideal_cent = v_indv.*i_indv;
tau_ideal_cent = out.tau1.data;
%
figure(1);
tiledlayout(2,1)
%front left rotor
nexttile

plot(time_ref,ref2,t_ideal_cent,w_ideal_cent,t1,w1_central_full,':',t_central_low,w1_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',12);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);title('Front','FontSize',20);
nexttile

plot(time_ref,ref3,t_ideal_cent,w2_ideal_cent,t1,w2_central_full,':',t_central_low,w2_central_low,'--','LineWidth',2);xlim([6,30]);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);title('Back','FontSize',20);

figure(11);
plot(time_ref,ref2,t_ideal,w1_ideal,t,w1,':',t_ind_low,w1_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);



figure(2);
plot(t_ideal,i_ideal,t,i_indv,':',t_ind_low,i_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(21);
plot(t_ideal_cent,-i_ideal_cent,t1,-i_central_full,':',t_central_low,-i_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(3);
plot(t_ideal,v_ideal,t,v_indv,':',t_ind_low,v_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);

figure(31);
plot(t_ideal_cent,v_ideal_cent,t1,v_central_full,':',t_central_low,v_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);


figure(5);
plot(t_ideal,tau_ideal,t_ind_low,tau_ind_low,':',t_ind_low,tau_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Torque (N)','FontSize',20);

figure(51);
plot(t_ideal_cent,tau_ideal_cent,t1,tau_central_full,':',t_central_low,tau_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Torque (N)','FontSize',20);




%% Roll

load Indv_FullCharge_Roll.mat
t = out.w1.time;
w1 = out.w1.data;
w2 = out.w2.data;
w3 = out.w3.data;
w4 = out.w4.data;

time_ref = time;
ref1 = speedCmd(:,1);
ref2 = speedCmd(:,2);
ref3 = speedCmd(:,3);
ref4 = speedCmd(:,4);

i_indv = out.current1.data; 
v_indv = out.V1.data; 
tau_indv = out.tau1.data;
load CentralBattery_Roll.mat
t1=out.w1.time;
w1_central_full = out.w3.data;
w2_central_full = out.w1.data;
i_central_full = out.current.data;
v_central_full = out.V.data;
tau_central_full = out.tau1.data;
%
load Averaged_Roll_LowSoC.mat
t_central_low = out.w1.time;
w1_central_low = out.w3.data;
w2_central_low = out.w1.data;
i_central_low = out.current.data;
v_central_low = out.V.data;
tau_central_low = out.tau1.data;
load Indv_LowSoC_Roll.mat
t_ind_low = out.w1.time;
w1_ind_low = out.w3.data;
w2_ind_low = out.w1.data;
i_ind_low = out.current1.data;
v_ind_low = out.V1.data;
tau_ind_low = out.tau1.data;
load Ideal_Roll.mat
t_ideal=out.w1.time;
w1_ideal = out.w3.data;
w2_ideal = out.w1.data;
i_ideal = out.current1.data;
v_ideal = out.V1.data;
tau_ideal = out.tau1.data;
load CentralizedIdeal_Roll.mat
t_ideal_cent = out.w1.time;
w_ideal_cent = out.w3.data;
w2_ideal_cent = out.w1.data;
i_ideal_cent = out.current.data; 
v_ideal_cent = out.V.data; 
p_ideal_cent = v_indv.*i_indv;
tau_ideal_cent = out.tau1.data;
%
figure(1);
tiledlayout(2,1)
%front left rotor
nexttile

plot(time_ref,ref2,t_ideal_cent,w_ideal_cent,t1,w1_central_full,':',t_central_low,w1_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',12);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);title('Left','FontSize',20)
nexttile

plot(time_ref,ref1,t_ideal_cent,w2_ideal_cent,t1,w2_central_full,':',t_central_low,w2_central_low,'--','LineWidth',2);xlim([6,30]);
%legend('Reference','Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',12);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);title('Right','FontSize',20)

%%
figure(11);
plot(time_ref,ref1,t_ideal,w1_ideal,t,w1,':',t_ind_low,w1_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);

figure(2);
plot(t_ideal,i_ideal,t,i_indv,':',t_ind_low,i_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(21);
plot(t_ideal_cent,-i_ideal_cent,t1,-i_central_full,':',t_central_low,-i_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(3);
plot(t_ideal,v_ideal,t,v_indv,':',t_ind_low,v_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);

figure(31);
plot(t_ideal_cent,v_ideal_cent,t1,v_central_full,':',t_central_low,v_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);

%% NewHeave

load Indv_FullCharge_NewHeave.mat
t = out.w1.time;
w1 = out.w1.data;
w2 = out.w2.data;
w3 = out.w3.data;
w4 = out.w4.data;

time_ref = time;
ref1 = speedCmd(:,1);
ref2 = speedCmd(:,2);
ref3 = speedCmd(:,3);
ref4 = speedCmd(:,4);

i_indv = out.current1.data; 
v_indv = out.V1.data; 

load CentralBattery_NewHeave.mat
t1=out.w1.time;
w1_central_full = out.w1.data;
i_central_full = out.current.data;
v_central_full = out.V.data;
%
load Averaged_NewHeave_LowSoC.mat
t_central_low = out.w1.time;
w1_central_low = out.w1.data;
i_central_low = out.current.data;
v_central_low = out.V.data;
load Indv_LowSoC_NewHeave.mat
t_ind_low = out.w1.time;
w1_ind_low = out.w1.data;
i_ind_low = out.current1.data;
v_ind_low = out.V1.data;
load Ideal_NewHeave.mat
t_ideal=out.w1.time;
w1_ideal = out.w1.data;

i_ideal = out.current1.data;
v_ideal = out.V1.data;
load CentralizedIdeal_NewHeave.mat
t_ideal_cent = out.w1.time;
w_ideal_cent = out.w1.data;
i_ideal_cent = out.current.data; 
v_ideal_cent = out.V.data; 
p_ideal_cent = v_indv.*i_indv;
%
figure(1);
plot(time_ref,ref2,t_ideal_cent,w_ideal_cent,t1,w1_central_full,':',t_central_low,w1_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','Location','northoutside','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);

figure(11);
plot(time_ref,ref1,t_ideal,w1_ideal,t,w1,':',t_ind_low,w1_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Reference','Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);

figure(2);
plot(t_ideal,i_ideal,t,i_indv,':',t_ind_low,i_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(21);
plot(t_ideal_cent,-i_ideal_cent,t1,-i_central_full,':',t_central_low,-i_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(3);
plot(t_ideal,v_ideal,t,v_indv,':',t_ind_low,v_ind_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Individual battery at 100% charge','Individual battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);

figure(31);
plot(t_ideal_cent,v_ideal_cent,t1,v_central_full,':',t_central_low,v_central_low,'--','LineWidth',2);xlim([6,30]);
legend('Ideal Power','Centralized battery at 100% charge','Centralized battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);
