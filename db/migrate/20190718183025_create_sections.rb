class CreateSections < ActiveRecord::Migration[5.2]
  def up
    create_table :sections do |t|
      t.references :page, foreign_key: true
      t.string :name
      t.integer :position
      t.boolean :visible
      t.string :content_type
      t.text :content

      t.timestamps
    end
  end

  def down
    drop_table :sections
  end
end
