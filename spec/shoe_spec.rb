require 'spec_helper'

describe Shoe do
  it { should have_and_belong_to_many(:stores) }
  it "validates presence of name" do
    shoe = Shoe.create({name: ""})
    expect(shoe.save()).to(eq(false))
  end
  it "converts the name to capitalized" do
    shoe = Shoe.create(name: 'nIKE')
    expect(shoe.name).to eq('Nike')
  end
end
