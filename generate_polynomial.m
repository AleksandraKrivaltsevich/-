function res = generate_polynomial( numecc , gftab )
% Функция используется для генерации полинома для коррекции ошибок.
% Она принимает на вход количество кодовых слов коррекции ошибок и таблицу приведенных корней Галуа.
% Аргументы:
%   numecc: количество кодовых слов коррекции ошибок
%   gftab: таблица приведенных корней Галуа
% Возвращаемое значение:
%   res: массив коэффициентов сгенерированного полинома
%
% Пример использования:
%   genPoly(10, gftab) возвращает массив коэффициентов полинома
%

p1 = [ 0 0 ]; % Начальный полином
k = 2;

if( numecc < 7 )
    error('Требуется как минимум 7 кодовых слов коррекции ошибок в блоке.');
end

for i = 1:(numecc-1)
    pp = zeros(1,k + 1); % Создаем массив для нового полинома

    p2 = [0 i]; % Формируем новый полином
    np2 = p1 + i; % Добавляем i к предыдущему полиному
    np2 = mod(np2 , 255); % Выполняем операцию по модулю 255
    pp(end) = np2(end); % Записываем последний элемент нового полинома
    
    for j = 2:k
        % Извлекаем числа из таблицы приведенных корней Галуа
        num1 = gftab(p1(j)  + 2); 
        num2 = gftab(np2(j-1) + 2);
        nxor = bitxor(num1 , num2); % Выполняем операцию исключающего ИЛИ
        nalp = find(gftab == nxor) - 2; % Находим соответствующий полином
        pp(j) = nalp; % Записываем в массив нового полинома
    end
    
    p1 = pp; % Обновляем предыдущий полином
    k = k + 1; % Увеличиваем счетчик для создания нового полинома
end

res = pp; % Возвращаем сгенерированный полином
end