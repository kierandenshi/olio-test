class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.integer :external_id, index: { unique: true, name: 'unique_external_id' }
      t.string  :title
      t.string  :description
      t.string  :section, null: false, default: 'food'
      t.string  :image_url
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
