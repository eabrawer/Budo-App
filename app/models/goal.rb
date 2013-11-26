class Goal < ActiveRecord::Base
      # t.string :title
      # t.text :description
      # t.string :martial_art
      # t.integer :cost
      # t.string :duration

      validates :title, presence: true
      validates :description, presence: true 
      validates :martial_art, presence: true 
      validates :duration, presence: true 

      validates :cost, presence: true, numericality: 
      { only_integeter: true }

      belongs_to :user
      # has_one :school
   	  # has_many :pledges, through: :users

end
