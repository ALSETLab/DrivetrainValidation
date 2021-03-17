
%% plot speed vs reference 

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
tiledlayout(2,2)
%front left rotor
nexttile
plot(time_ref,ref2,t,w2);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%front right rotor
nexttile
plot(time_ref,ref1,t,w1);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%back left
nexttile
plot(time_ref,ref3,t,w3);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%back right
nexttile
plot(time_ref,ref4,t,w4);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot speed vs reference 

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

time_act = time;
act1 = speedAct(:,1);
act2 = speedAct(:,2);
act3 = speedAct(:,3);
act4 = speedAct(:,4);
tiledlayout(2,2)
%front right rotor
nexttile
plot(time_ref,ref1,t,w1,time_act,act1);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%front left rotor
nexttile
plot(time_ref,ref2,t,w2,time_act,act2);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%back left
nexttile
plot(time_ref,ref3,t,w3,time_act,act3);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');
%back right
nexttile
plot(time_ref,ref4,t,w4,time_act,act4);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');

%% plot tau vs reference 

t = out.tau1.time;
tau1 = out.tau1.data;
tau2 = out.tau2.data;
tau3 = out.tau3.data;
tau4 = out.tau4.data;

time_ref = time;
ref1 = tau(:,1);
ref2 = tau(:,2);
ref3 = tau(:,3);
ref4 = tau(:,4);
tiledlayout(2,2)
%front right rotor
nexttile
plot(time_ref,ref1,t,tau1);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N)');
%front left rotor
nexttile
plot(time_ref,ref2,t,tau2);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N)');
%back left
nexttile
plot(time_ref,ref3,t,tau3);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N)');
%back right
nexttile
plot(time_ref,ref4,t,tau4);xlim([3,5]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Torque (N)');


%% plot voltage

t = out.V1.time;
v1 = out.V1.data;
v2 = out.V2.data;
v3 = out.V3.data;
v4 = out.V4.data;

tiledlayout(2,2)
%front right rotor
nexttile
plot(t,v1);xlim([3,30]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Voltage (V)');
%front left rotor
nexttile
plot(t,v2);xlim([3,30]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Voltage (V)');
%back left
nexttile
plot(t,v3);xlim([3,30]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Voltage (V)');
%back right
nexttile
plot(t,v4);xlim([3,30]);
%legend('Reference','DC motor with added inductance');
xlabel('Time(s)'); ylabel('Voltage (V)');
