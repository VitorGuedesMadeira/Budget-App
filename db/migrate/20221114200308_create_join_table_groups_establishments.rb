class CreateJoinTableGroupsEstablishments < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :establishments do |t|
      # t.index [:group_id, :establishment_id]
      # t.index [:establishment_id, :group_id]
    end
  end
end

#create_table :categories_expenses, id: false do |t|
#  t.belongs_to :category
#  t.belongs_to :expense
#end
