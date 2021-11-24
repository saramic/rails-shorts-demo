class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.references :url, null: false, foreign_key: true
      t.string :request

      t.timestamps
    end
  end
end
