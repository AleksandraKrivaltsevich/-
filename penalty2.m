function numpn = penalty2(qrmat)
% Функция penlt2 вычисляет штраф за каждый блок 2x2 (включая перекрывающиеся блоки).

sum = 0; % Инициализация суммы штрафов

for i = 1:length(qrmat) - 1 % Проход по каждой строке (за исключением последней)
    for j = 2:length(qrmat) % Проход по каждому столбцу (начиная со второго)
        %% Проверка блоков размером 2x2
        %% Проверка черного блока
        if qrmat(i, j) == 0 && qrmat(i, j - 1) == 0
            if qrmat(i + 1, j) == 0 && qrmat(i + 1, j - 1) == 0
                sum = sum + 3; % Увеличение суммы на 3 за каждый черный блок 2x2
            end
        % Проверка белого блока
        elseif qrmat(i, j) == 1 && qrmat(i, j - 1) == 1
            if qrmat(i + 1, j) == 1 && qrmat(i + 1, j - 1) == 1
                sum = sum + 3; % Увеличение суммы на 3 за каждый белый блок 2x2
            end
        end
    end
end

numpn = sum; % Возвращается общая сумма штрафов
end
