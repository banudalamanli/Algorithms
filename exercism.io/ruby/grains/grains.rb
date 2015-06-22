class Grains
  def self.square(n)
    2**(n-1)
  end

  def self.total
    (0..63).inject(0) { |total, n| total += (2**n) }
  end
end
