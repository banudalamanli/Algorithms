# Generate all the strings of n bits. Assume array[0..n-1] is an array of size n.

####### SOLUTION:

$array = []

def binary(n)
  if n < 1
    p $array.join
  else
    $array[n-1] = 0
    binary(n-1)
    $array[n-1] = 1
    binary(n-1)
  end
end

__END__

OUTPUT EXAMPLE:

binary(3)

"000"
"100"
"010"
"110"
"001"
"101"
"011"
"111"
