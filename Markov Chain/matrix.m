load windSpeed.mat

%% for Group 1 - Jan, Feb, Mar, April
data = windSpeed(1: 2879)
n = 2879

%% for Group 2 - May, June
%data = windSpeed(2880:4343)
%n = 4343 - 2880 + 1

%% for Group 3 - July
%data = windSpeed(4344:5087)
%n = 5087 - 4344 + 1

%% for Group 4 - August, September
%data = windSpeed(5088: 6551)
%n = 6551 - 5088 + 1

%% for Group 5 - October, November, December
%data = windSpeed(6552:8712)
 %n = 8712 - 6552 + 1

%% Data gathering.
a = 1: n-23;
b = n-23:n;

WindData =  data(a);
WindDataFuture =  data(b);
m = mean(WindData);
s = std2(WindData);
% Removal of the NaN (Not a Number) data
WindData = WindData(isfinite(WindData(:, 1)), :);
%WindDataFuture = WindDataFuture(isfinite(WindDataFuture(:, 1)), :);    
disp(sprintf('The lowest recorded speed: %f',min(WindData)));
disp(sprintf(' The highest recorded speed: %f',max(WindData)));
disp(sprintf('Mean speed: %f',mean(WindData)));


 %% The definition of the states.
 % Observation! The last state is v > 13 m/s.
states = [0 m-s; m-s m; m m+s; m+s m+2*s; m+2*s m+3*s; m+3*s m+4*s; m+4*s m+5*s; m+5*s m+6*s]; 
Markov1 = matrixMarkov(WindData, states, 1); 
disp(Markov1);  
Markov2calc = Markov1^2;
disp('The 2nd order transition matrix calculated with Chapman-Kolmogorov equations:');
disp(Markov2calc); 
Markov2est = matrixMarkov(WindData, states, 2);
disp(Markov2est); 
%% Generating data using the obtained Markov chain 
% Setting of the last known value
last = WindData(length(WindData));
% The length of the string that we will compare to
l = length(WindDataFuture); 
NewGeneratedWind = 0;
k = 10;
for i=1:k
GeneratedWind = generateWind(Markov2est, states, last, l);
disp(GeneratedWind)
NewGeneratedWind = NewGeneratedWind + GeneratedWind;
end
GeneratedWind = NewGeneratedWind/k;

% The graph 
xAxis = 1:24;
d = 1:24;
plot(xAxis, GeneratedWind, 'b*-', xAxis, WindDataFuture, 'ro-');
title('Forecasted windspeeds')
xlabel('Time (24 hours)') % x-axis label
ylabel('Windspeed(m/s)') % y-axis label
legend('predicted','actual','location','northwest')

E = GeneratedWind(d) - WindDataFuture(d);
RMSE = sqrt(mean((E).^2));
disp('The RMSE Of Above values is:')
disp(RMSE)
MAPE = abs(E) / GeneratedWind(d);
disp('The MAPE Of Above values is:')
disp(MAPE)
MAE = mae(E);
disp('The MAE Of Above values is:')
disp(MAE)

