class Category < ActiveRecord::Base
  attr_accessible :description, :group_id, :item_id, :name

  belongs_to :group
  has_many   :items, dependent: :destroy
end
