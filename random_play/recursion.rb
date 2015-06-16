# No built-in iteration methods to be used, also no enumerables, loops and or count/size/length

def reverse(array)
  el = array.pop
  reverse(array) unless array.empty?
  array.unshift(el)
end

a = [1, 2, 3]

p reverse(a) == [3, 2, 1]
