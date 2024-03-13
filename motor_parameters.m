%Ryley's calculated values
R = 6.2;
L = 3.2E-3;
Km = 0.8878;
b = 1.264E-4;
J = 7.89E-2;    

% %Friend's values
% R = 2.135;
% L = 1.55E-3;
% Km = 1.146E-2;
% b = 1.64E-6;
% J = 0.8E-4;

s = tf('s');
P_motor = Km/(s*((J*s+b)*(L*s+R)+Km^2));
zpk(P_motor)

Ts = 0.001;
dP_motor = c2d(P_motor, Ts, 'zoh');
zpk(dP_motor)

dP_motor = minreal(dP_motor,0.001);
zpk(dP_motor)

sys_cl = feedback(dP_motor,1);
[x1,t] = step(sys_cl,10);
stairs(t,x1)
xlabel('Time (seconds)')
ylabel('Position (radians)')
title('Stairstep Response: Original')
grid