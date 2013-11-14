class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string :email,            
      t.string :name,             
      t.string :province,
      t.string :city,           
      t.integer :age,            
      t.text :description,        
	  t.string :password_digest,
      t.timestamps
    end
  end
end
