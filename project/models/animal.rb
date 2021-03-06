require_relative('../db/sql_runner')
require ('pry-byebug')

class Animal

  attr_reader :id

  attr_accessor :name, :species, :breed, :admission_date, :ready_to_adopt, :honour_level, :adopted

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @species = options['species']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @ready_to_adopt = options['ready_to_adopt']
    @honour_level = options['honour_level']
    @adopted = options['adopted']
  end

  def save()
    sql = "INSERT INTO animals (name, species, breed, admission_date, ready_to_adopt, honour_level, adopted) VALUES ('#{@name}','#{@species}','#{@breed}','#{@admission_date}','#{@ready_to_adopt}',#{@honour_level},'#{@adopted}') RETURNING *"
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

  def self.find_name( name )
    sql = "SELECT * FROM animals WHERE name=#{name}"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM animals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.adoptees
    sql = "SELECT a.* FROM animals a INNER JOIN owners o ON a.species = o.species_pref WHERE a.adopted = 'f'"
    results = SqlRunner.run(sql)
    return results.map {|animal|Animal.new(animal)}
  end

  def update()
    sql = "UPDATE owners SET
      name = '#{@name}',
      species = '#{@profile}',
      breed = '#{@address}',
      admission_date = '#{@species_pref}',
      ready_to_adopt = '#{@honour_level}',
      honour_level = #{@honour_level},
      WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  ### Steed List
  # Griffin
  # Pegasus
  # Hippogriff
  # Drake
  # Dragon
  # Wyrm
  # Giant Spider
  # Giant Corgi
  # Snow Leopard
  # Irish Elk

end
