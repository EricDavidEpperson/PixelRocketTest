require 'pry'

class Phone
  attr_accessor :number

  def initialize(number)
    @number = number
    @number.gsub!(/\D/, "")
  end

  def number
    number_is_right_length(@number)
  end

  def area_code
    number_is_right_length(@number)
    @number = @number[0, 3]
  end

  def to_s
    number_is_right_length(@number)
    @number = "(" + @number[-10, 3] + ")" + " " + @number[-7, 3] + "-" + @number[-4, 4]
  end

  def number_is_right_length(number)
    case @number.length
    when 10
      return @number
    when 11
      if @number[0] == "1"
        @number = @number[1, 10]
      else @number = "0000000000"
      end
    else
      @number ="0000000000"
    end
  end
end
