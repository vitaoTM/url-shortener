class Base62
  ALPHA = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).join
  BASE = ALPHA.size
  def self.encode(num)
    return ALPHA.first if num.zero? || num.nil?

    result = ""
    while num > 0
      index = num % BASE
      char = ALPHA[index]
      result.prepend char
      num = num / BASE
    end
    result
  end

  def self.decode(str)
    num = 0
    s = str.chars.reverse

    s.each_with_index do |e, i|
      num += ALPHA.index(e) * BASE ** i
    end
    num
    # return BASE if
  end
end
