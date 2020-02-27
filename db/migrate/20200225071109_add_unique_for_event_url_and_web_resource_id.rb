class AddUniqueForEventUrlAndWebResourceId < ActiveRecord::Migration[5.2]
  def change
    add_index :events, %I[web_resource_id event_url], unique: true
  end
end
