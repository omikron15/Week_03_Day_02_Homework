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




  # def save()
  #   #Create db connection
  #   db = PG.connect({dbname: "pizza_shop", host: "localhost"})
  #
  #   #Create sql statment with placeholders for variables
  #   sql = "INSERT INTO pizza_orders
  #   (first_name, last_name, topping, quantity)
  #   VALUES
  #   ($1, $2, $3, $4) RETURNING id;"
  #
  #   #Create array to store values to be added to SQL statment
  #   values = [@first_name, @last_name, @topping, @quantity]
  #
  #   #Creates prepared DB stament called "Save" ready to be executed
  #   db.prepare("Save",sql)
  #
  #   #Executes db statement called "Save" which is combined with values array to get string
  #   result = db.exec_prepared("Save", values)
  #
  #   #Close DB connection
  #   db.close()
  #
  #   @id = result[0]["id"].to_i
  # end #End of save method

  #
  # def delete()
  #
  # end
  #
  # def update()
  #
  # end
  #
  # def self.all
  #
  # end
  #
  # def self.delete_all
  #
  # end

end #End of class
