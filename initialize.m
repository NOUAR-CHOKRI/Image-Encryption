%
%   Nouar Chokri
%   Github : https://github.com/NOUAR-CHOKRI
%   Researchgate : https://www.researchgate.net/profile/Chokri-Nouar
%  Encryption image function 

function [x,y,r]=initialize(k)

clear; clc;
ks = 'chokri';
key = reshape(dec2bin(ks, 8).'-'0',1,[]);

L = length(key);
M = floor(L/192);
k = zeros(1,192);

for i=1:192
    for j=1:M+1
        k(i)=bitxor(k(i),key(mod(i+192*j,L)+1));
    end
    x=0; y=0; r=0;
end

for i=1:64
    x = x + bitxor(k(192-3*i+3),mod(k(3*i-2)+1,2))*2.^i;
    y = y + bitxor(k(192-3*i+2),mod(k(3*i-1)+1,2))*2.^i;
    r = r + bitxor(k(192-3*i+1),mod(k(3*i)+1,2))*2.^i;
end    

x = x/2.^64; 
y = y/2.^64;
r = 2 + r/2.^64;


end

