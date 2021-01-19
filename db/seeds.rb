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

  # Test Cartridges
  puts "Populating test cartridges..."
  Cartridge.find_or_create_by(name: '9mm Luger')
  Cartridge.find_or_create_by(name: '.223 Remington')
  Cartridge.find_or_create_by(name: '6mm ARC')
  Cartridge.find_or_create_by(name: '6.5 Creedmoor')

  # Reloading Steps
  puts "Populating ReloadingChecklistSteps"
  ReloadingChecklistStep.find_or_create_by(name: 'Clean Brass')
  ReloadingChecklistStep.find_or_create_by(name: 'Anneal')
  ReloadingChecklistStep.find_or_create_by(name: 'Decap')
  ReloadingChecklistStep.find_or_create_by(name: 'Lube Brass')
  ReloadingChecklistStep.find_or_create_by(name: 'Size Brass')
  ReloadingChecklistStep.find_or_create_by(name: 'Decap & Size Brass')
  ReloadingChecklistStep.find_or_create_by(name: 'Clean Lube Off Brass')
  ReloadingChecklistStep.find_or_create_by(name: 'Turn Necks')
  ReloadingChecklistStep.find_or_create_by(name: 'Trim Neck Length')
  ReloadingChecklistStep.find_or_create_by(name: 'Deburr & Chamfer')
  ReloadingChecklistStep.find_or_create_by(name: 'Trim, Deburr & Chamfer')
  ReloadingChecklistStep.find_or_create_by(name: 'Clean Flash Hole')
  ReloadingChecklistStep.find_or_create_by(name: 'Clean Primer Pockets')
  ReloadingChecklistStep.find_or_create_by(name: 'Seat Primer')
  ReloadingChecklistStep.find_or_create_by(name: 'Lube Necks')
  ReloadingChecklistStep.find_or_create_by(name: 'Expand Necks')
  ReloadingChecklistStep.find_or_create_by(name: 'Drop Powder Charge')
  ReloadingChecklistStep.find_or_create_by(name: 'Seat Bullets')
  ReloadingChecklistStep.find_or_create_by(name: 'Ready to Expand, Charge & Seat')
  ReloadingChecklistStep.find_or_create_by(name: 'Crimp')

  # User Reloading Checklists
  puts "Populating test user's Handgun checklist"
  checklist_handgun = UserReloadingChecklist.find_or_create_by(name: 'Handgun', user: test_user)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Decap', order: 1)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Clean Brass', order: 2)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Size Brass', order: 3)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Seat Primer', order: 4)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Drop Power Charge', order: 5)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Seat Bullets', order: 6)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_handgun, name: 'Crimp', order: 7)

  puts "Populating test user's Rifle checklist"
  checklist_rifle = UserReloadingChecklist.find_or_create_by(name: 'Rifle', user: test_user)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Decap', order: 1)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Clean Brass', order: 2)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Anneal', order: 3)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Lube Brass', order: 4)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Size Brass', order: 5)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Clean Lube Off Brass', order: 6)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Trim, Deburr & Chamfer', order: 7)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Seat Primer', order: 8)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Drop Power Charge', order: 9)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Seat Bullets', order: 10)
  UserReloadingChecklistStep.find_or_create_by(user: test_user, user_reloading_checklist: checklist_rifle, name: 'Crimp', order: 11)

  puts "done!"
end
