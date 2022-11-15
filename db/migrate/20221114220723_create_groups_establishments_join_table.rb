class CreateGroupsEstablishmentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :establishments
  end
end
