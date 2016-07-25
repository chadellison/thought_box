class AddUrlInsteadOfLink < ActiveRecord::Migration[5.0]
  def change
    change_table :links do |t|
      t.remove :link
      t.string :url
    end
  end
end
