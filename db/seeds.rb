User.create!([
  {email: "admin@letsapp.biz", password: "letsapp",reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2020-04-18 16:54:56", last_sign_in_at: "2020-04-17 19:41:46", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "MJ-wxbdyEuns___Ly6ey", confirmed_at: "2020-02-15 14:39:30", confirmation_sent_at: "2020-02-15 14:38:53", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: nil, invitation_sent_at: nil, invitation_accepted_at: nil, invitation_limit: nil, invited_by_type: nil, invited_by_id: nil, invitations_count: 0, role: "SysAdmin", name: "Admin", unread: 0, encrypted_otp_secret: "FGJcb/B5B1TtrM1hMhTRi2mAlzh7yTDl4MCPbW1DBXk4i+nGw6lLjQ==\n", encrypted_otp_secret_iv: "+cE1eESYW8oMtziw\n", encrypted_otp_secret_salt: "_22CNfhOZj5ty+mZKOqiBcA==\n", consumed_timestep: 52905083, otp_required_for_login: false, otp_backup_codes: ["$2a$11$k.feNUFft38.sQ.KVCGl3OkL8mrReqV6MF4mAT7Bps5qdYuXjjQJm", "$2a$11$wKo.udKq.epUkAwgR8gJr..arNHRazZigHGhQCwCWGZC7LPyDT4fS", "$2a$11$gjK.ax20vB8TlhfoS5nsq.iwrU4reNhSW/HrA6RVPudc5EKe.h86O", "$2a$11$eZTmnymwzpWc2vmJmmNPW.zCecncD.SBB2LVxucvBFonPKX6eewwK", "$2a$11$LeHzqfE0h5MzPSnNNyMI4uBR/IyAKrQ7BWtT.gHFKFnsuhbP2aG5y"], otp_secret: nil},
  {email: "david.ng@letsapp.biz", password: "letsapp", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2020-02-17 06:22:42", last_sign_in_at: "2020-02-17 04:27:48", current_sign_in_ip: "::1", last_sign_in_ip: "::1", confirmation_token: "Y4zq8jy3cR3qtikWvPLy", confirmed_at: "2020-02-15 14:41:53", confirmation_sent_at: "2020-02-15 14:41:20", unconfirmed_email: nil, failed_attempts: 0, unlock_token: nil, locked_at: nil, invitation_token: nil, invitation_created_at: "2020-02-15 14:40:10", invitation_sent_at: "2020-02-15 14:40:10", invitation_accepted_at: "2020-02-15 14:43:35", invitation_limit: nil, invited_by_type: nil, invited_by_id: nil, invitations_count: 0, role: "CoAdmin", name: "David CTO", unread: 0, encrypted_otp_secret: nil, encrypted_otp_secret_iv: nil, encrypted_otp_secret_salt: nil, consumed_timestep: nil, otp_required_for_login: nil, otp_backup_codes: nil, otp_secret: nil}
])
Team.create!([
  {code: "LA", name: "Letsapp Limited", local_name: "智叻科技有限公司"},
  {code: "OS", name: "Optical Sensing", local_name: "Optical Sensing"}
])
Member.create!([
  {user_id: 1, team_id: 1, role: "Owner", email: nil},
  {user_id: 2, team_id: 1, role: "Staff", email: nil},
  {user_id: 1, team_id: 2, role: "Owner", email: nil}
])
Master.create!([
  {team_id: 1, code: "TABLE", name: "Master Table", local_name: "數據表 ", parent_id: nil, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "WORK", name: "Work", local_name: "工作", parent_id: 1, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "DEFECT", name: "Defect", local_name: "瑕疵", parent_id: 1, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "WORKFLOW", name: "Worfklow", local_name: "工作流程", parent_id: 1, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "LOCATION", name: "Location", local_name: "位置", parent_id: 1, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "INT", name: "Internal Work", local_name: "內部工作", parent_id: 4, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "OS", name: "Outsource", local_name: "外包工作", parent_id: 4, icon: "", setting1: nil, param1: ""},
  {team_id: 1, code: "SIMPLE", name: "Simple", local_name: "簡單工作", parent_id: 4, icon: "", setting1: nil, param1: ""}
])
Work.create!([
  {team_id: 1, code: "SI", name: "Site Inspection ", local_name: "工地檢查", icon_id: nil, workflow_id: 6},
  {team_id: 1, code: "RQR", name: "Request for Repair", local_name: "維修要求", icon_id: nil, workflow_id: 6},
  {team_id: 1, code: "RP", name: "Repair", local_name: "維修", icon_id: nil, workflow_id: 7},
  {team_id: 1, code: "SW", name: "Safety Walk ", local_name: "工地安全檢查", icon_id: nil, workflow_id: 6}
])
Location.create!([
  {code: "INT", name: "Internal Location", local_name: "內部位置", parent_id: "", team_id: 1}
])
WorkItem.create(code: '1.0', name: 'Housekeepiong', local_name: '家務', work_id: 1)
WorkItem.create(code: '1.1', name: 'Site tidiness', local_name: '建築工地整潔', work_id: 1)
WorkItem.create(code: '1.2', name: 'Stacking of material', local_name: '堆疊的材料', work_id: 1)
WorkItem.create(code: '1.3', name: 'Projecting nail', local_name: '突出釘子', work_id: 1)
WorkItem.create(code: '1.4', name: 'Collection and removal of site wastes', local_name: '收集和清除場地廢物', work_id: 1)
WorkItem.create(code: '2.0', name: 'Roads work', local_name: '道路工作', work_id: 1)
WorkItem.create(code: '2.1', name: 'Publicity board provided with information correcly provided', local_name: '宣傳板提供正確提供的信息', work_id: 1)
WorkItem.create(code: '2.3', name: 'TTA displayed onto the publicity board', local_name: 'TTA展示在宣傳板上', work_id: 1)
WorkItem.create(code: '2.4', name: 'Adequate vehicular and pedestrain diversion', local_name: '充足的車輛和行人分流', work_id: 1)
WorkItem.create(code: '2.2', name: 'Valid XP displayed onto the publicity board', local_name: '有效的XP顯示在宣傳板上', work_id: 1)
WorkItem.create(code: '2.5', name: 'Traffic signs, cones & barrier placed in right position', local_name: '交通標誌，錐體和障礙物放置在正確的位置', work_id: 1)
WorkItem.create(code: '2.6', name: 'Quality of traffic signs, cones, lantern & barrier', local_name: '交通標誌，視錐細胞，燈籠和屏障的質量', work_id: 1)
WorkItem.create(code: '2.7', name: 'Barriers property interlocked', local_name: '障礙物業互鎖', work_id: 1)
WorkItem.create(code: '2.8', name: 'Idling sign board', local_name: '怠速標誌牌', work_id: 1)
WorkItem.create(code: '2.9', name: 'Warning lanterns', local_name: '警告燈籠', work_id: 1)
WorkItem.create(code: '2.10', name: 'Materials and tools maintain inside the fenced off area', local_name: '材料和工具保持在圍欄區域內', work_id: 1)
WorkItem.create(code: '2.11', name: 'Others - Water-filled barriers', local_name: '其他的 - 充滿水的障礙物', work_id: 1)
WorkItem.create(code: '3.0', name: 'Personal Protective Equipment', local_name: '個人保護設備', work_id: 1)
WorkItem.create(code: '3.1', name: 'Safety helmets', local_name: '安全頭盔', work_id: 1)
WorkItem.create(code: '3.2', name: 'Safety Shoes', local_name: '安全鞋', work_id: 1)
WorkItem.create(code: '3.3', name: 'Eye goggles', local_name: '護目鏡', work_id: 1)
WorkItem.create(code: '3.4', name: 'Ear plugs', local_name: '耳塞', work_id: 1)
WorkItem.create(code: '3.5', name: 'Respirateor / dust mask', local_name: '呼吸器/防塵面罩', work_id: 1)
WorkItem.create(code: '3.6', name: 'Reflective vest', local_name: '反光背心', work_id: 1)
WorkItem.create(code: '3.7', name: 'Safety barness with fall arrestor', local_name: '帶防墜落裝置的安全帶', work_id: 1)
WorkItem.create(code: '3.8', name: 'Protective gloves', local_name: '防護手套', work_id: 1)
WorkItem.create(code: '3.9', name: 'Others - Personal Protective Equipment', local_name: '其他-個人保護設備', work_id: 1)
WorkItem.create(code: '4.0', name: 'Lifting Appliances and Lifting gears', local_name: '起重設備和起重裝置', work_id: 1)
WorkItem.create(code: '4.1', name: 'Lifting Applicanes', local_name: '起重設備', work_id: 1)
WorkItem.create(code: '4.2', name: 'Lifting appliances Statutory Test and Examination Cert (form 3,4 and 5)', local_name: '起重設備法定測試及檢驗證書（表格3,4及5）', work_id: 1)
WorkItem.create(code: '4.3', name: 'Lifting appliances Statutory Inspection Cert (form 1)', local_name: '起重設備法定檢驗證書（表格1）', work_id: 1)
WorkItem.create(code: '4.4', name: 'Qualified opertor', local_name: '合格的操作者', work_id: 1)
WorkItem.create(code: '4.5', name: 'Lifting gears and slings', local_name: '起重裝置和吊索', work_id: 1)
WorkItem.create(code: '4.6', name: 'Others - Lifting Appliances and Lifting gears', local_name: '其他-起重設備和起重裝置', work_id: 1)
WorkItem.create(code: '5.0', name: 'Working at height / Above-ground work', local_name: '在高處工作/地上工作', work_id: 1)
WorkItem.create(code: '5.1', name: 'Use of proper step platform for above-ground work', local_name: '使用適當的台階平台進行地上工作', work_id: 1)
WorkItem.create(code: '5.2', name: 'Working platform fully boarded with railings and toe board', local_name: '工作平台完全登上欄杆和腳趾板', work_id: 1)
WorkItem.create(code: '5.3', name: 'Scaffolding', local_name: '搭棚工作', work_id: 1)
WorkItem.create(code: '5.4', name: 'Safe access to Scaffolding / working platform', local_name: '安全通路搭棚工作/工作平台', work_id: 1)
WorkItem.create(code: '5.5', name: 'Preventive measures against falling objects', local_name: '防止掉落物體的預防措施', work_id: 1)
WorkItem.create(code: '5.6', name: 'Others - Working at height / Above-ground work', local_name: '其他-在高處工作/地上工作', work_id: 1)
WorkItem.create(code: '6.0', name: 'Excavation / Filling', local_name: '挖掘/填充', work_id: 1)
WorkItem.create(code: '6.1', name: 'Barriers / fencing', local_name: 'barriers / fencing', work_id: 1)
WorkItem.create(code: '6.2', name: 'Safe access to trench / slope', local_name: '安全進入溝渠/斜坡', work_id: 1)
WorkItem.create(code: '6.3', name: 'Shoring to trench', local_name: '支撐溝', work_id: 1)
WorkItem.create(code: '6.4', name: 'Form 4', local_name: '表格4', work_id: 1)
WorkItem.create(code: '6.5', name: 'Temporay drainage system / silt trapping facilities', local_name: '臨時排水系統/淤泥捕集設施', work_id: 1)
WorkItem.create(code: '6.6', name: 'Underground utility protection', local_name: '地下公用設施保護', work_id: 1)
WorkItem.create(code: '6.7', name: 'Others - Excavation / Filling', local_name: '其他-挖掘/填充', work_id: 1)
WorkItem.create(code: '7.0', name: 'Electricity', local_name: '電力', work_id: 1)
WorkItem.create(code: '7.1', name: 'Distributing board', local_name: '配電板', work_id: 1)
WorkItem.create(code: '7.2', name: 'Wiring and earthing', local_name: '電線和接地', work_id: 1)
WorkItem.create(code: '7.3', name: 'Generator', local_name: 'Generator', work_id: 1)
WorkItem.create(code: '7.4', name: 'Others - Electricity', local_name: '其他-電力', work_id: 1)
WorkItem.create(code: '8.0', name: 'Plants and Machinery', local_name: '廠和機械', work_id: 1)
WorkItem.create(code: '8.1', name: 'Circular saw', local_name: '圓鋸', work_id: 1)
WorkItem.create(code: '8.2', name: 'Abrasive wheel', local_name: '砂輪', work_id: 1)
WorkItem.create(code: '8.3', name: 'Air compressor', local_name: '空氣壓縮機', work_id: 1)
WorkItem.create(code: '8.4', name: 'Arc Wlding machine', local_name: '弧焊機', work_id: 1)
WorkItem.create(code: '8.5', name: 'Oxy-acetylene cutting set', local_name: '氧乙炔切割裝置', work_id: 1)
WorkItem.create(code: '8.6', name: 'Cold milling equipment', local_name: '冷銑刨設備', work_id: 1)
WorkItem.create(code: '8.7', name: 'Earth moving equipment', local_name: '推土機', work_id: 1)
WorkItem.create(code: '8.8', name: 'Others - bore machine', local_name: '其他 - 鑽孔機', work_id: 1)
WorkItem.create(code: '9.0', name: 'Working in confined space', local_name: '在密閉空間工作', work_id: 1)
WorkItem.create(code: '9.1', name: 'Valid permit-to-work displaued in a conspicuous place', local_name: '地方', work_id: 1)
WorkItem.create(code: '9.2', name: 'Mechganical ventilation to confined space carried out', local_name: '進行密閉空間的機械通風', work_id: 1)
WorkItem.create(code: '9.3', name: 'Worker entering into confined space wear safety harness', local_name: '進入密閉空間的工作者穿安全帶', work_id: 1)
WorkItem.create(code: '9.4', name: 'At least 2 stnadby person stationed outside confined space', local_name: '至少2名待命人員駐留在密閉空間外', work_id: 1)
WorkItem.create(code: '9.5', name: 'Others - Working in confined space', local_name: '其他-在密閉空間工作', work_id: 1)
WorkItem.create(code: '10.0', name: 'Mosquito control', local_name: '蚊子控制', work_id: 1)
WorkItem.create(code: '10.1', name: 'Clearing of stagnant water in pits, drains, etc', local_name: '清除坑，排水溝等中的積水', work_id: 1)
WorkItem.create(code: '10.2', name: 'Sweeping of water at uneven floor', local_name: '在不平的地板上清掃水', work_id: 1)
WorkItem.create(code: '10.3', name: 'Disposal of useless cans, empty lunch boxes', local_name: '處理無用的罐頭，空的飯盒', work_id: 1)
WorkItem.create(code: '10.4', name: 'Covering of container and tanks', local_name: '覆蓋容器和罐', work_id: 1)
WorkItem.create(code: '10.5', name: 'Disposal of abandoned tyres', local_name: '廢棄輪胎的處置', work_id: 1)
WorkItem.create(code: '10.6', name: 'Others - Mosquito control', local_name: '其他 - 蚊子控制', work_id: 1)
WorkItem.create(code: '11.1', name: 'Noise control', local_name: '噪音控制', work_id: 1)
WorkItem.create(code: '11.1', name: 'Comply with the CNP (works during night time or holiday)', local_name: '遵守CNP（夜間或假日工作）', work_id: 1)
WorkItem.create(code: '11.2', name: 'Air compressor and breaker', local_name: '空氣壓縮機和斷路器', work_id: 1)
WorkItem.create(code: '12.0', name: 'General', local_name: '一般', work_id: 1)
WorkItem.create(code: '12.1', name: 'Any improper ladder in depots/works sites/work vehciles', local_name: '任何', work_id: 1)
WorkItem.create(code: '12.3', name: 'Gas cylinders', local_name: '氣瓶', work_id: 1)
WorkItem.create(code: '12.4', name: 'Dangerous goods', local_name: '危險物品', work_id: 1)
WorkItem.create(code: '12.5', name: 'Dust control', local_name: '防塵', work_id: 1)
WorkItem.create(code: '12.6', name: 'First aids box', local_name: 'First aids box', work_id: 1)
WorkItem.create(code: '12.7', name: 'Fire Extinguisher', local_name: '滅火器', work_id: 1)
WorkItem.create(code: '12.8', name: 'Others - General', local_name: '其他 - 一般', work_id: 1)
WorkItem.create(code: '13.0', name: 'Checking of registration card', local_name: '檢查登記卡', work_id: 1)
WorkItem.create(code: '13.1', name: 'Construction worker registration card', local_name: '建築工人登記卡', work_id: 1)
WorkItem.create(code: '13.2', name: 'Green card', local_name: '綠卡', work_id: 1)
WorkItem.create(code: '13.4', name: 'Others - Checking of registration card', local_name: '其他 - 檢查登記卡', work_id: 1)
WorkItem.create(code: '14.0', name: 'Other unsafe act or unsafe condition', local_name: '其他不安全行為或不安全狀況', work_id: 1)
