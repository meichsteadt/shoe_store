require 'spec_helper'

describe Shoe do
  it { should have_and_belong_to_many(:stores) }
  it("validates presence of name") do
    shoe = Shoe.create({name: ""})
    expect(shoe.save()).to(eq(false))
  end
end
