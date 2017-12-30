function [ K, variance ] = get_K( S,percent)
%GET_K Summary of this function goes here
%   Detailed explanation goes here
ii = 0;
S_tmp = 0;
summation = sum(sum(S));
while S_tmp < percent
    ii = ii + 1;
    S_tmp = S_tmp + S(ii,ii)/summation;
end
K = ii;
variance = S_tmp;
end

