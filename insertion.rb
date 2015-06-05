# for i = 2:n,
#     for (k = i; k > 1 and a[k] < a[k-1]; k--)
#         swap a[k,k-1]
#     → invariant: a[1..i] is sorted
# end

# Implemented 3 different versions of the algorithm, playing with order and type of conditionals, trying to increase performance


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

# Replaced original (sort1) algorithm's while loop with until loop to see if doing one check (that seems more likely to occur) vs 2 checks would increase performance
def sort2(collection)
  # p "sort 2"
  # p collection
  collection[1..-1].each_with_index do |el, i|
    k = i + 1
    # p "******/***** i is: #{i} ************"
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


# Used break to stop loop when index reaches 0 instead of including it in the while/until loop as a second conditional - again - to see if it affects performance.
def sort3(collection)
  # p "sort 3"
  # p collection
  collection[1..-1].each_with_index do |el, i|
    k = i + 1
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

def sort4(collection)
  # p "sort 4"
  # p collection
  i = 0
  while i < collection.length - 1
    k = i + 1
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
    i += 1
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
a = Array.new(5000) { rand(1..1000000) }

# NEARLY SORTED
# a = Array.new(10000000)
# a.map!.with_index {|el, i| i}

b = a.clone
c = a.clone
d = a.clone

### Performance of all of them are very close to each other. Need more detailed tests really.

# benchmark { sort1(a) }
# benchmark { sort2(b) }
# benchmark { sort3(c) }

sort1_time = benchmark { sort1(a) }
p "*" * 20
sort2_time = benchmark { sort2(b) }
p "*" * 20
sort3_time = benchmark { sort3(c) }
p "*" * 20
sort4_time = benchmark { sort4(d) }

# p (sort2_time - sort1_time)
# p (sort3_time - sort1_time)
# p (sort2_time - sort3_time)



