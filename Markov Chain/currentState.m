%% Calculates the state in which the given value is assigned 
function [stateValue] = currentState(val, states)
%% We initiate with state 1 
stateValue = 1; n = length(states);
for k = 1:n 
    if (val > states(k,1) && val <= states(k,2)) 
        stateValue = k;  
    end
end