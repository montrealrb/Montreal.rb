# frozen_string_literal: true

module Authorable
  extend ActiveSupport::Concern

  included do
    belongs_to :author, foreign_key: :user_id, class_name: "User"

    validates :author, presence: true
  end
end
