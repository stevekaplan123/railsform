class AddAttributesToFruits < ActiveRecord::Migration
  def change
  	add_column :fruits, :title, :string
  	add_column :fruits, :description, :text
  	add_column :fruits, :owner, :text
  	add_column :fruits, :type_id, :integer
  end
end
