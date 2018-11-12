require_relative("../db/sql_runner.rb")

class GymClass

  attr_reader :id
  attr_accessor :class_name, :class_tier, :class_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @class_tier = options['class_tier']
    @class_capacity = options['class_capacity']
  end

  def save()
    sql = "INSERT INTO classes (class_name, class_tier, class_capacity) VALUES ($1, $2, $3) RETURNING id"
    values = [@class_name, @class_tier, @class_capacity]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM classes"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE classes SET (class_name, class_tier, class_capacity) = ($1, $2, $3) WHERE id = $4"
    values = [@class_name, @class_tier, @class_capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM classes WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM classes"
    gymclass_data = SqlRunner.run(sql)
    result = gymclass_data.map {|gymclass| GymClass.new(gymclass)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM classes  WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return GymClass.new(result.first)
  end

  def class_name()
    @class_name
  end

end
