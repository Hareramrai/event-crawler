class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :sub_title
      t.string :category
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :description
      t.string :event_url
      t.boolean :marked_as_deleted, default: false
      t.timestamp :last_crawled_at
      t.references :web_resource, foreign_key: true
      t.timestamps
    end
  end
end
