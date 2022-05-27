class AddNewVersionAndEndSupportToVersions < ActiveRecord::Migration[7.0]
  def change
    add_column :versions, :new_version, :boolean, default: false
    add_column :versions, :support_version, :boolean, default: false
  end
end
