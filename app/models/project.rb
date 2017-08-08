class Project < ApplicationRecord
  belongs_to :client
  belongs_to :admin
  has_many :sprints

end
