function x = test(a,b,c)


if ~(exist('c','var')) ==1
    c = 0;
end
    
x = a + b + c;

end