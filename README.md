# Assembler
#1. Сложение двух чисел, расположенных в сегменте данных
Используя Пример 1 в качестве шаблона, написать программу вычисления суммы и разности двух длинных целых чисел X и Y, каждое из которых определить в сегменте данных директивой DD со значением 0. 

Указания к решению:
1) Целые X и Y ввести с клавиатуры.
2) Вычислить сумму X+Y c сохранением результата в регистре EAX,  вывести значение EAX на экран как беззнаковое и знаковое целое.
3) Вычислить разность X-Y, используя команду 
       sub приемник, источник  ; (приемник = приемник - источник)
    Сохранить результат в регистре EAX (приемник), вывести значение EAX на экран как беззнаковое и знаковое целое.
4) При получении отрицательных значений результата обратить внимание на представление чисел в дополнительном коде (например, использовать калькулятор Windows в режиме "программист")


#3. Сложение и вычитание с переносом
Написать программу вычисления сумм трех пар целых чисел.

Требования к программе:
разместить в сегменте данных с помощью директивы DB  группу однобайтовых переменных : (X1, X2, X3)  и, с помощью директивы DW, переменные-слова Sum и Dif.  

Ввести числа X1, X2, X3 с клавиатуры, затем:
a)  вычислить сумму Sum = X1+X2+X3, используя сложение с переносом;  вывести результаты на экран в виде числа со знаком и без знака;
b) продублировать вычисления в 16-разрядной арифметике, используя команды расширения и вывести результаты на экран;
c)  реализовать вычитание Dif = X3-X2-X1 с переносом; вывести результат на экран в виде знакового и беззнакового числа;
d)  проверить правильность вычислений  в 32-разрядной арифметике, используя команды расширения c распечаткой результата.

#4.1. Конвертация секунд в часы:минуты:секунды
Пусть T — переменная размером в двойное слово, а H, M и S — байтовые переменные. Считая, что прошло T секунд (0 ≤ T < 86400) от начала суток, определить, сколько полных часов (H), минут (M) и секунд (S) прошло к этому моменту времени.


#4.2. Умножение и деление "длинных" беззнаковых целых чисел.
Для двух чисел-слов X , Y заданных парами байтов (XH, XL), (YH, YL) вычислить их произведение Z, представленное четырьмя байтами (Z3,Z2,Z1,Z0).

Далее:
a) загрузить в регистр EAX значение Z и вывести его на экран;
b) преобразуя пару байтов  (YH, YL) в слово и представляя Z в виде пары слов, вычислить обратное деление X1 = Z/Y и вывести X1 на экран.


#5. Вычисление выражения без использования деления и умножения.
5.6 ( из задачника В.Н.Пильщикова)

Пусть X и Y — беззнаковые переменные-слова. Не используя команды умножения и деления, реализовать следующее присваивание:

а) Y := 4X − X div 8 + X mod 16
б) Y := 35X
и вывести результат на экран.


#6. Степень числа 3.
Пусть N - переменная-слово (N >= 1), а K - переменная-байт. Определить, является ли N степенью числа 3 (1, 3, 9, 27, ...). Если является, то в K записать показатель степени (N = 3^K), не является - записать -1. Вывести значение К на экран.

Указание: использовать операторы условного и безусловного перехода для организации цикла.


#7.1. Подсчет количества точек, попадающих в круг.
1. Для заданного

R DB ? ; 0<R<150 
вычислить и записать в регистр EDX количество точек с целочисленными координатами на плоскости, попадающих в круг радиуса R с центром в начале координат. Вывести значение EDX на экран.

Указание: использовать операторы цикла.


#7.2. Определить наименьшее из чисел, дающее наибольший остаток от деления
 Пусть N и K - переменные-слова и 2 < K < N. Записать в регистр BX наибольший из остатков от деления N на числа 2, 3, ..., К, а в регистр CX - наименьшее из чисел, которые дают этот наибольший остаток. Вывести значения ВX и CX на экран.

Указание: использовать операторы цикла.


#8.1. Последовательность латинских букв (6.27a)
Написать программу на Ассемблере. Задана последовательность малых латинских букв, за которой следует точка. Определить, сколько различных букв входит в эту последовательность.

Указание. Алгоритм не должен содержать строковых команд. Для хранения счётчиков букв использовать массив.


#8.2. Сдвиг массива на несколько позиций
Дано описание:
    N EQU 100
    X DB N DUP(?)
    K DW ? ; 0<K<N
