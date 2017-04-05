require_relative('../db/sql_runner')
require ('pry-byebug')

class Adoption

  attr_reader :animal_id, :owner_id, :id

  def initialize( options )
    @id = nil || options['id'].to_i
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id) VALUES (#{@animal_id},#{@owner_id}) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
    sql = "UPDATE animals SET adopted = 'TRUE' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run(sql)
    return results.map {|adoption|Adoption.new(adoption)}
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = #{id}"
    results = SqlRunner.run(sql)
    return results.map {|adoption|Adoption.new(adoption)}
  end

  def self.delete_all
    sql = "UPDATE animals SET adopted = 'FALSE';"
    SqlRunner.run(sql)
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "UPDATE animals SET adopted = 'FALSE' WHERE animals.id = #{id}"
    SqlRunner.run(sql)
    sql = "DELETE FROM adoptions WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def owner
    sql = "SELECT * FROM owners o INNER JOIN adoptions a ON a.owner_id = o.id WHERE o.id = #{@owner_id}"
    results = SqlRunner.run(sql)
    return Owner.new(results.first)
  end

  def animal
    sql = "SELECT * FROM animals INNER JOIN adoptions ON adoptions.animal_id = animals.id WHERE animals.id = #{@animal_id}"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def honour(owner_id, animal_id)
    @owner = Owner.find(owner_id)
    @animal = Animal.find(animal_id)
    if @owner.honour_level < @animal.honour_level
      return true
    else
      return false
    end
  end

end
