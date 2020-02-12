class CreateProducts < ActiveRecord::Migration[6.0]
  def change
  	create_table :products do |t|
  		t.string :title
  		t.decimal :price
  		t.decimal :size
  		t.text :description
  		t.boolean :is_spicy
  		t.boolean :is_veg
  		t.boolean :is_best_offer
  		t.string :picture
  		t.timestamps

  		
  	end
  end
end
