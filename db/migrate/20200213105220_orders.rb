class Orders < ActiveRecord::Migration[6.0]
  def change
  		create_table :orders do |t|
  		t.string  :order_number
  		t.decimal :quantity
  		t.decimal :id_pizza
  		t.decimal :total_summ
  		t.timestamps	
  	end
  end
end
