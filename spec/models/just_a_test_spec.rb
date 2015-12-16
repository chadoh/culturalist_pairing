require "rails_helper"

RSpec.describe JustATest do
  it "ensures rspec is configured to run properly" do
    expect(JustATest.new.this_is_a_test).to eq :test
  end
end

