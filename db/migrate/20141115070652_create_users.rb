class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :manager
      t.string :first_name
      t.string :last_name

      t.timestamps
      t.belongs_to :company
    end
  end
end
