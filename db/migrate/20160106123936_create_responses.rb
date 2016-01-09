class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :body
      t.references :user
      t.integer :comment_id
      t.string :comment_type

      t.timestamps
    end
  end
end
