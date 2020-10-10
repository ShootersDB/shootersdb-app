if Rails.env == 'production'
    puts "What the #&$! are you doing!? You probably don't want to run this in production."
    puts "If you do, create a Rake task, or some other deliberate process."
elsif ['development', 'qa'].include?(Rails.env)
  # Set up test user
  puts "Creating test user..."
  test_user = User.find_or_create_by(email: 'test@example.com') do |user|
    user.password = 'testing123'
    user.password_confirmation ='testing123'
    user.skip_confirmation!
  end

  puts "done!"
end
