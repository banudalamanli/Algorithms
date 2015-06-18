# Generate all the strings of length n drawn from 0..k-1

##### SOLUTION:
$result = []

def base_string(length,base)
  if(length < 1)
    p $result.join
  else
    base.times do |j|
      $result[length-1] = j
      base_string(length-1, base)
    end
  end
end

4.times do |length|
  4.times do |base|
    puts
    puts "-" * 20
    puts "with length:#{length} and base:#{base}"
    puts "-" * 20

    base_string(length,base)
  end
end

__END__
# OUTPUT EXAMPLES:
--------------------
with length:2 and base:3
--------------------
"00"
"10"
"20"
"01"
"11"
"21"
"02"
"12"
"22"
--------------------
with length:3 and base:3
--------------------
"000"
"100"
"200"
"010"
"110"
"210"
"020"
"120"
"220"
"001"
"101"
"201"
"011"
"111"
"211"
"021"
"121"
"221"
"002"
"102"
"202"
"012"
"112"
"212"
"022"
"122"
"222"
