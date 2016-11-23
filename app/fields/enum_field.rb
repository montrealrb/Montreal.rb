# frozen_string_literal: true
class EnumField < Administrate::Field::Base
  def to_s
    data
  end
end
