class AddColumnToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :member_id, :integer
    add_column :attendances, :school_id, :integer

  end
end
