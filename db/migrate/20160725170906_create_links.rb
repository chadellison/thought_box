class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :link
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
