class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase
  end

  def word_count
    words_hash = Hash.new(0)
    @phrase.gsub(/(\w+[']\w)|(\w+)|(\d)/) { |word| words_hash[word] += 1}
    words_hash
  end
end
