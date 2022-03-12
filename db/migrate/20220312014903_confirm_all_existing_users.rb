class ConfirmAllExistingUsers < ActiveRecord::Migration[7.0]
  def change
    execute("UPDATE users SET confirmed_at = date('now')")
  end
end
