class SecretSantaController
  attr_accessor :view

  def initialize view
    @view = view
    @repo = User::Repository.new
  end

  def play_secret_santa user
    @view.name = @repo.play_secret_santa user
  end
end
