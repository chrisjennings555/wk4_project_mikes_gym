require_relative("../models/member")
require_relative("../models/gymclass")

Member.delete_all
GymClass.delete_all

member1 = Member.new({'first_name' => 'Chris', 'last_name' => 'Jennings', 'wallet' => 10, 'member_type' => 'gold'})

member2 = Member.new({'first_name' => 'Mike', 'last_name' => 'Monteith', 'wallet' => 20, 'member_type' => 'gold'})

member1.save
member2.save

gymclass1 = GymClass.new({'class_name' => 'Spin', 'class_tier' => 'gold', 'class_capacity' => 10})

gymclass2 = GymClass.new({'class_name' => 'Circuits', 'class_tier' => 'silver', 'class_capacity' => 12})

gymclass1.save
gymclass2.save
# # member1.delete
#
# member1.member_type = "silver"
# member1.update

gymclass1.class_capacity = 15
gymclass1.update
