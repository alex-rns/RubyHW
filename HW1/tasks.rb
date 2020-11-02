#----------------------------Variables----------------------------#
# Define random array
rand_arr = Array.new(12) { rand(-5..15) }
# Define random array with float elements
rand_arr_float = Array.new(6) { rand(0..10.0).ceil(3) }
#Define random float
rand_float = rand(0..10.0).ceil(3)
# Define random interval
interval = rand(1...5)..rand(5..10)
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
rand_arr.each_with_index{ |value, index| p value if index.even? } + rand_arr.each_with_index{ |value, index| p value if index.odd? }
p separator

#2
get_task
p rand_arr
rand_arr.each_with_index{ |value, index| p value if index.odd? } + rand_arr.each_with_index{ |value, index| p value if index.even? }
p separator

#3
get_task
p rand_arr
p rand_arr.index{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p separator

#4
get_task
p rand_arr
p rand_arr.rindex{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p separator

#5
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[0]: e}
p separator

#6
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[-1]: e}
p separator

#7
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[-1]: e}
p separator

#8
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[0]: e}
p separator

#9
get_task
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.min : e }
p separator

#10
get_task
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.max : e }
p separator

#11
get_task
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.min : e }
p separator

#12
get_task
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.max : e }
p separator

#13
get_task
p rand_arr
p rand_arr.rotate
p separator

#14
get_task
p rand_arr
p rand_arr.rotate(-1)
p separator

#15
get_task
p separator

#16
get_task
p separator

#17
get_task
p rand_arr
count_max = 0
rand_arr.each_cons(3) {|a, b, c| count_max +=1 if a < b && b > c }
p count_max
p separator

#18
get_task
p rand_arr
count_min = 0
rand_arr.each_cons(3) {|a, b, c| count_min +=1 if a > b && b < c }
p count_min
p separator

#19
get_task
p separator

#20
get_task
p separator

#21
get_task
p rand_arr
count_mono_up = 0
rand_arr.each_cons(2) { |i,j| count_mono_up +=1 if i < j }
p count_mono_up
p separator

#22
get_task
p rand_arr
count_mono_down = 0
rand_arr.each_cons(2) { |i,j| count_mono_down +=1 if i > j }
p count_mono_down
p separator

#23
get_task
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.min}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.min)]}"
p separator

#24
get_task
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.max}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.max)]}"
p separator

#25
get_task
p rand_arr
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  if value > 0
    rand_arr_modify  << rand_arr[0]
  end
  rand_arr_modify  << rand_arr[index]
end
p rand_arr_modify
p separator

#26
get_task
p rand_arr
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
rand_arr_modify = []
rand_arr.each_with_index do |value, index|
  rand_arr_modify  << rand_arr[index]
  if value > 0
    rand_arr_modify  <<  rand_arr[0]
  end
end
p rand_arr_modify
p separator

#28
get_task
p rand_arr
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
p rand_arr.sort
p separator

#30
get_task
p rand_arr
p rand_arr.sort {|x, y| y <=> x }
p "или"
p rand_arr.sort.reverse
p separator

#31
get_task
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }.reverse
p separator

#32
get_task
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }
p separator

#33
get_task
p rand_arr
p rand_arr.index(rand_arr.min)
p separator

#34
get_task
p rand_arr
p rand_arr.index(rand_arr.max)
p separator

#35
get_task
p rand_arr
p rand_arr.index(rand_arr.min)
p separator

#36
get_task
p rand_arr
p rand_arr.index(rand_arr.max)
p separator

#37
get_task
p rand_arr
p rand_arr.rindex(rand_arr.min)
p separator

#38
get_task
p rand_arr
p rand_arr.rindex(rand_arr.max)
p separator

#39
get_task
p rand_arr
p rand_arr.count(rand_arr.min)
p separator

#40
get_task
p rand_arr
p rand_arr.count(rand_arr.max)
p separator

#41
get_task
p rand_arr
p rand_arr.select{ |i| i if i.even? }.min
p separator

#42
get_task
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.min
p separator

#43
get_task
p rand_arr
p rand_arr.select{ |i| i if i.even? }.max
p separator

#44
get_task
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.max
p separator

#45
get_task
p rand_arr
p rand_arr.select{ |i| i if i > 0 }.min
p separator

#46
get_task
p rand_arr
p rand_arr.select{ |i| i if i < 0 }.max
p separator

