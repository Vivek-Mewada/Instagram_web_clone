class AddStatusToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :status, :string, default: "public"
  end
end
