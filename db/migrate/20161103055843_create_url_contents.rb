class CreateUrlContents < ActiveRecord::Migration[5.0]
  def change
    create_table :url_contents do |t|
      t.string :content
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
