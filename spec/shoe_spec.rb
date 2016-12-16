require 'spec_helper'

describe Shoe do
  it { should have_and_belong_to_many(:stores) }
  it "creates a Shoe brand" do
    new_shoe = Shoe.create(name: 'Nike')
    expect(Shoe.all).to eq [new_shoe]
  end
end
