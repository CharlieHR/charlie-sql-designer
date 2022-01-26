class CreateSchemas < ActiveRecord::Migration[6.1]
  def change
    create_table :schemas do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
