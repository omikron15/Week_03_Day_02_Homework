require"pg"

class SpaceCowboy

    attr_reader :id
    attr_accessor :name, :bounty_value, :homeworld, :last_known_location

  def initialize(options)
      @id = options["id"].to_i
      @name = options["name"]
      @bounty_value = options["bounty_value"].to_i
      @homeworld = options["homeworld"]
      @last_known_location = options["last_known_location"]

  end  #End of initialize method

  def save()

    db = PG.connect({dbname: "space_cowboys", host: "localhost"})

    sql = "INSERT INTO cowboys (name, bounty_value, homeworld, last_known_location)
    VALUES
    ($1, $2, $3, $4) RETURNING id;"

    values  = [@name, @bounty_value, @homeworld, @last_known_location]

    db.prepare("Save", sql)

    result = db.exec_prepared("Save", values)

    db.close()

    @id = result[0]["id"].to_i
  end

  def delete()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})

    sql = "DELETE FROM cowboys WHERE id = $1"

    values = [@id]

    db.prepare("Delete", sql)
    db.exec_prepared("Delete", values)
    db.close
  end

  def update()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})

    sql = "UPDATE cowboys SET (name, bounty_value, homeworld, last_known_location) =
    ($1, $2, $3, $4) WHERE id = $5"

    values = [@name, @bounty_value, @homeworld, @last_known_location, @id]

    db.prepare("Update", sql)
    db.exec_prepared("Update", values)
    db.close()
  end

  def self.all
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "SELECT * FROM cowboys"
    db.prepare("Select", sql)
    results = db.exec_prepared("Select")
    db.close
    return results.map {|result| SpaceCowboy.new (result)}
  end

  def self.delete_all
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "DELETE FROM cowboys"
    db.prepare("Delete_all", sql)
    db.exec_prepared("Delete_all")
    db.close
  end

  # Implement a find_by_name method that returns one instance of your
  # class when a name is passed in, or nil if no instance is found.
  # Note: this will probably be another class method
  # self.find_by_name(name) (do you have to use a map method if it's
  # a single result?

  def self.find_by_name(name)
      db = PG.connect({dbname: "space_cowboys", host: "localhost"})
      sql = "SELECT * from cowboys WHERE name = $1"
      values = [name]
      db.prepare("Find", sql)
      results = db.exec_prepared("Find", values)
      db.close

      if results.count == 0
        return nil
      else
        return results[0]
      end

  end


end #End of class
