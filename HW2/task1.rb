# frozen_string_literal: true

p array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36,
           202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
separator = '----------------------------------------------------------------------------------------------------------'

p 'узнать количество элементов в массиве'
p array.size
p separator
p 'перевернуть массив'
p array.reverse
p separator
p 'найти наибольшее число'
p array.max
p separator
p 'найти наименьшее число'
p array.min
p separator
p 'отсортировать от меньшего к большему'
p array.sort
p separator
p 'отсортировать от большего к меньшему'
p array.sort.reverse
p separator
p 'удалить все нечетные числа'
p array.reject(&:odd?)
p separator
p 'оставить только те числа, которые без остатка делятся на 3'
p(array.find_all { |e| (e % 3).zero? })
p separator
p 'удалить из массива числа, которые повторяются (то есть, нужно вывести массив, в котором нет повторов)'
p array.uniq
p separator
p 'разделить каждый элемент на 10, в результате элементы не должны быть округлены до целого'
p(array.map { |e| e.to_f / 10 })
p separator
p 'получить новый массив, который бы содержал в себе те буквы английского алфавита, порядковый номер которых есть
 в нашем массиве'
('a'..'z').each_with_index { |char, ind| p char if array.each.include?(ind) }
p separator
p 'поменять местами минимальный и максимальный элементы массива'
index_min = array.index(array.min)
index_max = array.index(array.max)
array[index_min], array[index_max] = array.max, array.min
p array
p separator
p 'найти элементы, которые находятся перед минимальным числом в массиве'
p array[0...(array.index array.min)]
p separator
p 'необходимо найти три наименьших элемента'
p array.sort[0..2]
p separator
