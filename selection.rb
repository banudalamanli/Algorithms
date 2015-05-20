# PSEUDOCODE:
# for i = 1:n,
#     k = i
#     for j = i+1:n, if a[j] < a[k], k = j
#     → invariant: a[k] smallest of a[i..n]
#     swap a[i,k]
# end

def sort(collection)
  collection.each_with_index do |el, i|
    j = i+1
    while j < collection.length
      p "i is #{i}"
      p "j is #{j}"
      p collection
      if collection[j] < collection[i]
        p "swapping j: #{collection[j]} with i: #{collection[i]}"
        p "**********************************************"
        collection[j], collection[i] = collection[i], collection[j]
      end
      j += 1
    end
  end
  p collection
end


def benchmark
  start = Time.now
  yield
  p (Time.now - start)
end

# SIMPLE
c = [54, 23, 7, 1, 5]
# c = [82, 54, 1, 12, 7, 23, 124, 5]

# RANDOM - NOT SORTED
# c = Array.new(10000) { rand(1..100000) }
# c = Array.new(1000) { rand(1..100000) }

# NEARLY SORTED
# c = Array.new(5000)
# c.map!.with_index {|el, i| i}

benchmark { sort(c) }
