load Simple_L_Battery_secondorder.mat
t = out.w.time;
w1 = out.w.data;


time_ref = t;
ref1 = out.ref1.data;


i_full = out.current.data; 
v_full = out.V.data; 
p_full = v_full.*i_full;

load Simple_noL_secondorder.mat
t_ideal=out.w.time;
w1_ideal = out.w.data;

i_ideal = out.current.data;
v_ideal = out.V.data;

p_ideal = i_ideal.*v_ideal;
%

load Simple_L_lowSoC_secondorder
t_low = out.w.time;
w1_low = out.w.data;
i_low = out.current.data;
v_low = out.V.data;
p_low = v_low.*i_low;
figure(1);
plot(time_ref,ref1,t_ideal,w1_ideal,t,w1,':',t_low,w1_low,'--','LineWidth',2);xlim([5,5.5]);
legend('Reference','Ideal Power','Battery at 100% charge','Battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Speed (rad/sec)','FontSize',20);


figure(2);
plot(t_ideal,i_ideal,t,i_full,':',t_low,i_low,'--','LineWidth',2);xlim([5,5.5]);
legend('Ideal Power','Battery at 100% charge','Battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Current (A)','FontSize',20);

figure(3);
plot(t_ideal,v_ideal,t,v_full,':',t_low,v_low,'--','LineWidth',2);xlim([5,5.5]);
legend('Ideal Power','Battery at 100% charge','Battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Voltage (V)','FontSize',20);


figure(4);
plot(t_ideal,p_ideal,t,p_full,':',t_low,p_low,'--','LineWidth',2);xlim([5,5.5]);
legend('Ideal Power','Battery at 100% charge','Battery at 30% charge','FontSize',14);
xlabel('Time(s)','FontSize',20); ylabel('Power (W)','FontSize',20);

%%

