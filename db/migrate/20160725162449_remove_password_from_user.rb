class RemovePasswordFromUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :password_digest
    end
  end
end
