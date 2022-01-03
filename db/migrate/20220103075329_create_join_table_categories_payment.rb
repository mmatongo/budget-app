class CreateJoinTableCategoriesPayment < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :payments do |t|
      t.index [:category_id, :payment_id]
    end
  end
end
