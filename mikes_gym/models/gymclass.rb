require_relative("../db/sql_runner.rb")

class GymClass

  attr_reader :class_capacity
  attr_accessor :class_name, :class_tier

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

  def self.delete_all
    sql = "DELETE FROM classes"
    SqlRunner.run(sql)
  end
  
end
