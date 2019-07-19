class Page < ApplicationRecord
  has_and_belongs_to_many :admin_users
  belongs_to :subject
  has_many :sections
  validates_presence_of :name,:permalink,:position, :visible
end
