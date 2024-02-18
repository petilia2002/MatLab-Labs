% TASK15
n = 1000;
x1 = rand(1, n);
tic
s = sum(x1);
s
toc

tic
s = 0;
for i=1:n
  s += x1(i);
end
s
toc

