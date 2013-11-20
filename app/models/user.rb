class User < ActiveRecord::Base
	has_secure_password
	  # t.string :email            
   #    t.string :name             
   #    t.string :province
   #    t.string :city         
   #    t.integer :age           
   #    t.text :description    
	  # t.string :password_digest
   #    t.timestamps

	validates :name, presence: true
	validates :province, presence: true
	validates :city, presence: true

	validates :age, presence: true, numericality: 
	{ only_integeter: true }

	validates :description, presence: true, 
	length: { minimum: 1 }

	validates :password, length: { in: 6..10 }

	validates :email, presence: true, uniqueness: true, 
	:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	has_one :goal

end
