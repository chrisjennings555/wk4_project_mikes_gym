require_relative("../models/member")
require_relative("../models/gymclass")
require_relative("../models/booking")

Booking.delete_all
Member.delete_all
GymClass.delete_all


member1 = Member.new({'first_name' => 'Chris', 'last_name' => 'Jennings', 'wallet' => 10, 'member_type' => 'gold'})

member2 = Member.new({'first_name' => 'Mike', 'last_name' => 'Monteith', 'wallet' => 20, 'member_type' => 'gold'})

member3 = Member.new({'first_name' => 'Kate', 'last_name' => 'Hamilton', 'wallet' => 30, 'member_type' => 'silver'})

member4 = Member.new({'first_name' => 'Jake', 'last_name' => 'Thwaites', 'wallet' => 20, 'member_type' => 'gold'})

member1.save
member2.save
member3.save
member4.save

gymclass1 = GymClass.new({'class_name' => 'Spin', 'class_tier' => 'gold', 'class_capacity' => 10})

gymclass2 = GymClass.new({'class_name' => 'Circuits', 'class_tier' => 'silver', 'class_capacity' => 12})

gymclass1.save
gymclass2.save

booking1 = Booking.new({'member_id' => member1.id, "class_id" => gymclass1.id})
booking2 = Booking.new({'member_id' => member2.id, "class_id" => gymclass2.id})
booking3 = Booking.new({'member_id' => member3.id, "class_id" => gymclass1.id})

booking1.save
booking2.save
booking3.save

gymclass1.get_members_at_class__pretty_names
