% TASK14
x1 = linspace(-1, 1, 1000);
tic
x2 = sin(x1);
toc
tic
_x2 = zeros(1, 1000);
for i=1:1000
  _x2(i) = sin(x1(i));
end
toc
isequal(x2, _x2)

