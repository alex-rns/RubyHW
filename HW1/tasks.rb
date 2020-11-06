# frozen_string_literal: true

#----------------------------Variables----------------------------#
# Define random array
rand_arr = Array.new(12) { rand(-5..15) }
# Define random array with float elements
rand_arr_float = Array.new(6) { rand(0..10.0).ceil(3) }
# Define random float
rand_float = rand(0..10.0).ceil(3)
# Define random interval
interval = rand(1...5)..rand(5..10)
# Define random integer
rand_int = rand(1...15)
#-----------------------------------------------------------------#
separator = '----------------------------------------------------------------------------------------------------------'

# Function of outputting tasks from file
@task_count = 0
def gettask
  if File.exist?('ruby_tasks')
    task_array = IO.readlines('ruby_tasks')
    p "#{@task_count + 1}. #{task_array[@task_count].strip}"
    @task_count += 1
  else
    p "Not found file 'ruby_tasks'"
  end
end
#-----------------------------------------------------------------#

# 1
gettask
p rand_arr
# Исползуем метод .partition, который выводит сначала массив элементов, результат обработки блока для которых true,
# а потом массив всех остальных. После переводим массивы в строку с разделителем.
p rand_arr.partition.with_index { |_, i| i.even? } * ', '
p separator
# 2
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.partition.with_index { |_, i| i.odd? } * ', '
p separator

# 3
gettask
p rand_arr
# Проверяем элемент на два условия. Выводим или индекс первого попавшегося элемента или "[]".
p rand_arr.index { |e| e if rand_arr[0] < e && e < rand_arr[-1] } || []
p separator

# 4
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
# Для вывода последнего найденного индекса используем метод .rindex.
p rand_arr.rindex { |e| e if rand_arr[0] < e && e < rand_arr[-1] } || []
p separator

# 5
gettask
p rand_arr
# Перебираем массив методом .map. Проверяем на условия rand_arr[0], rand_arr[-1], e.even?
# Если элемент массива не совпадает с этими условиями, добавляем к нему первый элемент (e + rand_arr[0]).
# Если одно из условий совпадает, оставляеи элемент в массиве, без изменений.
p(rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[0] : e })
p separator

# 6
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[-1] : e })
p separator

# 7
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[-1] : e })
p separator

# 8
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[0] : e })
p separator

# 9
gettask
p rand_arr
# Перебираем массив, если элемент положительный, меняем его на минимальный (rand_arr.min).
p(rand_arr.map { |e| e.positive? ? rand_arr.min : e })
p separator

# 10
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e.positive? ? rand_arr.max : e })
p separator

# 11
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e.negative? ? rand_arr.min : e })
p separator

# 12
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.map { |e| e.negative? ? rand_arr.max : e })
p separator

# 13
gettask
p rand_arr
# Для сдвига элементов используем метод .rotate.
p rand_arr.rotate
p separator

# 14
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.rotate(-1)
p separator

# 15
gettask
p rand_arr #= [-1, 3, 7, 11, 15, 19, 23]
# Перебираенм массив выборкой по два элемента. Сравниваем разность этих элементов и помещаем в новый массив.
# Методом .uniq избавляемся от повторяющейся разности прогрессии.
diff = rand_arr.each_cons(2).map { |el| el[1] - el[0] }.uniq
# Проверяем, если элемент в массиве остался один, значит все элементы образуют арифметическую прогрессию.
# Выводим этот элемент, он и будет разницей прогресии.
p diff.size > 1 ? nil : diff[0]
p separator

# 16
gettask
p rand_arr #= [2, 4, 8, 16, 32, 64]
# Аналогичное решение предыдущей задачи.
if rand_arr.include?(0)
  p "Массив содержит элемент со значением '0'. Проверка невозможна."
else
  diff = rand_arr.each_cons(2).map { |el| el[1] / el[0] }.uniq
  p diff.size > 1 ? nil : diff[0]
end
p separator

