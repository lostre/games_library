class AddIsAdminIsStaffIsDataEntryIsViewerToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean
    add_column :users, :is_staff, :boolean
    add_column :users, :is_data_entry, :boolean
    add_column :users, :is_viewer, :boolean
  end

  def self.down
    remove_column :users, :is_viewer
    remove_column :users, :is_data_entry
    remove_column :users, :is_staff
    remove_column :users, :is_admin
  end
end
