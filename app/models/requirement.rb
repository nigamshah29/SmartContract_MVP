class Requirement < ApplicationRecord
  belongs_to :sprint
  has_one :assignee

end
