require "administrate/fields/base"

class EnumField < Administrate::Field::Base
  def to_s
    data
  end
end
