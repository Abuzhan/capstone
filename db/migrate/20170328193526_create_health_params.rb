class CreateHealthParams < ActiveRecord::Migration
  def change
    create_table :health_params do |t|
      t.string :temperature
      t.string :pulse

      t.timestamps
    end
  end
end
