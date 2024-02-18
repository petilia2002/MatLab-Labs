% TASK13
x1 = linspace(-1, 1, 1000);
x2 = sin(x1);
x3 = cos(x1);

figure(1);
plot(x1, x2);
hold on;
plot(x1, x3);
title('Графики синуса и косинуса');
xlabel('x');
ylabel('y');
legend('sin(x)', 'cos(x)', 'location', 'southeast');

