class AddKindToInscription < ActiveRecord::Migration[5.1]
  def change
    add_column :inscriptions, :kind, :integer
  end
end
