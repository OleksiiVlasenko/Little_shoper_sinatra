class AddProducts < ActiveRecord::Migration[6.0]
  def change
  	Product.create :title=>'Hawaiian', :description=> 'This is pizza with
  	pineapples',:price => 60,:size => 30,:is_spicy => false,:is_veg =>
  	false,:is_best_offer =>true,:picture =>'/images/hawaiian.jpg'

  	Product.create :title=>'Peperoni', :description=> 'This is pizza with
  	spicy',:price => 70,:size => 40,:is_spicy => true,:is_veg =>
  	false,:is_best_offer =>false,:picture =>'/images/spicy.jpg'

  	Product.create :title=>'Tomato', :description=> 'This is pizza with
  	tomato',:price => 50,:size => 30,:is_spicy => false,:is_veg =>
  	true,:is_best_offer =>true,:picture =>'/images/veg.jpg'
  end
end
