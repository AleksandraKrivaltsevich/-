function res = binary_to_digital( bitstr )
% Функция  принимает строку из бинарных символов и преобразует её в десятичное число.
% bitstr: входная строка бинарных символов
% res: результат преобразования в десятичное число

% Проверяем, является ли входной аргумент ячеистым массивом строк (если да, то это, вероятно, результат работы другой функции)
if(iscellstr(bitstr))
    blen = length(bitstr{1}); % Определяем длину строки бинарных символов
    bflp = fliplr(bitstr{1}); % Разворачиваем строку, чтобы начать с младшего бита
else
    blen = length(bitstr); % Определяем длину строки бинарных символов
    bflp = fliplr(bitstr); % Разворачиваем строку, чтобы начать с младшего бита
end

sum = 0; % Инициализируем переменную для хранения суммы

% Проходим по каждому символу строки
for i = 1:blen
    % Добавляем к сумме значение, соответствующее i-му биту, умноженному на 2^(i-1)
    sum = sum + (2^(i-1))*(str2double(bflp(i)));
end

res = sum; % Возвращаем сумму как результат работы функции
end
