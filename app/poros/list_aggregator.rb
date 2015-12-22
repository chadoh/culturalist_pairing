class ListAggregator
  def initialize(array_of_lists)
    @arr = array_of_lists
  end

  def most_popular
    scores = Hash.new{|hash, key| hash[key] = 0 }
    arr.each do |sub_array|
      sub_array.each_with_index do |item, index|
        scores[item] += 10 - index
      end
    end
    scores.sort_by{|id, score| -score}.to_h.keys.first(10)
  end

  private

  attr_reader :arr
end
