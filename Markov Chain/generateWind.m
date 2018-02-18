%% Generating values depending on the matrix of probabilities 
% @param array   prob The Markov transition matrix 
% @param array   states The states of the Markov chain
% @param integer last   The values that calculates the state of the Markov chain
% @param integer num   The desired number of values
% @return Generated The generated values
function [Generated] = generateWind(prob, states, last, num)
lState = currentState(last, states);  
disp(sprintf('State from which we leave: %d ',lState));

for i=1:num    
    %%  Generate a random number 
    randomNum = rand(1); 
    %disp(sprintf('The random value is: %f ',randomNum));  
    [c nState] = min(abs(prob(lState,:)-randomNum)); 
    %disp(sprintf('The new state is: %d ',nState)); 
    Generated(i) = genValueRange(states(nState,1), states(nState,2));  
    % Initialize the last state with the new one found  
    lState = nState;  
end
end