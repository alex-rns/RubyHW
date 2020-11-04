#----------------------------Variables----------------------------#
# Define random array
rand_arr = Array.new(12) { rand(-5..15) }
# Define random array with float elements
rand_arr_float = Array.new(6) { rand(0..10.0).ceil(3) }
#Define random float
rand_float = rand(0..10.0).ceil(3)
# Define random interval
interval = rand(1...5)..rand(5..10)
# Define random integer
rand_int = rand(1...15)
#-----------------------------------------------------------------#
separator = "--------------------------------------------------------------------------------------------------------------------"

# Function of outputting tasks from file
@task_count = 0
def get_task
  if File.exists?("ruby_tasks")
    task_array = IO.readlines("ruby_tasks")
    p (@task_count+1).to_s + ". " + task_array[@task_count].strip
    @task_count += 1
  else
    p "Not found file 'ruby_tasks'"
  end
end
#-----------------------------------------------------------------#

#1
get_task
p rand_arr
#Сортируем массив методами .each_with_index. Если индекс чётный(index.even?) - выводим значение этого индекса.
#Таким же образом сортируем массив на нечётные индексы.
rand_arr.each_with_index{ |value, index| p value if index.even? } + rand_arr.each_with_index{ |value, index| p value if index.odd? }
p separator

#2
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
rand_arr.each_with_index{ |value, index| p value if index.odd? } + rand_arr.each_with_index{ |value, index| p value if index.even? }
p separator

#3
get_task
p rand_arr
#Проверяем элемент на два условия. Выводим или индекс первого попавшегося элемента или "[]".
p rand_arr.index{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p separator

#4
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
#Для вывода последнего найденного индекса используем метод .rindex.
p rand_arr.rindex{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p separator

#5
get_task
p rand_arr
#Перебираем массив методом .map. Проверяем на условия rand_arr[0], rand_arr[-1], e.even?
#Если элемент массива не совпадает с этими условиями, добавляем к нему первый элемент (e + rand_arr[0]).
#Если одно из условий совпадает, оставляеи элемент в массиве, без изменений.
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[0]: e}
p separator

#6
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[-1]: e}
p separator

#7
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[-1]: e}
p separator

#8
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[0]: e}
p separator

#9
get_task
p rand_arr
#Перебираем массив, если элемент положительный, меняем его на минимальный (rand_arr.min).
p rand_arr.map {|e| e > 0 ? rand_arr.min : e }
p separator

#10
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map {|e| e > 0 ? rand_arr.max : e }
p separator

#11
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map {|e| e < 0 ? rand_arr.min : e }
p separator

#12
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.map {|e| e < 0 ? rand_arr.max : e }
p separator

#13
get_task
p rand_arr
#Для сдвига элементов используем метод .rotate.
p rand_arr.rotate
p separator

#14
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.rotate(-1)
p separator

#15
get_task
p rand_arr #= [-1, 3, 7, 11, 15, 19, 23]
# Перебираенм массив выборкой по два элемента. Сравниваем разность этих элементов и помещаем в новый массив.
# Методом .uniq избавляемся от повторяющейся разности прогрессии.
diff = rand_arr.each_cons(2).map { |el| el[1] - el[0] }.uniq
# Проверяем, если элемент в массиве остался один, значит все элементы образуют арифметическую прогрессию.
# Выводим этот элемент, он и будет разницей прогресии.
p diff.size > 1 ? nil : diff[0]
p separator

#16
get_task
p rand_arr #= [2, 4, 8, 16, 32, 64]
#Аналогичное решение предыдущей задачи.
if rand_arr.include?(0)
  p " Массив содержит элемент со значением '0'. Проверка невозможна."
else
  diff = rand_arr.each_cons(2).map { |el| el[1] / el[0] }.uniq
  p diff.size > 1 ? nil : diff[0]
end
p separator