# 17
gettask
p rand_arr
# Используем метод .each_cons(). Перебираем массив по три элемента,
# если средний элемент больше соседних, плюсюем счётчик.
count_max = 0
rand_arr.each_cons(3) { |a, b, c| count_max += 1 if a < b && b > c }
p count_max
p separator

# 18
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
count_min = 0
rand_arr.each_cons(3) { |a, b, c| count_min += 1 if a > b && b < c }
p count_min
p separator

# 19
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
# Каждый максимум добавляем в новый массив, из которого выводим максимальный элемент.
maxi = []
rand_arr.each_cons(3) { |a, b, c| maxi << b if a < b && b > c }
p maxi.max
p separator

# 20
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
mini = []
rand_arr.each_cons(3) { |a, b, c| mini << b if a > b && b < c }
p mini.min
p separator

# 21
gettask
p rand_arr
# Если считать, что монотонное возрастание - это увеличение значения по сравнению с предыдущим элеметом:
# Сравниваем поочерёдно два элемента, если правый больше, плюсуем счётчик.
count_mono_up = 0
rand_arr.each_cons(2) { |i, j| count_mono_up += 1 if i < j }
p count_mono_up
p separator

# 22
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
count_mono_down = 0
rand_arr.each_cons(2) { |i, j| count_mono_down += 1 if i > j }
p count_mono_down
p separator

# 23
gettask
p "R = #{rand_float}"
p rand_arr_float
# Преобразуем в новый массив, где элементы - это разница по модулю между данным числом и каждым элементом исходного массива.
diff = rand_arr_float.map { |e| (rand_float - e).abs }
# Находим минимальный элемент из нового массива и выводим его индекс по отношению к исходному массиву.
p "Наименьшая разница: #{diff.min}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.min)]}"
p separator

# 24
gettask
p "R = #{rand_float}"
p rand_arr_float
# Аналогичное решение предыдущей задачи.
diff = rand_arr_float.map { |e| (rand_float - e).abs }
p "Наименьшая разница: #{diff.max}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.max)]}"
p separator

# 25
gettask
p rand_arr
rand_arr_modify = []
# Перебираем массив методом .each_with_index.
rand_arr.each_with_index do |v, i|
  # Если элемент массива больше нуля - пушим в новый массив первый элемент исходного массива.
  rand_arr_modify << rand_arr[0] if v.positive?
  # Пушим в новый массив каждый элемент исходного массива.
  rand_arr_modify << rand_arr[i]
end
p rand_arr_modify
p separator

# 26
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |v, i|
  rand_arr_modify << rand_arr[0] if v.negative?
  rand_arr_modify  << rand_arr[i]
end
p rand_arr_modify
p separator

# 27
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |v, i|
  # Сначала пушим в новый массив
  rand_arr_modify  << rand_arr[i]
  # Потом перебираем по условию и добавляем нулевой элемент.
  rand_arr_modify << rand_arr[0] if v.positive?
end
p rand_arr_modify
p separator

# 28
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
rand_arr_modify = []
rand_arr.each_with_index do |v, i|
  rand_arr_modify << rand_arr[i]
  rand_arr_modify << rand_arr[0] if v.negative?
end
p rand_arr_modify
p separator

# 29
gettask
p rand_arr
# Используем метод .sort
p rand_arr.sort
p separator

# 30
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.sort { |x, y| y <=> x })
p 'или'
p rand_arr.sort.reverse
p separator

# 31
gettask
p rand_arr
# Сортируем массив по индексу, сопоставляя индексам значения элементов. Переворачиваем массив.
p (0...rand_arr.size).sort_by { |i| rand_arr[i] }.reverse
p separator

# 32
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p (0...rand_arr.size).sort_by { |i| rand_arr[i] }
p separator

# 33
gettask
p rand_arr
# Находим минимальный элемент массива и выводим его индекс.
p rand_arr.index(rand_arr.min)
p separator

# 34
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

