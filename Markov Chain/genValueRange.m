%% Generates values in a given interval
% @param integer min The minimum value
% @param integer max The maximum value
% @retrun integer val The generated value
function [val] = genValueRange(min, max) 
nr=1;
val=min+(max-min)*rand(1,1);
end 
