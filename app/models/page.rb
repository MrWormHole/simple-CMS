class Page < ApplicationRecord
  has_and_belongs_to_many :admin_users
  belongs_to :subject
  has_many :sections
  validates_presence_of :name,:permalink,:position, :visible

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}
  scope :sorted, lambda {order(:position => :asc)}
  scope :newest_first, lambda {order(:created_at => :desc)}
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
