class Login
  attr_accessor :name, :password

  def initialize name, password
    @name = name
    @password = password
  end

  class Repository

    def initialize
      @datastore = DataBaseDataStore.new
    end

    def check login
      @datastore.check login
    end

    def delete login
      @datastore.delete_login login
    end


  end


end
