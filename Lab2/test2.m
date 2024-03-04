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

z = 0; % в фокусе
x = linspace(-1, 1, 100) .* 2.0 .* lambda;
y = x;
[X, Y] = meshgrid(x, y);
[~, r] = cart2pol(X, Y); % диапазон радиусов

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

xInterp = linspace(-1, 1, 1000) .* 2.0 .* lambda;
yInterp = xInterp;
[X_interp, Y_interp] = meshgrid(xInterp, yInterp);

I_interp = interp2(X, Y, I, X_interp, Y_interp, 'spline');

figure(1);
imagesc(xInterp, yInterp, I_interp);
colormap('jet');
colorbar;
axis xy;
title('Распределение интенсивности при объективе');
xlabel('x, мкм');
ylabel('y, мкм');

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
I = I_r + I_z;

xInterp = linspace(-1, 1, 1000) .* 2.0 .* lambda;
yInterp = xInterp;
[X_interp, Y_interp] = meshgrid(xInterp, yInterp);

I_interp = interp2(X, Y, I, X_interp, Y_interp, 'spline');

figure(2);
imagesc(xInterp, yInterp, I_interp);
colormap('jet');
colorbar;
axis xy;
title('Распределение интенсивности при линзе');
xlabel('x, мкм');
ylabel('y, мкм');















