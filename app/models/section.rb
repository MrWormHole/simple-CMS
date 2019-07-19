class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users,:through => :section_edits
  validates_presence_of :name,:position,:visible,:content_type,:content
end
