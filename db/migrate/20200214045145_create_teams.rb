class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :code
      t.string :name
      t.string :local_name

      t.timestamps
    end
  end
end
