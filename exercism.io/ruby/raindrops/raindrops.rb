class Raindrops

  def self.convert(num)
    stringified_num = ''

    stringified_num += "Pling" if num % 3 == 0
    stringified_num += "Plang" if num % 5 == 0
    stringified_num += "Plong" if num % 7 == 0

    stringified_num == '' ? num.to_s : stringified_num
  end


end

# The method below could be more efficient if there is a high possibility that the "Raindrops Language" will have more "words" in the future.
  # def self.convert(num)
  #   rain_speak = { 3 => "Pling", 5 => "Plang", 7 => "Plong"}

  #   stringified_num = ''
  #   rain_speak.each_pair { |key, value| stringified_num += value if num % key == 0 }

  #   stringified_num == '' ? num.to_s : stringified_num
  # end
