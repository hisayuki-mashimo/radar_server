class CreateUserParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parameters do |t|

      t.numeric :user_id
      t.numeric :parameter_id
      t.numeric :parameter

      t.timestamps
    end
  end
end