#17
get_task
p rand_arr
#Используем метод .each_cons(). Перебираем массив по три элемента,
# если средний элемент больше соседних, плюсюем счётчик.
count_max = 0
rand_arr.each_cons(3) {|a, b, c| count_max +=1 if a < b && b > c }
p count_max
p separator

#18
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
count_min = 0
rand_arr.each_cons(3) {|a, b, c| count_min +=1 if a > b && b < c }
p count_min
p separator

#19
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
#Каждый максимум добавляем в новый массив, из которого выводим максимальный элемент.
maxi = []
rand_arr.each_cons(3) {|a, b, c| maxi << b if a < b && b > c }
p maxi.max
p separator

#20
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
mini = []
rand_arr.each_cons(3) {|a, b, c| mini << b if a > b && b < c }
p mini.min
p separator

#21
get_task
p rand_arr
#Если считать, что монотонное возрастание - это увеличение значения по сравнению с предыдущим элеметом:
#Сравниваем поочерёдно два элемента, если правый больше, плюсуем счётчик.
count_mono_up = 0
rand_arr.each_cons(2) { |i,j| count_mono_up +=1 if i < j }
p count_mono_up
p separator

#22
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
count_mono_down = 0
rand_arr.each_cons(2) { |i,j| count_mono_down +=1 if i > j }
p count_mono_down
p separator

#23
get_task
p "R = #{rand_float}"
p rand_arr_float
#Преобразуем в новый массив, где элементы - это разница по модулю между данным числом и каждым элементом исходного массива.
diff = rand_arr_float.map{|element| (rand_float - element).abs}
# Находим минимальный элемент из нового массива и выводим его индекс по отношению к исходному массиву.
p "Наименьшая разница: #{diff.min}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.min)]}"
p separator

#24
get_task
p "R = #{rand_float}"
p rand_arr_float
#Аналогичное решение предыдущей задачи.
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.max}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.max)]}"
p separator

#25
get_task
p rand_arr
rand_arr_modify = []
#Перебираем массив методом .each_with_index.
rand_arr.each_with_index do |value, index|
#Если элемент массива больше нуля - пушим в новый массив первый элемент исходного массива.
  if value > 0
    rand_arr_modify  << rand_arr[0]
  end
#Пушим в новый массив каждый элемент исходного.
  rand_arr_modify  << rand_arr[index]
end
p rand_arr_modify
p separator

#26
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  if value < 0
    rand_arr_modify  << rand_arr[0]
  end
  rand_arr_modify  << rand_arr[index]
end
p rand_arr_modify
p separator

#27
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
#Сначала пушим в новый массив
  rand_arr_modify  << rand_arr[index]
#Потом перебираем по условию и добавляем нулевой элемент.
  if value > 0
    rand_arr_modify  <<  rand_arr[0]
  end
end
p rand_arr_modify
p separator

#28
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  rand_arr_modify  << rand_arr[index]
  if value < 0
    rand_arr_modify  <<  rand_arr[0]
  end
end
p rand_arr_modify
p separator

#29
get_task
p rand_arr
#Используем метод .sort
p rand_arr.sort
p separator

#30
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.sort {|x, y| y <=> x }
p "или"
p rand_arr.sort.reverse
p separator

#31
get_task
p rand_arr
#Сортируем массив по индексу, сопоставляя индексам значения элементов. Переворачиваем массив.
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }.reverse
p separator

#32
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }
p separator

#33
get_task
p rand_arr
#Находим минимальный элемент массива и выводим его индекс.
p rand_arr.index(rand_arr.min)
p separator

#34
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

#35
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.min)
p separator

#36
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

#37
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.min)
p separator

#38
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.max)
p separator

#39
get_task
p rand_arr
#Методом .count считаем найденные минимальные элементы.
p rand_arr.count(rand_arr.min)
p separator

#40
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.count(rand_arr.max)
p separator

