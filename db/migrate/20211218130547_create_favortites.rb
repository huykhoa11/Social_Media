class CreateFavortites < ActiveRecord::Migration[6.1]
  def change
    create_table :favortites do |t|
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
