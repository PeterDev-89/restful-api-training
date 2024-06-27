class AddTypeToContact < ActiveRecord::Migration[7.1]
  def change
    add_reference :contacts, :type, null: false, foreign_key: true
  end
end
