if Rails.env == 'production'
    puts "What the #&$! are you doing!? You probably don't want to run this in production."
    puts "If you do, create a Rake task, or some other deliberate process."
elsif ['development', 'qa'].include?(Rails.env)
  # Set up test user
  puts 'Creating test user...'
  test_user = User.find_or_create_by(email: 'test@example.com') do |user|
    user.password = 'testing123'
    user.password_confirmation ='testing123'
    user.skip_confirmation!
  end

  # Manufacturers
  puts 'Populating Manufacturers...'
  berger = Manufacturer.find_or_create_by(name: 'Berger')
  hornady = Manufacturer.find_or_create_by(name: 'Hornady')
  sierra = Manufacturer.find_or_create_by(name: 'Sierra')
  speer = Manufacturer.find_or_create_by(name: 'Speer')
  hodgdon = Manufacturer.find_or_create_by(name: 'Hodgdon')
  alliant = Manufacturer.find_or_create_by(name: 'Alliant')
  imr = Manufacturer.find_or_create_by(name: 'IMR')
  vihtavuori = Manufacturer.find_or_create_by(name: 'Vihtavuori')

  # Bullets
  puts 'Populating Bullets...'
  hornady_6mm_105_bthp = Bullet.find_or_create_by(name: '105 gr. BTHP Match', diameter: 0.243, manufacturer: hornady) do |bullet|
    bullet.weight = 105
    bullet.g1_bc = 0.530
    bullet.g7_bc = 0.253
    bullet.mpn = '2458'
  end
  hornady_65mm_140_eld_match = Bullet.find_or_create_by(name: '140 gr. ELD Match', diameter: 0.264, manufacturer: hornady) do |bullet|
    bullet.weight = 140
    bullet.g1_bc = 0.646
    bullet.g7_bc = 0.326
    bullet.mpn = '26331'
  end

  # Smokeless Powders
  puts 'Populating Smokeless Powders...'
  unique = SmokelessPowder.find_or_create_by(name: 'Unique', manufacturer: alliant)
  pp1200r = SmokelessPowder.find_or_create_by(name: 'Power Pro 1200-R', manufacturer: alliant)
  arcomp = SmokelessPowder.find_or_create_by(name: 'AR Comp', manufacturer: alliant)
  cfe223 = SmokelessPowder.find_or_create_by(name: 'CFE 223', manufacturer: hodgdon)
  h4350 = SmokelessPowder.find_or_create_by(name: 'H4350', manufacturer: hodgdon)
  pp2000mr = SmokelessPowder.find_or_create_by(name: 'Power Pro 200-MR', manufacturer: alliant)

  # Cartridges
  puts 'Populating Cartridges...'
  cartridge_9mm_luger = Cartridge.find_or_create_by(name: '9mm Luger')
  cartridge_223_rem = Cartridge.find_or_create_by(name: '.223 Remington')
  cartridge_6mm_arc = Cartridge.find_or_create_by(name: '6mm ARC')
  cartridge_65_creedmoor = Cartridge.find_or_create_by(name: '6.5 Creedmoor')

  # Manufacturer Load Data
  puts 'Populating Manufacturer Load Data...'
  ## 6mm ARC 105 gr. BTHP
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: cfe223, cartridge: cartridge_6mm_arc, powder_charge: 25.5) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2200
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: cfe223, cartridge: cartridge_6mm_arc, powder_charge: 26.6) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2300
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: cfe223, cartridge: cartridge_6mm_arc, powder_charge: 27.6) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2400
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: cfe223, cartridge: cartridge_6mm_arc, powder_charge: 28.1) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2450
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: cfe223, cartridge: cartridge_6mm_arc, powder_charge: 28.6) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2500
    max_charge = true
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: pp2000mr, cartridge: cartridge_6mm_arc, powder_charge: 26.0) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2200
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: pp2000mr, cartridge: cartridge_6mm_arc, powder_charge: 27.1) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2300
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: pp2000mr, cartridge: cartridge_6mm_arc, powder_charge: 28.1) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2400
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: pp2000mr, cartridge: cartridge_6mm_arc, powder_charge: 28.6) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2450
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hornady, bullet: hornady_6mm_105_bthp, smokeless_powder: pp2000mr, cartridge: cartridge_6mm_arc, powder_charge: 29.1) do |load_data|
    load_data.coal = 2.2
    load_data.velocity = 2500
    max_charge = true
  end
  ## 6.5 Creedmoor
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hodgdon, bullet: hornady_65mm_140_eld_match, smokeless_powder: h4350, cartridge: cartridge_65_creedmoor, powder_charge: 37.2) do |load_data|
    load_data.coal = 2.7
    load_data.velocity = 2528
  end
  ManufacturerLoadDatum.find_or_create_by(manufacturer: hodgdon, bullet: hornady_65mm_140_eld_match, smokeless_powder: h4350, cartridge: cartridge_65_creedmoor, powder_charge: 40.4) do |load_data|
    load_data.coal = 2.7
    load_data.velocity = 2707
    max_charge = true
  end

  # Reloading Steps
  puts 'Populating ReloadingChecklistSteps'
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

  puts 'done!'
end
