class Array
  def to_histogram
    hist = Hash.new
    self.each do |el|
      hist.has_key?(el) ? hist[el] += 1 : hist[el] = 1
      end
  end
end

