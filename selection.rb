# Sort1 is faster

# for i = 1:n,
#     k = i
#     for j = i+1:n, if a[j] < a[k], k = j
#     → invariant: a[k] smallest of a[i..n]
#     swap a[i,k]
# end

# Version 1
def sort1(collection)
  collection.each_with_index do |el, i|
    k = i
    j = i+1
    while j < collection.length
      if collection[j] < collection[k]
        collection[j], collection[k] = collection[k], collection[j]
      end
      j += 1
    end
  end
  collection
end

# Version 2
def sort2(collection)
  k = 0
  while k < collection.length
    j = 1
    while j < collection.length
      if collection[j] < collection[k]
        collection[j], collection[k] = collection[k], collection[j]
      end
      j += 1
    end
    k += 1
  end
  collection
end



def benchmark
  start = Time.now
  yield
  p (Time.now - start)
end

# SIMPLE
# c = [54, 82, 4, 5, 4, 3,1,12,3,3,124]

# RANDOM - NOT SORTED
# c = Array.new(10000) { rand(1..100000) }
c = Array.new(1000) { rand(1..100000) }

# NEARLY SORTED
# c = Array.new(5000)
# c.map!.with_index {|el, i| i}

# benchmark { sort1(c) }

sort1_time = benchmark { sort1(c) }
sort2_time = benchmark { sort2(c) }
p (sort1_time - sort2_time)
