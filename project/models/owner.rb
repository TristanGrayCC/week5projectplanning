require_relative('../db/sql_runner')

class Owner

  attr_reader :name, :id, :species_pref

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @profile = options['profile']
    @address = options['address']
    @species_pref = options['species_pref']
    @honour_level = options['honour_level']
  end

  def save()
    sql = "INSERT INTO owners (name, profile, address, species_pref, honour_level) VALUES ('#{@name}','#{@profile}','#{@address}','#{@species_pref}',#{@honour_level}) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map {|owner|Owner.new(owner)}
  end

  def self.find( id )
    sql = "SELECT * FROM owners WHERE id=#{id}"
    results = SqlRunner.run(sql)
    return Owner.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

end
