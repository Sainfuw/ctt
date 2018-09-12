class RemoveKindFromInscription < ActiveRecord::Migration[5.1]
  def change
    remove_column :inscriptions, :kind, :string
  end
end
