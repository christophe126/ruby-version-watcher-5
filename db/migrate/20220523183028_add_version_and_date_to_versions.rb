class AddVersionAndDateToVersions < ActiveRecord::Migration[7.0]
  def change
    add_column :versions, :num_version, :text
    add_column :versions, :date_version, :date
  end
end
