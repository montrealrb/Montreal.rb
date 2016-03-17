class MarkdownField < Administrate::Field::Base
  def to_s
    data
  end
end