# 35
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.min)
p separator

# 36
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

# 37
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.min)
p separator

# 38
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.max)
p separator

# 39
gettask
p rand_arr
# Методом .count считаем найденные минимальные элементы.
p rand_arr.count(rand_arr.min)
p separator

# 40
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.count(rand_arr.max)
p separator

# 41
gettask
p rand_arr
# Методом .select выбираем чётные элементы. Выводим минимальный из них.
p rand_arr.select { |i| i if i.even? }.min
p separator

# 42
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |i| i if i.odd? }.min
p separator

# 43
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |i| i if i.even? }.max
p separator

# 44
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |i| i if i.odd? }.max
p separator

# 45
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |i| i if i.positive? }.min
p separator

# 46
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |i| i if i.negative? }.max
p separator

# 47
gettask
p rand_arr, interval
# Методом .select выбираем все значения массива, который есть в пределах интервала. Выводим минимальный элемент.
p rand_arr.select { |index| interval.include?(index) }.min
p separator
# 48
gettask
p rand_arr, interval
# Аналогичное решение предыдущей задачи.
p rand_arr.select { |index| interval.include?(index) }.max
p separator

# 49
gettask
p rand_arr
# Находим минимальный элемент. Его индекс соответствует числу колличетва элементов до него.
p rand_arr.index(rand_arr.min)
p separator

# 50
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.index(rand_arr.max)
p separator

# 51
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.size - 1 - rand_arr.index(rand_arr.max)
p separator

# 52
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.size - 1 - rand_arr.index(rand_arr.min)
p separator

# 53
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.max)
p separator

# 54
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.rindex(rand_arr.min)
p separator

# 55
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.size - 1 - rand_arr.rindex(rand_arr.max)
p separator

# 56
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.size - 1 - rand_arr.rindex(rand_arr.min)
p separator

# 57
gettask
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

# 58
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
mini_idx = rand_arr.index(rand_arr.min)
maxi_idx = rand_arr.index(rand_arr.max)
p "Индекс первого минимального элемента: #{mini_idx}"
p "Индекс первого максимаотного элемента: #{maxi_idx}"
extrem_idx = mini_idx > maxi_idx ? mini_idx : maxi_idx
p "Индекс последнего из них (экстремального элемента): #{extrem_idx}"
p separator

# 59
gettask
p rand_arr
# Находим разницу индексов между первым и последним минимальным.
diff_min = rand_arr.rindex(rand_arr.min) - rand_arr.index(rand_arr.min)
# Разница будет = 0, если минимальный элемент один.
if diff_min.zero?
  p 'Минимальный элемент только один'
else
  # Если элементов два и больше, отнимаем единицу и выводим результат.
  diff_min -= 1
  p "Колличество элементов между первым и последним минимальным #{diff_min}"
end
p separator

# 60
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
diff_max = rand_arr.rindex(rand_arr.max) - rand_arr.index(rand_arr.max)
if diff_max.zero?
  p 'Максимальный элемент только один'
else
  diff_max -= 1
  p "Колличество элементов между первым и последним максимальным #{diff_max}"
end
p separator

# 61
gettask
p rand_arr
# Сортируем массив по возрастанию, выводим последние два элемента.
p rand_arr.sort[-2..-1]
p separator

# 62
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.sort[0..1]
p separator

# 63
gettask
# Начинаем счётчик подряд идущих элементов с единицы.
count_consecutive = 1
p rand_arr_consecutive = [1, 5, -5, -5, -5, 7, 7, 7, 7, -5, 2, 0]
# Перебираем массив, передавая элемент и индекс.
rand_arr_consecutive.each_with_index do |v, i|
  # Выбираем из элементов минимальные
  next unless rand_arr_consecutive.min == v

  # Если индексы стоят рядом плюсуем счётчик
  count_consecutive += 1 if rand_arr_consecutive[i] == rand_arr_consecutive[i + 1]
end
p count_consecutive
p separator

