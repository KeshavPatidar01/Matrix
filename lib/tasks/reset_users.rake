namespace :db do
  desc "Reset all users in the database"
  task reset_users: :environment do
    puts "Deleting all users..."
    User.destroy_all
    puts "All users deleted successfully!"
  end
end