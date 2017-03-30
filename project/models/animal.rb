require_relative('../db/sql_runner')

class Animal

  attr_reader :name, :id

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @species = options['species']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @ready_to_adopt = options['ready_to_adopt']
    @honour_level = options['honour_level']
  end

  def save()
    sql = "INSERT INTO animals (name, species, breed, admission_date, ready_to_adopt, honour_level) VALUES ('#{@name}','#{@species}','#{@breed}','#{@admission_date}','#{@ready_to_adopt}',#{@honour_level}) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|animal|Animal.new(animal)}
  end

  def self.find( id )
    sql = "SELECT * FROM animals WHERE id=#{id}"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

end
