class Assignee < ApplicationRecord
  belongs_to :requirement
  has_secure_password
end
