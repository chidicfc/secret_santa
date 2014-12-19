class User
  attr_accessor :name, :password

  def initialize (name, password)
    @name = name
    @password = password
  end

  def self.from_hash(row)
    user = User.new row[:name], row[:password]
    user
  end

  class Repository

    def initialize
      @datastore = DataBaseDataStore.new
    end

  end


end
