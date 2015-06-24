class Bob
  attr_accessor :remark

  def initialize
    @remark = nil
  end

  def hey(remark)
    @remark = remark
    case
    when yelling?
      'Whoa, chill out!'
    when question?
      'Sure.'
    when silence?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end

  private
  def question?
    @remark[-1] == "?"
  end

  def yelling?
    (@remark.match(/[A-Z]/) != nil) && @remark.upcase == @remark
  end

  def silence?
    !@remark.match(/\S/)
  end

end
