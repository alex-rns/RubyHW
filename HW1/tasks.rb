#----------------------------Variables----------------------------#
# Define random array
rand_arr = Array.new(12) { rand(-5..15) }
# Define random array with float elements
rand_arr_float = Array.new(6) { rand(0..10.0).ceil(3) }
#Define random float
rand_float = rand(0..10.0).ceil(3)
#-----------------------------------------------------------------#

# Function of outputting tasks from file
@task_count = 1
def get_task
  if File.exists?("ruby_tasks")
    task_array = IO.readlines("ruby_tasks")
    p @task_count.to_s + ". " + task_array[@task_count].strip
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
p "--------------------------------------------------------------------------------------------------------------------"
#2
get_task
p rand_arr
rand_arr.each_with_index{ |value, index| p value if index.odd? } + rand_arr.each_with_index{ |value, index| p value if index.even? }
p "--------------------------------------------------------------------------------------------------------------------"
#3
get_task
p rand_arr
p rand_arr.index{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
#4
get_task
p rand_arr
p rand_arr.rindex{|element| element if rand_arr[0] < element && element < rand_arr[-1]} || []
p "--------------------------------------------------------------------------------------------------------------------"
#5
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
#6
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.even? ? e + rand_arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
#7
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[-1]: e}
p "--------------------------------------------------------------------------------------------------------------------"
#8
get_task
p rand_arr
p rand_arr.map { |e| e != rand_arr[0] && e != rand_arr[-1] && e.odd? ? e + rand_arr[0]: e}
p "--------------------------------------------------------------------------------------------------------------------"
#9
get_task
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
#10
get_task
p rand_arr
p rand_arr.map {|e| e > 0 ? rand_arr.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
#11
get_task
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.min : e }
p "--------------------------------------------------------------------------------------------------------------------"
#12
get_task
p rand_arr
p rand_arr.map {|e| e < 0 ? rand_arr.max : e }
p "--------------------------------------------------------------------------------------------------------------------"
#13
get_task
p rand_arr
p rand_arr.rotate
p "--------------------------------------------------------------------------------------------------------------------"
#14
get_task
p rand_arr
p rand_arr.rotate(-1)
p "--------------------------------------------------------------------------------------------------------------------"
#15
get_task
p "--------------------------------------------------------------------------------------------------------------------"
#16
get_task
p "--------------------------------------------------------------------------------------------------------------------"
#17
get_task
p rand_arr
count_max = 0
rand_arr.each_cons(3) {|a, b, c| count_max +=1 if a < b && b > c }
p count_max
p "--------------------------------------------------------------------------------------------------------------------"
#18
get_task
p rand_arr
count_min = 0
rand_arr.each_cons(3) {|a, b, c| count_min +=1 if a > b && b < c }
p count_min
p "--------------------------------------------------------------------------------------------------------------------"
#19
get_task
p "--------------------------------------------------------------------------------------------------------------------"
#20
get_task
p "--------------------------------------------------------------------------------------------------------------------"
#21
get_task
p rand_arr
count_mono_up = 0
rand_arr.each_cons(2) { |i,j| count_mono_up +=1 if i < j }
p count_mono_up
p "--------------------------------------------------------------------------------------------------------------------"
#22
get_task
p rand_arr
count_mono_down = 0
rand_arr.each_cons(2) { |i,j| count_mono_down +=1 if i > j }
p count_mono_down
p "--------------------------------------------------------------------------------------------------------------------"
#23
get_task
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.min}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.min)]}"
p "--------------------------------------------------------------------------------------------------------------------"
#24
get_task
p "R = #{rand_float}"
p rand_arr_float
diff = rand_arr_float.map{|element| (rand_float - element).abs}
p "Наименьшая разница: #{diff.max}. Элемент массива, соответствующий этой разнице: #{rand_arr_float[diff.index(diff.max)]}"
p "--------------------------------------------------------------------------------------------------------------------"
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
p "--------------------------------------------------------------------------------------------------------------------"
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
p "--------------------------------------------------------------------------------------------------------------------"
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
p "--------------------------------------------------------------------------------------------------------------------"
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
p "--------------------------------------------------------------------------------------------------------------------"
#29
get_task
p rand_arr
p rand_arr.sort
p "--------------------------------------------------------------------------------------------------------------------"
#30
get_task
p rand_arr
p rand_arr.sort {|x, y| y <=> x }
p "или"
p rand_arr.sort.reverse
p "--------------------------------------------------------------------------------------------------------------------"
#31
get_task
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }.reverse
p "--------------------------------------------------------------------------------------------------------------------"
#32
get_task
p rand_arr
p (0...rand_arr.size).sort_by{ |i| rand_arr[i] }
p "--------------------------------------------------------------------------------------------------------------------"
#33
get_task
p rand_arr
p rand_arr.index(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
#34
get_task
p rand_arr
p rand_arr.index(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
#35
get_task
p rand_arr
p rand_arr.index(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
#36
get_task
p rand_arr
p rand_arr.index(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
#37
get_task
p rand_arr
p rand_arr.rindex(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
#38
get_task
p rand_arr
p rand_arr.rindex(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
#39
get_task
p rand_arr
p rand_arr.count(rand_arr.min)
p "--------------------------------------------------------------------------------------------------------------------"
#40
get_task
p rand_arr
p rand_arr.count(rand_arr.max)
p "--------------------------------------------------------------------------------------------------------------------"
#41
get_task
p rand_arr
p rand_arr.select{ |i| i if i.even? }.min
p "--------------------------------------------------------------------------------------------------------------------"
#42
get_task
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.min
p "--------------------------------------------------------------------------------------------------------------------"
#43
get_task
p rand_arr
p rand_arr.select{ |i| i if i.even? }.max
p "--------------------------------------------------------------------------------------------------------------------"
#44
get_task
p rand_arr
p rand_arr.select{ |i| i if i.odd? }.max
p "--------------------------------------------------------------------------------------------------------------------"
#45
get_task
p rand_arr
p rand_arr.select{ |i| i if i > 0 }.min
p "--------------------------------------------------------------------------------------------------------------------"
#46
get_task
p rand_arr
p rand_arr.select{ |i| i if i < 0 }.max
p "--------------------------------------------------------------------------------------------------------------------"
#47
get_task
