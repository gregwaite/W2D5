class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    new_hash = 0
    each.with_index do |el, i|
      new_hash += el.hash * (i + 1)
    end
    new_hash #need to hash to integer and account for different orders
  end
end

class String
  def hash
    char_arr = ("a".."z").to_a
    str_arr = self.chars.map { |char| char_arr.index(char) }
    str_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_count = 0
    each do |k, v|
      hash_count += k.hash * v.hash
    end
    hash_count
  end
end
