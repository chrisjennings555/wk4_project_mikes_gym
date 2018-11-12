require_relative("../db/sql_runner.rb")
require_relative("./gymclass.rb")
require_relative("./member.rb")

class Booking

  attr_reader :member_id, :class_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id']
    @class_id = options['class_id']
  end

  def save()
    sql = "INSERT INTO bookings (member_id, class_id) VALUES ($1, $2) RETURNING id"
    values = [@member_id, @class_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE bookings SET (member_id, class_id) = ($1, $2) WHERE id = $3"
    values = [@member_id, @class_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    booking_data = SqlRunner.run(sql)
    result = booking_data.map {|booking| Booking.new(booking)}
    return result
  end

  def member_at_class()
    sql = "SELECT members.first_name, members.last_name, classes.class_name FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    INNER JOIN classes
    ON classes.id = bookings.class_id"
    datas = SqlRunner.run(sql)
    return datas.map {|info| info}
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    result = SqlRunner.run(sql, values)
    return Member.new(result.first)
  end

  def class()
    sql = "SELECT * FROM classes WHERE id = $1"
    values = [@class_id]
    result = SqlRunner.run(sql, values)
    return GymClass.new(result.first)
  end

end
