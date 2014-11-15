class Headcount < ActiveRecord::Base
  has_many :subordinates, class_name: 'Headcount', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Headcount'
end
