class Talk < ActiveRecord::Base
  translates :title, :description
  belongs_to :event

  enum state: [:proposed, :scheduled, :presented]
  enum level: [:beginner, :intermediate, :advanced]
end
