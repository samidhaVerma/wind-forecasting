load windSpeed.mat

n = 24;
data_test = windspeed(5065:5088);

[c_test,l_test]= wavedec(data_test, 3, 'db1');

A3_test = c_test(1:n/8);
D3_test = c_test(n/8 + 1:n/4);
D2_test = c_test(n/4 + 1: n/2);
D1_test = c_test(n/2 + 1: n);
