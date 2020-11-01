#----------------------------Variables----------------------------#
# Define random array
rand_arr = Array.new(12) { rand(-5..15) }
# Define random array with float elements
rand_arr_float = Array.new(6) { rand(0..10.0).ceil(3) }
#Define random float
rand_float = rand(0..10.0).ceil(3)
#-----------------------------------------------------------------#


p "1.Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
p rand_arr
rand_arr.each_with_index{ |value, index| p value if index.even? } + rand_arr.each_with_index{ |value, index| p value if index.odd? }
p "--------------------------------------------------------------------------------------------------------------------"
p "2.Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными."
p rand_arr
rand_arr.each_with_index{ |value, index| p value if index.odd? } + rand_arr.each_with_index{ |value, index| p value if index.even? }
p "--------------------------------------------------------------------------------------------------------------------"
p "3.Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p rand_arr
p rand_arr.index{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
p "4.Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p rand_arr
p rand_arr.rindex{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
p "5.Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять."
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "6.Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять."
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "7.Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять."
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "8.Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять."
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
p "9.Дан целочисленный массив. Заменить все положительные элементы на значение минимального."
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "10.Дан целочисленный массив. Заменить все положительные элементы на значение максимального."
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "11.Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального."
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "12.Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального."
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
p "13.Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию."
p rand_arr
p rand_arr.rotate
p "--------------------------------------------------------------------------------------------------------------------"
p "14.Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию."
p rand_arr
p rand_arr.rotate(-1)
p "--------------------------------------------------------------------------------------------------------------------"
p "15.Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil."
p "--------------------------------------------------------------------------------------------------------------------"
p "16.Дан целочисленный массив. Проверить, образуют ли элементы геометрическую прогрессию. Если да, то вывести знаменатель прогрессии, если нет - вывести nil."
p "--------------------------------------------------------------------------------------------------------------------"
p "17.Дан целочисленный массив. Найти количество его локальных максимумов."
p rand_arr
count_max = 0
rand_arr.each_cons(3) {|a, b, c| count_max +=1 if a < b && b > c }
p count_max
p "--------------------------------------------------------------------------------------------------------------------"
p "18.Дан целочисленный массив. Найти количество его локальных минимумов."
p rand_arr
count_min = 0
rand_arr.each_cons(3) {|a, b, c| count_min +=1 if a > b && b < c }
p count_min
p "--------------------------------------------------------------------------------------------------------------------"
p "19.Дан целочисленный массив. Найти максимальный из его локальных максимумов."
p "--------------------------------------------------------------------------------------------------------------------"
p "20.Дан целочисленный массив. Найти минимальный из его локальных минимумов."
p "--------------------------------------------------------------------------------------------------------------------"
p "21.Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают."
p rand_arr
count_mono_up = 0
rand_arr.each_cons(2) { |i,j| count_mono_up +=1 if i < j }
p count_mono_up
p "--------------------------------------------------------------------------------------------------------------------"
p "22.Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно убывают."
p rand_arr
count_mono_down = 0
rand_arr.each_cons(2) { |i,j| count_mono_down +=1 if i > j }
p count_mono_down
p "--------------------------------------------------------------------------------------------------------------------"
p "23.Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу."
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.min}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.min)]}"
p "--------------------------------------------------------------------------------------------------------------------"
p "24.Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу."
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.max}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.max)]}"
p "--------------------------------------------------------------------------------------------------------------------"
p "25.Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент."
p rand_arr
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  if value > 0
    rand_arr_modify  << rand_arr[0]
  end
  rand_arr_modify  << rand_arr[index]
end
p rand_arr_modify
p "--------------------------------------------------------------------------------------------------------------------"
p "26.Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент."
p rand_arr
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  if value < 0
    rand_arr_modify  << rand_arr[0]
  end
  rand_arr_modify  << rand_arr[index]
end
p rand_arr_modify
p "--------------------------------------------------------------------------------------------------------------------"
p "27.Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент."
p rand_arr
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  rand_arr_modify  << rand_arr[index]
  if value > 0
    rand_arr_modify  <<  rand_arr[0]
  end
end
p rand_arr_modify
p "--------------------------------------------------------------------------------------------------------------------"
p "28.Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент."
p rand_arr
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  rand_arr_modify  << rand_arr[index]
  if value < 0
    rand_arr_modify  <<  rand_arr[0]
  end
end
p rand_arr_modify
p "--------------------------------------------------------------------------------------------------------------------"
p "29.Дан целочисленный массив. Упорядочить его по возрастанию."
p rand_arr
p rand_arr.sort
p "--------------------------------------------------------------------------------------------------------------------"
p "30.Дан целочисленный массив. Упорядочить его по убыванию."
p rand_arr
p rand_arr.sort {|x, y| y <=> x }
p "или"
p rand_arr.sort.reverse
p "--------------------------------------------------------------------------------------------------------------------"
p "31.Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность."
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }.reverse
p "--------------------------------------------------------------------------------------------------------------------"
p "32.Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность."
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }
p "--------------------------------------------------------------------------------------------------------------------"
p "33.Дан целочисленный массив. Найти индекс минимального элемента."
p rand_arr
p rand_arr.index(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
p "34.Дан целочисленный массив. Найти индекс максимального элемента."
p rand_arr
p rand_arr.index(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
p "35.Дан целочисленный массив. Найти индекс первого минимального элемента."
p rand_arr
p rand_arr.index(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
p "36.Дан целочисленный массив. Найти индекс первого максимального элемента."
p rand_arr
p rand_arr.index(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
p "37.Дан целочисленный массив. Найти индекс последнего минимального элемента."
p rand_arr
p rand_arr.rindex(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
p "38.Дан целочисленный массив. Найти индекс последнего максимального элемента."
p rand_arr
p rand_arr.rindex(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
p "39.Дан целочисленный массив. Найти количество минимальных элементов."
p rand_arr
p rand_arr.count(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
p "40.Дан целочисленный массив. Найти количество максимальных элементов."
p rand_arr
p rand_arr.count(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
p "41.Дан целочисленный массив. Найти минимальный четный элемент."
p rand_arr
p rand_arr.select{ |i| i if i.even? }.min
p "--------------------------------------------------------------------------------------------------------------------"
p "42.Дан целочисленный массив. Найти минимальный нечетный элемент."
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.min
p "--------------------------------------------------------------------------------------------------------------------"
p "43.Дан целочисленный массив. Найти максимальный четный элемент."
p rand_arr
p rand_arr.select{ |i| i if i.even? }.max
p "--------------------------------------------------------------------------------------------------------------------"
p "44.Дан целочисленный массив. Найти максимальный нечетный элемент."
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.max
p "--------------------------------------------------------------------------------------------------------------------"
p "45.Дан целочисленный массив. Найти минимальный положительный элемент."
p rand_arr
p rand_arr.select{ |i| i if i > 0 }.min
p "--------------------------------------------------------------------------------------------------------------------"
p "46.Дан целочисленный массив. Найти максимальный отрицательный элемент."
p rand_arr
p rand_arr.select{ |i| i if i < 0 }.max
p "--------------------------------------------------------------------------------------------------------------------"
p "47.Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале."

