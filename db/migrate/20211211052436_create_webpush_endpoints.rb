class CreateWebpushEndpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :webpush_endpoints do |t|
      t.string :endpoint
      t.string :auth_key, null: false, index: { unique: true }
      t.string :p256dh_key

      t.timestamps
    end
  end
end
