arr = [1, 2 ,3, 4, 5]
arr_with_negative = [9, -1, 0, -3, 8]

p "Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
p "[1, 2, 3, 4 ,5]"
arr.each{ |i| p i if i.even? } + arr.each{ |i| p i if i.odd? }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными."
p "[1, 2, 3, 4 ,5]"
arr.each{ |i| p i if i.odd? } + arr.each{ |i| p i if i.even? }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p "[1, 2, 3, 4 ,5]"
arr.index{|element| p element if arr[0] < element && element < arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p "[1, 2, 3, 4 ,5]"
arr.rindex{|element| p element if arr[0] < element && element < arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять."
p "[1, 2, 3, 4 ,5]"
p arr.map { |e| e != arr[0] && e != arr[-1] && e.even? ? e + arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять."
p "[1, 2, 3, 4 ,5]"
p arr.map { |e| e != arr[0] && e != arr[-1] && e.even? ? e + arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять."
p "[1, 2, 3, 4 ,5]"
p arr.map { |e| e != arr[0] && e != arr[-1] && e.odd? ? e + arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять."
p "[1, 2, 3, 4 ,5]"
p arr.map { |e| e != arr[0] && e != arr[-1] && e.odd? ? e + arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Заменить все положительные элементы на значение минимального."
p "[9, -1, 0, -3, 8]"
p arr_with_negative.map {|e| e > 0 ? arr_with_negative.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Заменить все положительные элементы на значение максимального."
p "[9, -1, 0, -3, 8]"
p arr_with_negative.map {|e| e > 0 ? arr_with_negative.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального."
p "[9, -1, 0, -3, 8]"
p arr_with_negative.map {|e| e < 0 ? arr_with_negative.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального."
p "[9, -1, 0, -3, 8]"
p arr_with_negative.map {|e| e < 0 ? arr_with_negative.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию."
p "[1, 2, 3, 4 ,5]"
p arr.rotate
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию."
p "[1, 2, 3, 4 ,5]"
p arr.rotate(-1)
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil."
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil."
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Найти количество его локальных максимумов."
p "[1, 8, 0, 10, 2, 3, 5, 4, 8, 9, 6]"
arr_max_min = [1, 8, 0, 10, 2, 3, 5, 4, 8, 9, 6]
count_max = 0
arr_max_min.each_cons(3) {|a, b, c| count_max +=1 if a < b && b > c }
p count_max
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Найти количество его локальных минимумов."
p "[1, 8, 0, 10, 2, 3, 5, 4, 8, 9, 6]"
count_min = 0
arr_max_min.each_cons(3) {|a, b, c| count_min +=1 if a > b && b < c }
p count_min
p "--------------------------------------------------------------------------------------------------------------------"
p "Дан целочисленный массив. Найти максимальный из его локальных максимумов."
p "Дан целочисленный массив. Найти минимальный из его локальных минимумов."

