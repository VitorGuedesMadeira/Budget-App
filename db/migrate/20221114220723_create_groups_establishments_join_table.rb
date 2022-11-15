class CreateGroupsEstablishmentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :establishments
  end

  def change
    create_table :categories_expenses, id: false do |t|
      t.belongs_to :category
      t.belongs_to :expense
    end

end
