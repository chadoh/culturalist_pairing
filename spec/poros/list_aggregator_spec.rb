require "rails_helper"

RSpec.describe ListAggregator do
  let(:data) {
    [
      {
        "id" => 70,
        "user_id" => 12,
        "title" => "Pizza Toppings",
        "list_items" => [20, 24, 28, 22, 21, 27, 29, 26, 23, 25]
      },
      {
        "id" => 71,
        "user_id" => 10,
        "title" => "Pizza Toppings",
        "list_items" => [21, 23, 24, 20, 25, 29, 27, 26, 28, 22]
      },
      {
        "id" => 72,
        "user_id" => 11,
        "title" => "Pizza Toppings",
        "list_items" => [30, 20, 21, 22, 23, 24, 25, 26, 27, 28]
      }
    ]
  }
  let(:aggregator) { ListAggregator.new(data.map{|item| item["list_items"]}) }

  describe '#most_popular_items' do
    it "returns an array of ids" do
      most_popular = aggregator.most_popular
      expect(most_popular).to be_kind_of Array
      expect(most_popular.first).to be_kind_of Integer
    end

    it "returns items sorted by popularity in input arrays" do
      expect(aggregator.most_popular).to eq [20, 21, 24, 23, 22, 28, 25, 27, 30, 29]
    end
  end
end

