
load windSpeed.mat

n=5064;
data = windspeed(1:5064);
pred = 24;

[c,l]= wavedec(data, 3, 'db1');

A3 = c(1:n/8);
D3 = c(n/8 + 1:n/4);
D2 = c(n/4 + 1: n/2);
D1 = c(n/2 + 1: n);



total = n + pred;
L = [total/8; total/8; total/4; total/2; total];



%wavelet_final = waverec(details,L,'haar');

%{
wavelet0 = wavelet_final(n + 1: n + pred);
test = windSpeed(n + 1: n + pred);
xAxis = 1:pred;
d = 1:pred; 

plot(xAxis, wavelet0, 'b*-', xAxis, test, 'ro-');
title('Forecasted windspeeds')
xlabel('Time (24 hours)') % x-axis label
ylabel('Windspeed(m/s)') % y-axis label
legend('actual','predicted','location','northwest')
E = wavelet0(d) - test(d);
RMSE = sqrt(mean((E).^2));
disp('The RMSE Of Above values is:')
disp(RMSE)
%MAPE = abs(E) / test(d);
%disp('The MAPE Of Above values is:')
%disp(MAPE)
MAE = mae(E);
disp('The MAE Of Above values is:')
disp(MAE)
%power=0.5*1.225*7386*1*(test.*test.*test);
%disp(power)
%plot(power);
%title('Estimated Power')
%xlabel('Time (24 hours)') % x-axis label
%ylabel('WindPower(Watts)') % y-axis label
%}