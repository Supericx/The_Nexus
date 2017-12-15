clc;
clear all;
a = [3 27 60]; % numerator of H(s)
b = [1 6 11 6]; % denominator of H(s)
[r p k] = residue(a,b);
syms s t
Hs = r(1)/(s-p(1)) + r(2)/(s-p(2)) + r(3)/(s-p(3));
ht = ilaplace(Hs,s,t) % impulse response h(t) part 1
Fsa = [2 3]; % numerator of F(s)
Fsb = [1 3 0]; % denominator of F(s)
Ysnum = conv(Fsa,a);
Ysden = conv(Fsb,b);
[u v w] = residue(Ysnum,Ysden);
Ys = floor(u(1))/(s-v(1)) + floor(u(2))/(s-v(2)) + floor(u(3))/(s-v(3)) + u(4)/(s-v(4)) + u(5)/(s-v(5));
yt = ilaplace(Ys,s,t) % impulse response y(t) part 3