# 64
gettask
# Аналогичное решение предыдущей задачи.
count_consecutive = 1
p rand_arr_consecutive = [1, 5, -5, -5, -5, 7, 7, 7, 7, -5, 2, 0]
rand_arr_consecutive.each_with_index do |v, e|
  next unless rand_arr_consecutive.max == v

  count_consecutive += 1 if rand_arr_consecutive[e] == rand_arr_consecutive[e + 1]
end
p count_consecutive
p separator

# 65
gettask
p rand_arr
# Перебираем массив на чётные, потом на нечётные.
p "#{rand_arr.select(&:even?) * ', '}, #{rand_arr.select(&:odd?) * ', '}"
p separator

# 66
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p "#{rand_arr.select(&:odd?) * ', '}, #{rand_arr.select(&:even?) * ', '}"
p separator

# 67
gettask
p rand_arr
# arr_check = [1,8,3,6,1,2]
# Проверяем массив на все true условия методом .all? за исключением первого и последнего элемента
arr_alternate = (1...rand_arr.size - 1).all? do |x|
  # Определяем правый и левый элемент относительно текушего.
  left_el = rand_arr[x - 1]
  right_el  = rand_arr[x + 1]
  # Проверяем условия чередования
  (rand_arr[x].odd? && left_el.even? && right_el.even?) || (rand_arr[x].even? && left_el.odd? && right_el.odd?)
end
p arr_alternate
p separator

# 68
gettask
p rand_arr
# arr_check = [1,-8,3,-6,1,-2]
# Аналогичное решение предыдущей задачи.
arr_alternate = (1...rand_arr.size - 1).all? do |x|
  left_el = rand_arr[x - 1]
  right_el  = rand_arr[x + 1]
  ((rand_arr[x]).positive? && left_el.negative? && right_el.negative?) || ((rand_arr[x]).negative? && left_el.positive? && right_el.positive?)
end
p arr_alternate
p separator

# 69
gettask
p rand_arr_float
p rand_float
# Нужно найти все комбинации элементов из массива и сравнить каждую пару с числом R.
# Для начала используем метод .combination, чтобы получить массив всех возможных комбинаций(по два) исходного массиваю.
p all_combitation = rand_arr_float.combination(2).to_a
# Производим выборку из всех комбинаций массива методом .min_by.
# Находим минимальную разницу между суммой массивов и числом R.
# Сумма чисел этого массива будет наиболее близка к R.
p(all_combitation.min_by { |x, y| (x + y - rand_float).abs })
p separator

# 70
gettask
# Аналогичное решение предыдущей задачи.
p rand_arr_float
p rand_float
p all_combitation = rand_arr_float.combination(2).to_a
p(all_combitation.max_by { |x, y| (x + y - rand_float).abs })
p separator

# 71
gettask
p rand_arr
# Выбираем из массива элементы, значения которых встречаются больше одного раза. Удаляем дубликаты.
p rand_arr.select { |e| rand_arr.count(e) > 1 }.uniq
p separator

# 72
gettask
p rand_arr
# Удаляем дубликаты методом .uniq
p rand_arr.uniq
p separator

# 73
gettask
p rand_arr
# Аналогичное решение задачи #71
# Метод .reject{ действует по аналогии с .delete, но не изменяем массив.
p(rand_arr.reject { |e| rand_arr.count(e) == 2 })
p separator

# 74
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p(rand_arr.reject { |e| rand_arr.count(e) == 3 })
p separator

# 75
gettask
p rand_arr
sum_75 = 0
# Перебираем массив. Суммируем элементы по модулю.
rand_arr.each { |e| sum_75 += e.abs }
# Делим сумму всех элементов на колличесво элементов в массиве.
p sum_75 / rand_arr.size
p separator

# 76
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
sum_76 = 0
rand_arr.each { |e| sum_76 += e**2 }
p sum_76 / rand_arr.size
p separator

