class UserController
  attr_accessor :view

  def initialize view
    @view = view
    @repo = User::Repository.new
  end

  def isUser?
    @repo.check @view
  end



end
