class Hamming
  VERSION = 1

  def self.compute(str1, str2)
    count = str1.length
    raise ArgumentError if count != str2.length

    distance = 0
    i = 0
    while i < count
      distance += 1 if str1[i] != str2[i]
      i += 1
    end
    distance
  end

end
