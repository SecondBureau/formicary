class Chart < ActiveRecord::Base
  attr_accessible :content, :title, :english, :chinese
  has_many :nodes
end