#41
get_task
p rand_arr
#Методом .select выбираем чётные элементы. Выводим минимальный из них.
p rand_arr.select{ |i| i if i.even? }.min
p separator

#42
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.select{ |i| i if i.odd? }.min
p separator

#43
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.select{ |i| i if i.even? }.max
p separator

#44
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.select{ |i| i if i.odd? }.max
p separator

#45
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.select{ |i| i if i > 0 }.min
p separator

#46
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.select{ |i| i if i < 0 }.max
p separator

#47
get_task
p rand_arr, interval
#Методом .select выбираем все значения массива, который есть в пределах интервала. Выводим минимальный элемент.
p rand_arr.select { |index| interval === index }.min
p separator

#48
get_task
p rand_arr, interval
#Аналогичное решение предыдущей задачи.
p rand_arr.select { |index| interval === index }.max
p separator

#49
get_task
p rand_arr
#Находим минимальный элемент. Его индекс соответствует числу колличетва элементов до него.
p rand_arr.index(rand_arr.min)
p separator

#50
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

#51
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.size-1 - rand_arr.index(rand_arr.max)
p separator

#52
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.size-1 - rand_arr.index(rand_arr.min)
p separator

#53
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.max)
p separator

#54
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.min)
p separator

#55
get_task
p rand_arr
#Аналогичное решение предыдущей задачи.
p rand_arr.size-1 - rand_arr.rindex(rand_arr.max)
p separator

#56
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.size-1 - rand_arr.rindex(rand_arr.min)
p separator

#57
get_task
p rand_arr
# Находим индекс минимального и максимального элемента массива.
mini_idx = rand_arr.index(rand_arr.min)
maxi_idx = rand_arr.index(rand_arr.max)
p "Индекс первого минимального элемента: #{mini_idx}"
p "Индекс первого максимаотного элемента: #{maxi_idx}"
# Сравниваем какой индекс идёт первым.
extrem_idx = mini_idx < maxi_idx ? mini_idx : maxi_idx
p "Индекс первого из них (экстремального элемента): #{extrem_idx}"
p separator

#58
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
mini_idx = rand_arr.index(rand_arr.min)
maxi_idx = rand_arr.index(rand_arr.max)
p "Индекс первого минимального элемента: #{mini_idx}"
p "Индекс первого максимаотного элемента: #{maxi_idx}"
extrem_idx = mini_idx > maxi_idx ? mini_idx : maxi_idx
p "Индекс последнего из них (экстремального элемента): #{extrem_idx}"
p separator

#59
get_task
p rand_arr
# Находим разницу индексов между первым и последним минимальным.
diff_min = rand_arr.rindex(rand_arr.min) - rand_arr.index(rand_arr.min)
# Разница будет = 0, если минимальный элемент один.
if diff_min == 0
  p "Минимальный элемент только один"
else
# Если элементов два и больше, отнимаем единицу и выводим результат.
  diff_min -= 1
  p "Колличество элементов между первым и последним минимальным #{diff_min}"
end
p separator

#60
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
diff_max = rand_arr.rindex(rand_arr.max) - rand_arr.index(rand_arr.max)
if diff_max == 0
  p "Максимальный элемент только один"
else
  diff_max-= 1
  p "Колличество элементов между первым и последним максимальным #{diff_max}"
end
p separator

#61
get_task
p rand_arr
# Сортируем массив по возрастанию, выводим последние два элемента.
p rand_arr.sort[-2..-1]
p separator

#62
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.sort[0..1]
p separator

#63
get_task
# Начинаем счётчик подряд идущих элементов с единицы.
count_consecutive = 1
p rand_arr_consecutive = [1, 5, -5, -5, -5, 7, 7, 7, 7, -5, 2, 0]
# Перебираем массив, передавая элемент и индекс.
rand_arr_consecutive.each_with_index do |val, index|
  # Выбираем из элементов минимальные
  if rand_arr_consecutive.min == val
    # Если индексы стоят рядом плюсуем счётчик
    if rand_arr_consecutive[index] == rand_arr_consecutive[index+1]
      count_consecutive += 1
    end
  end
