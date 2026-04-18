class AddSequentialOrderToTopics < ActiveRecord::Migration[7.0] # Your Rails version may vary
  def change
    add_column :topics, :sequential_order, :integer
    add_index :topics, :sequential_order, unique: true # Optional: Ensure unique ordering
  end
end