class CreateWebResourceCrawlerStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :web_resource_crawler_statuses do |t|
      t.string :url
      t.string :status
      t.timestamp :status_at
      t.integer :last_crawled_events_count
      t.boolean :marked_as_deleted, default: false
      t.references :web_resource, foreign_key: true

      t.timestamps
    end
  end
end
