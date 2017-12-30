function [ var ] = get_var( S, K )
%GET_PERCENT Summary of this function goes here
%   Detailed explanation goes here
S = sum(S,2);
var = sum(S(1:K))/sum(S);

end

