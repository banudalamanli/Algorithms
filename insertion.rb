# for i = 2:n,
#     for (k = i; k > 1 and a[k] < a[k-1]; k--)
#         swap a[k,k-1]
#     → invariant: a[1..i] is sorted
# end




def sort1(collection)
  # p "sort 1"
  # p collection
  collection[1..-1].each_with_index do |el, i|
    k = i + 1
    # p "*********** i is: #{i} ************"
    while k >= 1 and collection[k] < collection[k-1]
      # p "k is: #{k}"
      # p "swapping #{collection[k]} with #{collection[k-1]}"
      collection[k], collection[k-1] = collection[k-1], collection[k]
      # p collection
      # p "subtracting 1 from k"
      k -= 1
    end
  end
  collection
end

def sort2(collection)
  # p collection
  collection.each_with_index do |el, i|
    k = i
    # p "*********** i is: #{i} ************"
    while collection[k] < collection[k-1]
      # p "k is: #{k}"
      # p "swapping #{collection[k]} with #{collection[k-1]}"
      collection[k], collection[k-1] = collection[k-1], collection[k]
      # p collection
      # p "subtracting 1 from k"
      k -= 1
      break if k == 0
    end
  end
  collection
end

# Replaced original (sort1) algorithm's while loop with until loop to see if doing one check vs 2 checks would decrease time
def sort3(collection)
  # p "sort 3"
  # p collection
  collection[1..-1].each_with_index do |el, i|
    k = i + 1
    # p "*********** i is: #{i} ************"
    until collection[k] > collection[k-1] or k == 0
      # p "k is: #{k}"
      # p "swapping #{collection[k]} with #{collection[k-1]}"
      collection[k], collection[k-1] = collection[k-1], collection[k]
      # p collection
      # p "subtracting 1 from k"
      k -= 1
    end
  end
  collection
end


def benchmark
  start = Time.now
  yield
  p (Time.now - start)
end

# SIMPLE
# a = [54, 1, 7, 23, 5]
# a = [82, 54, 1, 12, 7, 23, 124, 5]

# RANDOM - NOT
a = Array.new(10000) { rand(1..100000) }

# NEARLY SORTED
# a = Array.new(50000000)
# a.map!.with_index {|el, i| i}

b = a.clone
c = a.clone

# benchmark { sort1(a) }
# benchmark { sort2(b) }
# benchmark { sort3(c) }

sort1_time = benchmark { sort1(a) }
# sort2_time = benchmark { sort2(b) }
sort3_time = benchmark { sort3(c) }
# p (sort2_time - sort1_time)
p (sort3_time - sort1_time)
# p (sort2_time - sort3_time)



