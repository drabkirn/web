class CreateApiManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :api_managers do |t|
      t.references :user, null: false, foreign_key: true
      t.text :scopes, array: true
      t.string :secret
      t.text :api_counts, array: true

      t.timestamps
    end

    add_index :api_managers, :secret, unique: true
  end
end
