class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  validates(:name, :presence => true)
  before_save :capitalize

private
  def capitalize
    self.name = name.downcase.capitalize
  end
end
