require('rspec')
require('pry')
require('template.rb')

describe('Class#method') do
  it("will do something") do
    expect("input".method()).to(eq('output'))
  end
end
