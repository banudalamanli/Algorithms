# for i = 1:n,
#     swapped = false
#     for j = n:i+1,
#         if a[j] < a[j-1],
#             swap a[j,j-1]
#             swapped = true
#     → invariant: a[1..i] in final position
#     break if not swapped
# end

def sort(collection)
  p collection
  p "********************************"
  collection.each_with_index do |el, i|
    p "*********** i is: #{i} ************"
    swapped = false
    j = collection.length - 1
    while j > i
      p "j is #{j}"
      p "comparing #{collection[j-1]} and #{collection[j]}"
      if collection[j] < collection[j-1]
        p "swapping #{collection[j]} with #{collection[j-1]}"
        collection[j], collection[j-1] = collection[j-1], collection[j]
        swapped = true
      end
      p collection
      p "subracting 1 from j"
      j -= 1
    end
    break unless swapped
  end
  collection
end

def benchmark
  start = Time.now
  yield
  p (Time.now - start)
end



#
# c = [1, 12, 7, 23, 54, 82, 124]
# c = [54, 7, 12, 1, 82, 23, 124, 5]

# RANDOM - NOT SORTED
# c = Array.new(100) { rand(1..1000) }
# c = Array.new(10000) { rand(1..100000) }

# NEARLY SORTED
# c = Array.new(5000)
# c.map!.with_index {|el, i| i}

benchmark { sort(c) }
