class AddFormatToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :format, :string, nil: false
    Talk.find_each do |talk|
      talk.format = :full
      talk.save(validate: false)
    end
  end
end