end
p count_consecutive
p separator

#64
get_task
# Аналогичное решение предыдущей задачи.
count_consecutive = 1
p rand_arr_consecutive = [1, 5, -5, -5, -5, 7, 7, 7, 7, -5, 2, 0]
rand_arr_consecutive.each_with_index do |val, el|
  if rand_arr_consecutive.max == val
    if rand_arr_consecutive[el] == rand_arr_consecutive[el+1]
      count_consecutive += 1
    end
  end
end
p count_consecutive
p separator

#65
get_task
p rand_arr
# Перебираем массив на чётные, потом на нечётные.
rand_arr.select { |x| p x if x.even? } + rand_arr.select { |x| p x if x.odd? }
p separator

#66
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
rand_arr.select { |x| p x if x.odd? } + rand_arr.select { |x| p x if x.even? }
p separator

#67
get_task
p rand_arr
#arr_check = [1,8,3,6,1,2]
# Проверяем массив на все true условия методом .all? за исключением первого и последнего элемента
arr_alternate = (1...rand_arr.size-1).all? do |x|
  # Определяем правый и левый элемент относительно текушего.
  left_el = rand_arr[x-1]
  right_el  = rand_arr[x+1]
  # Проверяем условия чередования
  (rand_arr[x].odd? && left_el.even? && right_el.even?) || (rand_arr[x].even? && left_el.odd? && right_el.odd?)
end
p arr_alternate
p separator

#68
get_task
p rand_arr
#arr_check = [1,-8,3,-6,1,-2]
# Аналогичное решение предыдущей задачи.
arr_alternate = (1...rand_arr.size-1).all? do |x|
  left_el = rand_arr[x-1]
  right_el  = rand_arr[x+1]
  (rand_arr[x] > 0 && left_el < 0 && right_el < 0) || (rand_arr[x] < 0 && left_el > 0 && right_el > 0)
end
p arr_alternate
p separator

#69
get_task
p rand_arr_float
p rand_float
# Нужно найти все комбинации элементов из массива и сравнить каждую пару с числом R.
# Для начала используем метод .combination, чтобы получить массив всех возможных комбинаций(по два) исходного массиваю.
p all_combitation = rand_arr_float.combination(2).to_a
# Производим выборку из всех комбинаций массива методом .min_by.
# Находим минимальную разницу между суммой массивов и числом R.
# Сумма чисел этого массива будет наиболее близка к R.
p all_combitation.min_by{|x, y| (x + y - rand_float).abs}
p separator

#70
get_task
# Аналогичное решение предыдущей задачи.
p rand_arr_float
p rand_float
p all_combitation = rand_arr_float.combination(2).to_a
p all_combitation.max_by{|x, y| (x + y - rand_float).abs}
p separator

#71
get_task
p rand_arr
# Выбираем из массива элементы, значения которых встречаются больше одного раза. Удаляем дубликаты.
p rand_arr.select{ |e| rand_arr.count(e) > 1 }.uniq
p separator

#72
get_task
p rand_arr
# Удаляем дубликаты методом .uniq
p rand_arr.uniq
p separator

#73
get_task
p rand_arr
# Аналогичное решение задачи #71
# Метод .reject{ действует по аналогии с .delete, но не изменяем массив.
p rand_arr.reject{ |e| rand_arr.count(e) == 2 }
p separator

#74
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.reject{ |e| rand_arr.count(e) == 3 }
p separator

#75
get_task
p rand_arr
sum = 0
# Перебираем массив. Суммируем элементы по модулю.
rand_arr.each { |e| sum += e.abs }
# Делим сумму всех элементов на колличесво элементов в массиве.
p sum / rand_arr.size
p separator

#76
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
sum = 0
rand_arr.each { |e| sum += e*e }
p sum / rand_arr.size
p separator

