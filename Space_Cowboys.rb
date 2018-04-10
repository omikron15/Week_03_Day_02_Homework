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

  # def save() 
  #
  # end
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