# 77
gettask
# Методом .digits превращаем цисла в массив и суммируем.
p 5874.digits.sum # или .digits.inject(:+)
p separator

# 78
gettask
# Аналогичное решение предыдущей задачи.
p 5874.digits.inject(:*)
p separator

# 79
gettask
p rand_arr
# Используем .map, перебираем тернальным оператором. Нулевые элементы не изменятся.
p(rand_arr.map { |e| e.negative? ? e**2 : e**3 })
p separator

# 80
gettask
p interval
# Перегоняем интервал в массив, за исключением первого и последнего элемента.
p interval.to_a[1..-2].sort
p interval.to_a[1..-2].size
p separator

# 81
gettask
p interval
# Перегоняем интервал в массив, за исключением первого и последнего элемента.
p interval.to_a[1..-2].sort.reverse
p interval.to_a[1..-2].size
p separator

# 82
gettask
num_a = 13
num_n = 18
# В интервале от 1 до num_n суммируем все элементы с возрастающим умножением num_a.
p (1..num_n).inject(1) { |sum, i| sum + num_a * i }
p separator

# 83
gettask
num_a = 13
num_n = 18
# Аналогичное решение предыдущей задачи.
p (1..num_n).inject(1 - num_a + num_a * 2 - num_a * 3) { |sum, i| sum + ((-1)**i) * num_a * i }
p separator

# 84
gettask
p rand_int
# Аналогичное решение предыдущей задачи.
p (1..rand_int).inject { |s, i| s * i }
p separator

# 85
gettask
p rand_int
# Аналогичное решение предыдущей задачи.
p (1..rand_int).inject { |s, i| rand_int.odd? ? (s + 2) * i : (s * 2) * i }
p separator

# 86
gettask
p rand_arr
sum_86 = 0
# Перебираем массив. Суммируем элементы.
rand_arr.each { |e| sum_86 += e }
# Делим сумму всех элементов на колличесво элементов в массиве.
p sum_86 / rand_arr.size
p separator

# 87
gettask
p rand_arr
# Делаем выборку элементов массива.
p rand_arr.select(&:even?)
p separator

# 88
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select(&:even?).size
p separator

# 89
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select(&:odd?)
p separator

# 90
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p rand_arr.select(&:odd?).size
p separator

# 91
gettask
p rand_arr
p rand_int
# Проверяем массив методом .any?.
p(rand_arr.any? { |e| e < rand_int })
p separator

# 92
gettask
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p(rand_arr.any? { |e| e > rand_int })
p separator

# 93
gettask
p rand_arr
p rand_int
# Проверяем массив методом .all?.
p(rand_arr.all? { |e| e < rand_int })
p separator

# 94
gettask
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p(rand_arr.all? { |e| e > rand_int })
p separator

# 95
gettask
p rand_arr
p rand_int
# Перебираем массив на условие. Выводим колличество.
p(rand_arr.select { |e| e < rand_int }.size)
p separator

# 96
gettask
p rand_arr
p rand_int
# Выводим индекс первого элемента, котроый больше заданного числа.
p(rand_arr.index { |e| e > rand_int })
p separator

# 97
gettask
p rand_arr
p rand_int
# Аналогичное решение предыдущей задачи.
p(rand_arr.rindex { |e| e < rand_int })
p separator

# 98
gettask
p rand_arr
# Сравниваем элементы(кроме первого) по условию. Выводим индексы.
p indexes_98 = (1...rand_arr.size).select { |e| rand_arr[e] < rand_arr[e - 1] }
p indexes_98.size
p separator

# 99
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p indexes_99 = (0...rand_arr.size - 1).select { |e| rand_arr[e] < rand_arr[e + 1] }
p indexes_99.size
p separator

# 100
gettask
p rand_arr
# Аналогичное решение предыдущей задачи.
p indexes_98 = (0...rand_arr.size - 1).select { |e| rand_arr[e] > rand_arr[e + 1] }
p indexes_98.size
p separator
