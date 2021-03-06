 plot(time_170,current_170,time_50,current_50,time_500,current_500,'LineWidth',1);xlim([10,11])
 legend('L=170e6', 'L=500e6','L=50e6');
xlabel('Time(s)'); ylabel('Current (A)');

%%
for i = 2:2964
    w_simp1(i) = w_simp(i-1)*0.25 + w_simp(i)*0.5 + w_simp(i+1)*0.25;
end;
w_simp1=w_simp1';
plot(time_ref,ref,time,w,time_ref,w_simp1, 'LineWidth',5); xlim([9.5,11]);
legend('Reference','DC motor with inductance','Simplified DC motor');
xlabel('Time(s)'); ylabel('Speed (rad/sec)');set(gca,'FontSize', 17);
w_simp1=w_simp1';


%%
t = out.tau.data;
time = out.w.time;

plot(time,t); %xlim([5,5.5]); 
xlabel('Time(s)'); ylabel('Torque (N*m)');
%%
current1 = out.DC1.data;
time1 = out.DC1.time./60;

plot(time1,current1,'LineWidth',5,'Color',co(2,:));
hold on;%xlim([0,5]); 
plot(time1,voltage,'LineWidth',5,'Color',co(3,:));
xlabel('Time(min)'); ylabel('Battery voltage (V)');set(gca,'FontSize', 18);

%%
figure
current1 = out.DC.data;
time1 = out.DC.time;
co = get(gca,'ColorOrder');

plot(time,current,'LineWidth',5,'Color',co(2,:))
hold on
plot(time1,-current1/2.7,'LineWidth',5,'Color',co(3,:))
% plot(h,time1,current1,time,current,'LineWidth',5);
xlim([9.5,11]); ylim([10,35]);

xlabel('Time(s)'); ylabel('Battery current (A)');set(gca,'FontSize', 20)
%%
current = out.DC1.data;
time = out.DC1.time;

plot(time,current,'LineWidth',5,'Color',co(2,:));xlim([9.5,11]); 
hold on
plot(time1,-current1,'LineWidth',5,'Color',co(3,:));xlim([9.5,11]); 
xlabel('Time(min)'); ylabel('Battery current (A)');set(gca,'FontSize', 18);

%%
for i = 2:length(current)-1
    current_simp(i) = current(i-1)*0.25 + current(i)*0.5 + current(i+1)*0.25;
end;

current_simp=current_simp';
time_ref = time_ref(1:2964)
plot(time,current,'LineWidth',5,'Color',co(2,:));xlim([9.5,11]);
hold on
plot(time_simp,current_simp,'LineWidth',5,'Color',co(3,:));%xlim([9.5,11]);

xlabel('Time(min)'); ylabel('Battery current (A)');set(gca,'FontSize', 20)
%%

power = out.current.data.*out.voltage.data;
time = out.current.time;
plot(time,power);%xlim([9.5,11]); 
xlabel('Time(s)'); ylabel('Motor power (W)');

%%
SOC = out.SOC.data;
time = out.SOC.time;

plot(time,SOC);
xlabel('Time(s)'); ylabel('State of Charge');

%%

plot(out.pwm.time,out.pwm.data);xlim([5.0,15.5]); 
figure;plot(out.pid_out.time,out.pid_out.data);xlim([5.0,5.5]); 