#77
get_task
# Методом .digits превращаем цисла в массив и суммируем.
p 5874.digits.sum # или .digits.inject(:+)
p separator

#78
get_task
# Аналогичное решение предыдущей задачи.
p 5874.digits.inject(:*)
p separator

#79
get_task
p rand_arr
# Используем .map, перебираем тернальным оператором. Нулевые элементы не изменятся.
p rand_arr.map{|e| e < 0 ? e * e : e ** 3 }
p separator

#80
get_task
p interval
# Перегоняем интервал в массив, за исключением первого и последнего элемента.
p interval.to_a[1..-2].sort
p interval.to_a[1..-2].size
p separator

#81
get_task
p interval
# Перегоняем интервал в массив, за исключением первого и последнего элемента.
p interval.to_a[1..-2].sort.reverse
p interval.to_a[1..-2].size
p separator

#82
get_task
num_a = 13
num_n = 18
# В интервале от 1 до num_n суммируем все элементы с возрастающим умножением num_a.
p (1..num_n).inject(1){ |sum, i| sum + num_a * i }
p separator

#83
get_task
num_a = 13
num_n = 18
# Аналогичное решение предыдущей задачи.
p (1..num_n).inject(1 - num_a + num_a * 2 - num_a * 3){ |sum, i| sum + ((-1) ** i) * num_a * i }
p separator

#84
get_task
p rand_int
# Аналогичное решение предыдущей задачи.
p (1..rand_int).inject{ |s,i| s * i }
p separator

#85
get_task
p rand_int
# Аналогичное решение предыдущей задачи.
p (1..rand_int).inject{ |s,i| rand_int.odd? ? (s + 2) * i : (s * 2) * i }
p separator

#86
get_task
p rand_arr
sum = 0
# Перебираем массив. Суммируем элементы.
rand_arr.each { |e| sum += e }
# Делим сумму всех элементов на колличесво элементов в массиве.
p sum / rand_arr.size
p separator

#87
get_task
p rand_arr
# Делаем выборку элементов массива.
p rand_arr.select{ |element| element.even?}
p separator

#88
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select{ |element| element.even?}.size
p separator

#89
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select{ |element| element.odd?}
p separator

#90
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select{ |element| element.odd?}.size
p separator

#91
get_task
p rand_arr
p rand_int
# Проверяем массив методом .any?.
p rand_arr.any?{ |element| element < rand_int }
p separator

#92
get_task
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p rand_arr.any?{ |element| element > rand_int }
p separator

#93
get_task
p rand_arr
p rand_int
# Проверяем массив методом .all?.
p rand_arr.all?{ |element| element < rand_int }
p separator

#94
get_task
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p rand_arr.all?{ |element| element > rand_int }
p separator

#95
get_task
p rand_arr
p rand_int
# Перебираем массив на условие. Выводим колличество.
p rand_arr.select{ |element| element < rand_int }.size
p separator

#96
get_task
p rand_arr
p rand_int
# Выводим индекс первого элемента, котроый больше заданного числа.
p rand_arr.index{ |element| element > rand_int }
p separator

#97
get_task
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p rand_arr.rindex{ |element| element < rand_int }
p separator

#98
get_task
p rand_arr
# Сравниваем элементы(кроме первого) по условию. Выводим индексы.
p indexes_98 = (1...rand_arr.size).select{ |element| rand_arr[element] < rand_arr[element - 1] }
p indexes_98.size
p separator

#99
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p indexes_98 = (0...rand_arr.size-1).select{ |element| rand_arr[element] < rand_arr[element + 1] }
p indexes_98.size
p separator

#100
get_task
p rand_arr
# Аналогичное решение предыдущей задачи.
p indexes_98 = (0...rand_arr.size-1).select{ |element| rand_arr[element] > rand_arr[element + 1] }
p indexes_98.size
p separator