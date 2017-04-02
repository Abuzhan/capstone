class AddTimeToHealthParams < ActiveRecord::Migration
  def change
  	add_column :health_params, :time, :datetime
  end
end
