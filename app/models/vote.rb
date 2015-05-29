# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validate :vote_once

  private

  def vote_once
    errors.add(:base, I18n.t("errors.vote_once")) if Vote.exists?(user: user, votable: votable)
  end
end
