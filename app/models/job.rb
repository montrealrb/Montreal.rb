class Job < ActiveRecord::Base
  STATUSES = ["draft", "published", "archived"]
  belongs_to :organization
end
