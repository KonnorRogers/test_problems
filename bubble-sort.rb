def bubble_sort(arr)
  for i in 0...arr.length
    for j in (i+1)...arr.length
      if arr[i] > arr[j]
        arr[j], arr[i] = arr[i] , arr[j]
        #array i is smaller, array j is larger
      end
    end
  end
  print arr
end

puts bubble_sort([10,2,5,7,1])

def bubble_sort_by(arr)
  for i in 0...arr.length
    for j in (i+1)...arr.length
      if yield(arr[i], arr[j]) > 0
        arr[j], arr[i] = arr[i], arr[j]
        #if array j is smaller, swap the two
      end
    end
  end
  print arr
end

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
  left.length - right.length
end
