# frozen_string_literal: true

class JobPolicy < ApplicationPolicy
  def new?
    user_draft?
  end

  def create?
    user_draft?
  end

  def confirmation?
    user_draft?
  end

  private

  def user_draft?
    @record.state.draft? && @record.user_id == @user&.id
  end
end
