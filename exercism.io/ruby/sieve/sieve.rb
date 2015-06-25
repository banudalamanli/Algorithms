class Sieve

  def initialize(limit)
    @all_numbers = [*2..limit]
    @result = []
  end

  def primes
    until @all_numbers.empty?
      prime = @all_numbers.shift
      @result << prime
      @all_numbers.each do |num|
       @all_numbers.delete(num) if num % prime == 0
      end
    end
    @result
  end

end
