class AddFormatToTalk < ActiveRecord::Migration[5.1]
  def change
    add_column :talks, :format, :string, nil: false
    Talk.find_each do |talk|
      talk.format = :full
      talk.save(validate: false)
    end
  end
end
