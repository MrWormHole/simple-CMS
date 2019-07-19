class CreatePages < ActiveRecord::Migration[5.2]
  def up
    create_table :pages do |t|
      t.references :subject, foreign_key: true
      t.string :name
      t.integer :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end

  def down
    drop_table :pages
  end
end
