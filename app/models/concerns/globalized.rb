# frozen_string_literal: true

module Globalized
  def validates_translated(*fields)
    options = fields.extract_options!
    validates(*translated_fields(*fields), options)
  end

  def translated_fields(*fields)
    fields.flat_map { |f| I18n.available_locales.map { |l| :"#{f}_#{l}" } }
  end
end
