class UpdateUsersName < ActiveRecord::Migration
  def change
          rename_table :contents, :users
        end
    end
end