#47
get_task
p rand_arr, interval
p rand_arr.select { |index| interval === index }.min
p separator

#48
get_task
p rand_arr, interval
p rand_arr.select { |index| interval === index }.max
p separator

#49
get_task
p rand_arr
p rand_arr.index(rand_arr.min)
p separator

#50
get_task
p rand_arr
p rand_arr.index(rand_arr.max)
p separator

#51
get_task
p rand_arr
p rand_arr.size-1 - rand_arr.index(rand_arr.max)
p separator

#52
get_task
p rand_arr
p rand_arr.size-1 - rand_arr.index(rand_arr.min)
p separator

#53
get_task
p rand_arr
p rand_arr.rindex(rand_arr.max)
p separator

#54
get_task
p rand_arr
p rand_arr.rindex(rand_arr.min)
p separator

#55
get_task
p rand_arr
p rand_arr.size-1 - rand_arr.rindex(rand_arr.max)
p separator

#56
get_task
p rand_arr
p rand_arr.size-1 - rand_arr.rindex(rand_arr.min)
p separator

#57
get_task
p rand_arr
mini_idx = rand_arr.index(rand_arr.min)
maxi_idx = rand_arr.index(rand_arr.max)
p "Индекс первого минимального элемента: #{mini_idx}"
p "Индекс первого максимаотного элемента: #{maxi_idx}"
extrem_idx = mini_idx < maxi_idx ? mini_idx : maxi_idx
p "Индекс первого из них (экстремального элемента): #{extrem_idx}"
p separator

#58
get_task
p rand_arr
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
p rand_arr.rindex(rand_arr.min) - 1
p separator

#60
get_task
p rand_arr
p rand_arr.rindex(rand_arr.max) - 1
p separator

#61
get_task
p rand_arr
p rand_arr.sort[-2..-1]
p separator

#62
get_task
p rand_arr
p rand_arr.sort[0..1]
p separator

#63
get_task
# p rand_arr
count_consecutive = 1
p rand_arr_consecutive = [1, 5, -5, -5, -5, 7, 7, 7, 7, -5, 2, 0]
rand_arr_consecutive.each_with_index do |val, el|
  if rand_arr_consecutive.min == val
    if rand_arr_consecutive[el] == rand_arr_consecutive[el+1]
      count_consecutive += 1
    end
  end
end
p count_consecutive
p separator

#64
get_task
# p rand_arr
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
rand_arr.select { |x| p x if x.even? } + rand_arr.select { |x| p x if x.odd? }
p separator

#66
get_task
p rand_arr
rand_arr.select { |x| p x if x.odd? } + rand_arr.select { |x| p x if x.even? }
p separator

#67
get_task
p rand_arr
#arr_check = [1,8,3,6,1,2]
arr_alternate = (1...rand_arr.size-1).all? do |x|
  left_el = rand_arr[x-1]
  right_el  = rand_arr[x+1]
  (rand_arr[x].odd? && left_el.even? && right_el.even?) || (rand_arr[x].even? && left_el.odd? && right_el.odd?)
end
p arr_alternate
p separator

#68
get_task
p rand_arr
#arr_check = [1,-8,3,-6,1,-2]
arr_alternate = (1...rand_arr.size-1).all? do |x|
  left_el = rand_arr[x-1]
  right_el  = rand_arr[x+1]
  (rand_arr[x] > 0 && left_el < 0 && right_el < 0) || (rand_arr[x] < 0 && left_el > 0 && right_el > 0)
end
p arr_alternate
p separator

#69
get_task
# p rand_arr_float
# p rand_float

p separator

#70
get_task
# p rand_arr_float
# p rand_float

p separator

#71
get_task
p rand_arr
p rand_arr.select{ |e| rand_arr.count(e) > 1 }.uniq
p separator

#72
get_task
p rand_arr
p rand_arr.uniq
p separator

#73
get_task
p rand_arr
p rand_arr.reject{ |e| rand_arr.count(e) == 2 }
p separator

#74
get_task
p rand_arr
p rand_arr.reject{ |e| rand_arr.count(e) == 3 }
p separator

#75
get_task
p rand_arr
sum = 0
rand_arr.each { |e| sum = e.abs + sum }
p sum / rand_arr.size
p separator

#76
get_task
p rand_arr
sum = 0
rand_arr.each { |e| sum = e*e + sum }
p sum / rand_arr.size
p separator

#77
get_task
p separator