class AddEmailtoUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.remove :emai
      t.string :email
    end
  end
end
