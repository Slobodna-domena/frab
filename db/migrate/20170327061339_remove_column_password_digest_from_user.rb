class RemoveColumnPasswordDigestFromUser < ActiveRecord::Migration[5.1]
  def change
    User.update_all('encrypted_password=password_digest')
    remove_column :users, :password_digest
  end
end
