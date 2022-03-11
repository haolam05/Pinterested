class RemoveImageColumnInPins < ActiveRecord::Migration[7.0]
  def change
    remove_column :pins, :image
  end
end