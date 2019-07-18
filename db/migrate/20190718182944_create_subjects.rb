class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|

      t.name :string
      t.position :integer
      t.visible :boolean

      t.timestamps
    end
  end
end
