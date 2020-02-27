class CreateParsers < ActiveRecord::Migration[5.2]
  def change
    create_table :parsers do |t|
      t.string :host
      t.string :path
      t.references :web_resource, foreign_key: true
      t.string :event_list_container
      t.string :title
      t.string :sub_title
      t.string :category
      t.string :start_time
      t.string :end_time
      t.string :description
      t.string :url
      t.string :pagination
      t.boolean :marked_as_deleted, default: false

      t.timestamps
    end
  end
end
