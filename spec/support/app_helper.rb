module AppHelper
  def app
    @app ||= PageApp.new
  end
end
