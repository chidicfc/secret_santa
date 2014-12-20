class UserController
  attr_accessor :view

  def initialize view
    @view = view
    @repo = User::Repository.new
  end

  def play_secret_santa
    @view.name = @repo.play_secret_santa
  end

  def delete user
    @repo.delete user
  end
end
