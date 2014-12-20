class User
  attr_accessor :name

  def initialize name
    @name = name
  end

  def self.from_hash(row)
    user = User.new row[:name]
    user
  end

  class Repository

    def initialize
      @datastore = DataBaseDataStore.new
    end

    def play_secret_santa
      @datastore.play_secret_santa
    end

    def delete user
      @datastore.delete user
    end



  end


end
