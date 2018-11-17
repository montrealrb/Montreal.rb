# frozen_string_literal: true

class Member < ActiveRecord::Base
  has_and_belongs_to_many :organizations
  has_many :events, as: :organizer
  belongs_to :user
  has_many :talks

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
