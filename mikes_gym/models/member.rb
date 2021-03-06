require_relative("../db/sql_runner.rb")

class Member

  attr_reader :id
  attr_accessor :member_type, :wallet, :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @wallet = options['wallet']
    @member_type = options['member_type']
  end

  def save()
    sql = "INSERT INTO members (first_name, last_name, wallet, member_type) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @wallet, @member_type]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE members SET (first_name, last_name, wallet, member_type) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @wallet, @member_type, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    result = member_data.map {|member| Member.new(member)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Member.new(result.first)
  end

  def pretty_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def get_class_attended_by_member
    sql = "SELECT classes.* FROM classes INNER JOIN bookings ON bookings.class_id = classes.id WHERE member_id = $1"
    values = [@id]
    classes = SqlRunner.run(sql, values)
    class_data = classes.map {|gymclass| GymClass.new(gymclass)}
    return class_data
  end
  
end
