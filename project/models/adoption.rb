require_relative('../db/sql_runner')

class Adoption

  attr_reader :animal_id, :owner_id, :id

  def initialize( options )
    @id = nil || options['id'].to_i
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
    @review = options['review']
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id, review) VALUES (#{@animal_id},#{@owner_id}, '#{@review}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run(sql)
    return results.map {|adoption|Adoption.new(adoption)}
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM adoptions where id = #{id}"
    SqlRunner.run(sql)
  end

end
