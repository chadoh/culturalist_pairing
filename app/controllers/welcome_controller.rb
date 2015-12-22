class WelcomeController < ApplicationController

  def index
    body = File.open("#{Rails.root}/public/data.json").read
    json = JSON.parse(body)

    @items = ListAggregator.new(json['lists'].map{ |i| i['list_items'] }).
      most_popular.map{|id| json['items'].detect{|item| item['id'] == id }}.
      map{|item| item['name'] }

    # the code I'd like to have:
    # items = Api::Items.all
    # lists = Api::Lists.all
    # sorted_list = ListAggregator.new(lists.map(&:list_items)).most_popular
    # @items = sorted_list.map {|id| Api::Items.find(id) }.map(&:name)
  end

end

