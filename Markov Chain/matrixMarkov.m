%% Calculation of the Markov transition matrix of desired order
% @param array data    The time series to analyze
% @param array states  The states for the Markov chain 
% @param byte  ordinul The desired order 
% @return array Prob  The Markov transition matrix 
function [Prob] = matrixMarkov(data, states, ordin) 
stateslength = length(states);  
%% The initialization of the matrix 
Prob = zeros (stateslength, stateslength); 
n = length(data);

for i=1:n-ordin 
    cState = currentState(data(i), states); 
    nState = currentState(data(i+ordin), states); 
    Prob(cState, nState) = Prob(cState, nState) + 1;
end
for i=1:stateslength  
    Prob(i,:) = Prob(i,:)/ sum(Prob(i,:));
end
disp(sprintf('The estimated matrix of transition of order %d is:',ordin));
end


 