Используя подходящий вспомогательный массив, циклически сдвинуть элементы массива X на K позиций влево.

Указание. Размер массива (N1 <= N), его элементы и величину сдвига K<N1 ввести с экрана. Вывести элементы нового массива на экран.


#9.1. Структура для работы со временем
Дано описание:

    TIME STRUC ; время какого-то момента суток
         H DB ? ; час (от 0 до 23)
         M DB ? ; минута (от 0 до 59)
         S DB ? ; секунда (от 0 до 59)
     TIME ENDS
     T TIME <>
     T1 TIME <>

Присвоить переменной T1 время, на 1 секунду большее времени T. (Учесть смену суток.)

Указание. Ввод полей исходной структуры T произвести с экрана с проверкой соответствующего диапазона. Вывести поля структуры Т1 на экран.


#9.2. Представление дат в виде записей
Дано описание:

     DATE RECORD D:5, M:4, Y:7 ; дата в формате "день-месяц-год (две последние цифры)"
     DATE1 RECORD Y1:7, M1:4, D1:5 ; дата в формате "год-месяц-день"
     A DATE <>
     A1 DATE1 <>

Решить следующую задачу:

вывести дату A в виде dd.mm.yy (например: 16.5.97);
присвоить переменной A1 ту же дату, что записана в переменной A.
вывести дату A1 в виде  yy.mm.dd (например: 97.5.16);
Указание: инициализацию даты A выполнить в программе с диапазонами - день (от 1 до 31), месяц (от 1 до 12) и год (две последние цифры - от 0 до 99)


#10. Генератор случайных чисел
Написать программу для генерации случайных целых чисел.

Указания:
1. Использовать алгоритм Лемера (https://msdn.microsoft.com/ru-ru/magazine/mt767700.aspx).
Алгоритм Лемера - один из самых простых методов генерации случайных чисел. Алгоритм записывается в виде рекуррентной формулы:
X(i) = a * X(i-1) mod m
Величины а, m - некоторые параметры (рекомендуемые значения a = 48271, m = 2147483647).
Пример: пусть в некий момент времени текущее случайное число равно 104, a = 3 и m = 100. Тогда новое случайное число будет равно 3* 104 mod 100 = 312 mod 100 = 12.
2. Для генерации случайных чисел написать процедуру с двумя параметрами: 1) количество генерируемых чисел М<=N (N задать в сегменте данных как константу); 2) ссылка на массив Х[N] для хранения полученных случайных чисел (размещенный в сегменте данных).
3. Сгенерировать массив M случайных чисел с помощью процедуры и записать в массив Х. Предусмотреть возможность ввода размера массива М<=N и начального значения X[0] с экрана. Вывести полученный массив размера М на экран.


#11.1. Вызов трех процедур из отдельного модуля
 Написать и разместить их в отдельном модуле три процедуры для выполнения следующих действий:

a) получение из заданного байта значения в диапазоне [0,7] по трём младшим битам;
b) "одноточечное скрещивание" : обмен двух байтов битовыми значениями относительно заданного разряда c номером n (0 <= n <= 7);
c) "мутация" : изменение в байте значения заданного бита c номером n на "противоположное" (1->0 или 0->1).

В модуле с основной программой:
d) ввести 4 байта B1, B2, B3, B4
e) вычислить n для байта B1 с помощью процедуры a) и вывести полученное значение на экран
f) используя процедуру б) произвести "скрещивание" байтов B2 и B3 относительно разряда под номером n и вывести новые значения на экран
g) используя процедуру в) вызвать "мутацию" байта B4 в разряде под номером n и вывести полученное значение на экран

Указание: вывод всех результатов, в том числе B1,B2,B3,B4 - в двоичном виде (команда outnum).
Выбор способа передачи параметров в процедуры - по желанию.


#12. Подстрока в строке
Для двух символьных строк

S DB 256 DUP(?) ; длина(S)<=255
T DB 101 DUP(?) ; длина(T)<=100

определить, является ли строка T подстрокой строки S, и вывести на экран 1 (является) или 0 (не является).
Указание.  Использовать строковые команды с префиксом повторения. Организовать ввод строк S и Т с клавиатуры, используя пример 13 из темы 2.


#13. Макрос определения знака переменной (13.17)
Описать макрос Sign X (X - знаковая переменная размером в байт, слово или двойное слово), который заносит в регистр AL число -1 при X<0, число 0 при X=0 и число 1 при  X>0. 

Указание: сохранить в стеке значения используемых регистров и затем восстановить их после окончания работы макроса.


