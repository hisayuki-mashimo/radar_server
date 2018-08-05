class CreateMasterParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :master_parameters do |t|
      t.numeric :type_id, null: false
      t.string :label, null: false

      t.timestamps
    end
  end
end
