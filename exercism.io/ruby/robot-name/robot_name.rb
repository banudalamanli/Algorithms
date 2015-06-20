class Robot
  attr_accessor :name

  @@letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  @@numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@assigned_names = []

  def initialize
    @name = factory_name
    @@assigned_names << @name
  end

  def factory_name
    new_name = @@letters.sample(2).join + @@numbers.sample(3).join
    factory_name if @@assigned_names.include? new_name
    new_name
  end

  def reset
    @@assigned_names.delete(self.name)
    self.name = factory_name
  end
end
