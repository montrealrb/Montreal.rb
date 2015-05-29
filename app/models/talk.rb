# == Schema Information
#
# Table name: talks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  bio         :text
#  slides      :string(255)
#  author_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Talk < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :author, class_name: "User"

  validates :author, presence: true
  
  def bio
    self[:bio].blank? ? author.bio : self[:bio]
  end

  def votes_count
    #TODO: cache
    votes.size
  end
end
