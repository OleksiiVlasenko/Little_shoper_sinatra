class Orders < ActiveRecord::Migration[6.0]
  def change
  		create_table :orders do |t|
  		t.string  :orders_input
  		t.decimal :quantity
  		t.decimal :id_pizza
  		t.decimal :total_summ
  		t.text :phone
  		t.text :adress
  		t.text :name
  		t.timestamps	
  	end
  end
end
