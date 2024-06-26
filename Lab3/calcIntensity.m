function [E_p, E_m] = calcIntensity(x, y, R, A, k1, k2, b, c, b_m, c_m)
  [X, Y] = meshgrid(x, y);
  [theta, rho] = cart2pol(X, Y);

  % ------------------Вычислим внутреннее поле----------------------------------

  r = rho(:); % Разворачиваем матрицу с радиусами по столбцам в вектор-столбец
  [B, Rho] = meshgrid(b, r); % Создаем сетку для радиусов

  f = besselj(B, k2 .* Rho); % вычисляем функцию Бесселя для каждого индекса m и радиуса из rho

  phi = theta(:); % Разворачиваем матрицу с фазами по столбцам в вектор-столбец
  [B, Phi] = meshgrid(b, phi); % Создаем сетку для фаз

  kernel = exp(1i .* B .* Phi); % вычисляем экспоненту для каждого индекса m и фазы из theta

  f = f .* kernel; % поэлементно перемножаем Бесселя и экспоненту

  coef = b_m .* (-1i) .^ b; % поэлементно перемножаем коэффициенты ряда на мнимые единицы

  E_p = f * coef';
  E_p = reshape(E_p, length(y), length(x))';
  E_p = abs(A .* E_p);
  E_p(rho > R) = 0;

  % --------------------Вычислим внешнее поле-----------------------------------

  #r = rho(:); % Разворачиваем матрицу с радиусами по столбцам в вектор-столбец
  [C, Rho] = meshgrid(c, r); % Создаем сетку для радиусов

  f = besselh(C, k1 .* Rho); % вычисляем функцию Ханкеля для каждого индекса m и радиуса из rho

  #phi = theta(:); % Разворачиваем матрицу с фазами по столбцам в вектор-столбец
  [C, Phi] = meshgrid(c, phi); % Создаем сетку для фаз

  kernel = exp(1i .* C .* Phi); % вычисляем экспоненту для каждого индекса m и фазы из theta

  f = f .* kernel; % поэлементно перемножаем Бесселя и экспоненту

  coef = c_m .* (-1i) .^ c; % поэлементно перемножаем коэффициенты ряда на мнимые единицы

  E_m = f * coef';
  E_m = reshape(E_m, length(y), length(x))';
  E_m = abs(A .* E_m);
  E_m(rho <= R) = 0;
end




