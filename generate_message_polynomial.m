function res = generate_message_polynomial( bitstr )
% Функция принимает на вход строку из битов.
% Она используется для генерации многочлена на основе битовой строки.
% Например, если на вход подается строка '110010100111', функция
% разобьет ее на отдельные байты и преобразует каждый байт в
% десятичное число.
% 
% Аргументы:
%   bitstr: строка из битов, которая будет преобразована в многочлен
%
% Возвращаемое значение:
%   res: массив коэффициентов многочлена
%
% Пример использования:
%   generate_message_polynomial('110010100111') возвращает [201, 39]
%

numcof = length(bitstr)/8; % Вычисляем количество байт в строке
Cof = zeros(1 , numcof);   % Инициализируем массив коэффициентов

k = 1; % Инициализируем индекс для перебора битов

for i = 1:numcof
    byt = bitstr(k:k+7); % Вырезаем сегменты по 8 бит (байт)
    Cof(i) = binary_to_digital(byt); % Преобразуем байт в десятичное число
    k = k + 8; % Переходим к следующему байту
end

res = Cof; % Возвращаем массив коэффициентов многочлена
end
