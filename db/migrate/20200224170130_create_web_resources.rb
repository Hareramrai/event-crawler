class CreateWebResources < ActiveRecord::Migration[5.2]
  def change
    create_table :web_resources do |t|
      t.string :name
      t.string :url
      t.boolean :marked_as_deleted, default: false

      t.timestamps
    end
  end
end
