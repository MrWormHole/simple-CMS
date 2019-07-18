class AlterUsers < ActiveRecord::Migration[5.2]

  def up
    #puts "*** Renaming a table ***"
    #rename_table("users","admin_users")
    #puts "*** Adding a column ***"
    #add_column("admin_users","username",:string, :limit => 25, :after => "email")
    #puts "*** Changing a column ***"
    #change_column("admin_users","email",:string, :limit => 100)
    #puts "*** Renaming a column ***"
    rename_column("admin_users","password","hashed_password")
    puts "*** Adding an index ***"
    add_index("admin_users","username")
  end

  def down
    puts "*** Removing an index ***"
    remove_index("admin_users","username")
    puts "*** Renaming a column ***"
    rename_column("admin_users","hashed_password","password")
    puts "*** Changing a column ***"
    change_column("admin_users","email",:string, :default => '',:null => false)
    puts "*** Removing a column ***"
    remove_column("admin_users","username",:string, :limit => 25, :after => "email")
    puts "*** Renaming a table ***"
    rename_table("admin_users","users")
  end
end
