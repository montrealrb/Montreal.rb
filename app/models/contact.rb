# frozen_string_literal: true

class Contact < ActiveRecord::Base
  include Authorable

  belongs_to :organization

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
