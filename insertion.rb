## Sort2 is faster.

def benchmark
  start = Time.now
  yield
  p (Time.now - start)
end


def sort1(collection)
  collection[1..-1].each_with_index do |el, i|
    k = i
    while k > 0 and collection[k] < collection[k-1]
      collection[k], collection[k-1] = collection[k-1], collection[k]
      k -= 1
    end
  end
  collection
end

def sort2(collection)
  collection[1..-1].each_with_index do |el, i|
    k = i
    while k > 0
      while collection[k] < collection[k-1]
      collection[k], collection[k-1] = collection[k-1], collection[k]
      end
      k -= 1
    end
  end
  collection
end

# SIMPLE
# c = [3,1,12,3,3,124]

# RANDOM - NOT SORTED
c = Array.new(10000) { rand(1..100000) }

# NEARLY SORTED
# c = Array.new(5000)
# c.map!.with_index {|el, i| i}

sort1_time = benchmark { sort1(c) }
sort2_time = benchmark { sort2(c) }
p (sort1_time - sort2_time)



