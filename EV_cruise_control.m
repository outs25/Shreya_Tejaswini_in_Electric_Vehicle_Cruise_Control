clc;
clear all;
close all;

%% ELECTRIC VEHICLE CRUISE CONTROL SYSTEM
disp('Electric Vehicle Cruise Control System');

%% Transfer Function
s = tf('s');
G = 1/(5*s + 1);
disp('Vehicle Transfer Function:');
G;

%% PI Controller Parameters
Kp = 1.2;
Ki = 0.4;
C = Kp+ Ki/s;
disp('PI Controller:');
C;

%% Closed Loop System
sys_cl = feedback(C*G,1);
disp('Closed Loop Transfer Function:');
sys_cl;

%% STEP RESPONSE OF CONTROLLED SYSTEM
figure;

[y_step,t_step] = step(sys_cl);
plot(t_step,y_step,'LineWidth',2);
title('Closed Loop Step Response');
xlabel('Time (s)');
ylabel('Vehicle Speed');
grid on;

%% OPEN LOOP vs CLOSED LOOP COMPARISON
figure;
[y1,t1] = step(G);
plot(t1,y1,'r','LineWidth',2);
hold on;

[y2,t2] = step(sys_cl);
plot(t2,y2,'b','LineWidth',2);
legend('Without Controller','With PI Controller');
title('Comparison of Open Loop and Closed Loop Response');
xlabel('Time (s)');
ylabel('Vehicle Speed');
grid on;

%% DISTURBANCE ANALYSIS

t = 0:0.1:30;
% Normal response
[y,t] = step(sys_cl,t);
% Copy original response
y_disturbed = y;
% Disturbance 1: speed drop at 10s
for i = 1:length(t)

    if t(i) >= 10 && t(i) <= 15

        y_disturbed(i) = y(i) - 0.12*exp(-1.5*(t(i)-10));

    end

end

% Disturbance 2: slight speed increase at 20s
for i = 1:length(t)

    if t(i) >= 20 && t(i) <= 23

        y_disturbed(i) = y_disturbed(i) + ...
            0.05*exp(-1.5*(t(i)-20));

    end

end

%% PLOT

figure;
plot(t,y,'b','LineWidth',2);
hold on;
plot(t,y_disturbed,'r','LineWidth',2);
yline(1,'--k','Desired Speed');
xlabel('Time (s)');
ylabel('Vehicle Speed');
title('Disturbance Rejection Analysis');
legend('Normal Response','Disturbed Response','Desired Speed',Location='southeast');

grid on;

%% PERFORMANCE METRICS
info = stepinfo(sys_cl);
fprintf('\n PERFORMANCE METRICS \n');
fprintf('Rise Time = %f seconds\n',info.RiseTime);
fprintf('Settling Time = %f seconds\n',info.SettlingTime);
fprintf('Overshoot = %f %%\n',info.Overshoot);
fprintf('Peak Value = %f\n',info.Peak);

%% DC GAIN
gain = dcgain(sys_cl);
fprintf('DC Gain = %f\n',gain);

%% STEADY STATE ERROR
ess=1-gain;
fprintf('Steady State Error = %f\n',ess);

%% ROOT LOCUS
%figure;
%sys_open=C*G;
%rlocus(sys_open(1,1));
%title('Root Locus Plot');
%grid on;

%% BODE PLOT
%%figure;
%bode(sys_cl);
%title('Bode Plot');
%grid on;

%% POLE ZERO MAP
%figure;
%pzmap(sys_cl);
%title('Pole Zero Map');
%grid on;

%% AUTOMATIC PI TUNING
disp('Automatic PI Tuning');
[C_auto,info_autotune] = pidtune(G,'PI');
C_auto.Kp=0.8;
C_auto.Ki = 0.2;
T_auto = feedback(C_auto*G,1);
figure;
[y_auto,t_auto]=step(T_auto);
plot(t_auto,y_auto,'LineWidth',2);
info_auto = stepinfo(T_auto);
fprintf('\n AUTO TUNED CONTROLLER PERFORMANCE WITH MANUAL REFINEMENTS \n');
fprintf('Rise Time = %f seconds\n',info_auto.RiseTime);
fprintf('Settling Time = %f seconds\n',info_auto.SettlingTime);
fprintf('Overshoot = %f %%\n',info_auto.Overshoot);
fprintf('Peak Value = %f\n',info_auto.Peak);
title('Auto Tuned PI Controller Response with Manual Refinements');
xlabel('Time (s)');
ylabel('Vehicle Speed');
grid on;

%% FINAL MESSAGE
disp('Cruise Control System Simulation Completed Successfully');
