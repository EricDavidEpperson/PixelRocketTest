class Anagram

  def initialize(word)
    @word = word.downcase.split(//).sort
  end

  def match(options)
    options.keep_if { |option| option.downcase.split(//).sort == @word}
  end

end
