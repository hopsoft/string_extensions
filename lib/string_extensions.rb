class String

  # Duplicates the current string by count and returns that as a new string.
  def times(count)
    val = []
    count.times {val << self}
    val.join
  end

  # Makes the string possessive.
  def possessify
    return "#{self}'" if self =~ /s$/
    return "#{self}'s"
  end

  # Converts quotes to their HTML number equivalents.
  def ascii_quotes
    value = self.gsub(/'/, "&#39;").gsub(/"/, "&#34;")
    return value
  end

  def escape_quotes
    value = self.gsub('\\','\0\0').gsub(/\r\n|\n|\r/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
    return value
  end

  def quote_magic(outer_quote)
    # TODO make more magical
    value = self

    if outer_quote =~ /'/
      # #value = value.gsub(/\\/, "").gsub(/"/, "\\\"").gsub(/'/, '"')
      value = value.gsub(/'/, '"').gsub(/\\\"/, "&#39;")
    elsif outer_quote =~ /"/
      # #value = value.gsub(/\\/, "").gsub(/'/, "\\'").gsub(/"/, "'")
      value = value.gsub(/"/, "'")
    end

    return value
  end

  # Indicates if the string is in singular form.
  def singular?
    self == self.singularize
  end

  # Indicates if the string is in plural form.
  def plural?
    self == self.pluralize
  end

end