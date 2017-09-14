# frozen_string_literal: true
class MarkdownField < Administrate::Field::Base
  def to_s
    data
  end
end
