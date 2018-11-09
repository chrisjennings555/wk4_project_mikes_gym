require_relative("../models/member")
require_relative("../models/class")

Member.delete_all

member1 = Member.new({'first_name' => 'Chris', 'last_name' => 'Jennings', 'wallet' => 10, 'member_type' => 'gold'})

member2 = Member.new({'first_name' => 'Mike', 'last_name' => 'Monteith', 'wallet' => 20, 'member_type' => 'gold'})


member1.save
member2.save
# member1.delete
