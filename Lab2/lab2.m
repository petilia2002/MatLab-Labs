#15. Получить продольное распределение интенсивности светового поля (вдоль оси z при r=0)
#в фокусе апланатического объектива при фокусировке радиально- поляризованной моды R-TEM01
#(параметр β считать равным 1) с длиной волны 0,532 мкм в воздухе (n = 1).
#Вычисления произвести для значения числовой апертуры NA равного 0,9. Затем заменить апланатический
#объектив на плоскую дифракционную линзу. Оценить вклад от использования плоской дифракционной линзы
#в уменьшение размеров фокусного пятна.

lambda = 0.532; % длина волны в мкм
k = 2.0 * pi / lambda; % волновое число
NA = 0.9; % значение числовой апертуры
betta = 1;
n = 1; % воздух
A = 1; % просто константа
A1 = 1; % просто константа

alpha = asin(NA / n); % максимальный угол апертуры

% Функция аподизации зрачка для апланатического объектива:
t_func1 = @(theta) cos(theta) .^ 0.5;
% Функция аподизации зрачка для плоской дифракционной линзы:
t_func2 = @(theta) cos(theta) .^ (-1.5);

% Начальное распределение для апланатического объектива:
l_func1 = @(theta) A1 .* sin(theta) .* ...
          (exp(-1 .* (betta ^ 2) .* sin(theta) .^2 / sin(alpha) ^ 2));
% Начальное распределение для плоской дифракционной линзы:
l_func2 = @(theta) A1 .* tan(theta) .* ...
          (exp(-1 .* (betta ^ 2) .* tan(theta) .^2 / tan(alpha) ^ 2));

r = 0; % в фокусе
z = linspace(-1, 1, 100) .* 10.0 .* lambda;

integ_func1 = @(theta) t_func1(theta) .* l_func1(theta) .* ...
               sin(2.0 .* theta) .* exp(1i .* k .* z .* cos(theta)) .* ...
               besselj(1, k .* r .* sin(theta));

integ_func2 = @(theta) t_func1(theta) .* l_func1(theta) .* ...
               (sin(theta) .^ 2) .* exp(1i .* k .* z .* cos(theta)) .* ...
                besselj(0, k .* r .* sin(theta));

E_r = integral(integ_func1, 0, alpha, 'ArrayValued', true);
E_r = E_r .* A;
E_z = integral(integ_func2, 0, alpha, 'ArrayValued', true);
E_z = E_z .* A .* 2 .* 1i;

I_r = abs(E_r) .^ 2;
I_z = abs(E_z) .^ 2;
I = I_r + I_z;

#figure(1);
#plot(z, I ./ max(I));
#title('Продольное распределение интенсивности в случае объектива');
#xlabel('z, мкм');
#ylabel('I, мкм');

integ_func1 = @(theta) t_func2(theta) .* l_func2(theta) .* ...
               sin(2.0 .* theta) .* exp(1i .* k .* z .* cos(theta)) .* ...
               besselj(1, k .* r .* sin(theta));

integ_func2 = @(theta) t_func2(theta) .* l_func2(theta) .* ...
               (sin(theta) .^ 2) .* exp(1i .* k .* z .* cos(theta)) .* ...
                besselj(0, k .* r .* sin(theta));

E_r = integral(integ_func1, 0, alpha, 'ArrayValued', true);
E_r = E_r .* A;
E_z = integral(integ_func2, 0, alpha, 'ArrayValued', true);
E_z = E_z .* A .* 2 .* 1i;

I_r = abs(E_r) .^ 2;
I_z = abs(E_z) .^ 2;
I1 = I_r + I_z;

#figure(2);
#plot(z, I ./ max(I));
#title('Продольное распределение интенсивности в случае линзы');
#xlabel('z, мкм');
#ylabel('I, мкм');

figure(1);
plot(z, I ./ max(I));
hold on;
plot(z, I1 ./ max(I1));
plot(z, ones(1, 100) .* 0.5);
title('Продольное распределение интенсивности');
legend('Для объектива', 'Для линзы', 'FWHM');
xlabel('z, мкм');
ylabel('I, a.u.');












