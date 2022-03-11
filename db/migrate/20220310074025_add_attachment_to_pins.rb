class AddAttachmentToPins < ActiveRecord::Migration[7.0]
  def change
    remove_column :pins, :image
    add_column :pins, :image, :binary
  end
end