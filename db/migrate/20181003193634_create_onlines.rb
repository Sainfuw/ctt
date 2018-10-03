class CreateOnlines < ActiveRecord::Migration[5.1]
  def change
    create_table :onlines do |t|
      t.string :username

      t.timestamps
    end
  end
end
