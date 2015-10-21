class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user
      t.datetime :contact_time
      t.string :note
      t.boolean :checked_in?, default: false
      t.boolean :alert_worthy?, default: false
      t.boolean :alert_sent?, default: false

      t.timestamps null: false
    end
  end
end
