class RemoveSequentialOrderToTopics < ActiveRecord::Migration[8.0]
  def change

    remove_column :topics, :sequential_order, :integer
 
  end
end
