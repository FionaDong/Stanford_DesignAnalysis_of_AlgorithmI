require 'pry'
#Selection Sort 
def selection_sort(array_b4)
  sorted_list = []
  unsorted_list = array_b4
  
  until unsorted_list.empty?
    minimal = min(unsorted_list)
    num = unsorted_list.each_index.select do |index| 
      unsorted_list[index] == minimal 
    end
    num.size.times do
      sorted_list << minimal
    end
    unsorted_list.delete(minimal)
  end
  return sorted_list
end

def min arr
  min = arr[0]
  i = 1
  while i < arr.length
    min = arr[i] if arr[i] <= min
    i += 1
  end
  return min
end

array_b4 = [1,2,4,2,6,3,8,0]
puts "Selection Sort" + array_b4.inspect
puts selection_sort(array_b4).inspect

#Insertion Sort
def insertion_sort(array_b4)
  sorted_list = []
  unsorted_list = array_b4
  sorted_list << unsorted_list.pop
  until unsorted_list.empty? 
    temp = unsorted_list.pop
    insert(sorted_list, temp)
  end
  return sorted_list
end


def insert arr, elem
  j = arr.size
  arr[j] = elem
  # binding.pry
  while j > 0
    # binding.pry
    if arr[j - 1] > arr[j]
      temp = arr[j - 1] 
      arr[j - 1] = arr[j]
      arr[j] = temp
    end
      j -= 1
  end
  return arr
end

array_b4 = [1,2,4,2,6,3,8,0]
puts "Insertion Sort" + array_b4.inspect
puts insertion_sort(array_b4).inspect

#Bubble Sort
def bubble_sort(array_b4)
  i = 0
  while i < array_b4.size - 1
    j = 0
    while j < array_b4.size - 1 - i
      if array_b4[j] > array_b4[j + 1]
        temp = array_b4[j + 1] 
        array_b4[j + 1] = array_b4[j]
        array_b4[j] = temp
      end
      j += 1
    end
    i += 1
  end
  return array_b4
end
array_b4 = [1,2,4,2,6,3,8,0]
puts "Bubble Sort" + array_b4.inspect
puts bubble_sort(array_b4).inspect

#Merge Sort
def merge_sort(array_b4)
  return array_b4 if array_b4.size == 1
  n = array_b4.size / 2
  first_array = array_b4.take(n)
  last_array = array_b4.drop(n)
  # binding.pry
  return merge(merge_sort(first_array),merge_sort(last_array))
end

def merge(first_array, last_array)
  k = 0
  i = 0
  j = 0
  result_array = []
  while k < first_array.size + last_array.size
    # binding.pry
    if first_array[i] <= last_array[j]  
      result_array[k] = first_array[i]
      if(i + 1) < first_array.size
        i += 1 
      else
        result_array.concat(last_array.drop(j))
        break
      end
    elsif first_array[i] > last_array[j]
      result_array[k] = last_array[j]
      # j += 1 unless (j + 1) > last_array.size
      if(j + 1) < last_array.size
        j += 1 
      else
        result_array.concat(first_array.drop(i))
        break
      end      
    end 
    k += 1
  end
  return result_array
end

array_b4 = [1,2,4,2,6,3,8,0,5]
puts "Merge Sort" + array_b4.inspect
puts merge_sort(array_b4).inspect
# puts merge([1,4,9],[2,3,5]).inspect

#Calculate inversions of an array, piggyback on Merge Sort
def merge_sort_count(array)
  return 0, array if array.size == 1
  n = array.size / 2
  first_count = 0
  last_count = 0
  first_array = array.take(n)
  last_array = array.drop(n)
  # binding.pry
  first_count, array_b = merge_sort_count(first_array)
  last_count, array_c = merge_sort_count(last_array)
  split_count, array_a = count_split_inversions(array_b,array_c)
  return (split_count + first_count + last_count), array_a
end

def count_split_inversions(array_b, array_c)
  k = 0
  i = 0
  j = 0
  count = 0
  result_array = []
  while k < array_b.size + array_c.size
    # binding.pry
    if array_b[i] <= array_c[j]  
      result_array[k] = array_b[i]
      if(i + 1) < array_b.size
        i += 1 
      else
        result_array.concat(array_c.drop(j))
        break
      end
    elsif array_b[i] > array_c[j]
      result_array[k] = array_c[j]
      # j += 1 unless (j + 1) > C.size
      #count the rest element of B
      count += array_b.drop(i).size
      if(j + 1) < array_c.size
        j += 1 
      else
        result_array.concat(array_b.drop(i))
        break
      end      
    end 
    k += 1
  end
  return count, result_array
end

array = [1,2,4,2,6,3,8,0,5]
puts "Count inversions of an array(piggyback on Merge Sort)" + array.inspect
puts merge_sort_count(array).inspect
