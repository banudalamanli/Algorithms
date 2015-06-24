class Bob

  def hey(remark)
    # Regardless of whether the remark has been phrased as a question or not, when all characters are upcase AND some of them are letters, meaning at least some words are being yelled, then:
    return 'Whoa, chill out!' if (remark.match(/[A-Z]/) != nil) && remark.upcase == remark

    # When there is no "yelling" and the remark is not a question:
    if remark[-1] != "?"
      # When true => there are no "non-white" character (letters, digits, etc.) matches, meaning nothing is said.
      !remark.match(/\S/) ?
        'Fine. Be that way!' : 'Whatever.'
    else # When the remark is a question:
      'Sure.'
    end
  end

end
