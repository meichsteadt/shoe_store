class Store < ActiveRecord::Base
  has_and_belongs_to_many(:shoes)
  validates(:name, :presence => true)
end
