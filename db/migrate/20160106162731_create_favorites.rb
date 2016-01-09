class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :post_id
      t.integer :response_id
    end
  end
end
