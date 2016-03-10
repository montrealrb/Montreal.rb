module ActiveRecordExtensions
  MAX_STRING_COLUMN_LENGTH = 255
  MAX_TEXT_COLUMN_LENGTH = 65_536
end

ActiveRecord::Base.send(:include, ActiveRecordExtensions)
