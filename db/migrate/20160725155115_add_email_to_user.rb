class AddEmailToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :emai
      t.string :password_confirmation
    end
  end
end
