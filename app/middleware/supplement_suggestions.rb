class SupplementSuggestions
  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] == "/supplements"
      request = Rack::Request.new(env)
      terms = Supplement.order(:name).where("name like ?", "%#{params[:term]}%")
      [200, {"Content-Type" => "application/json"}, [terms.to_json] ]
    else
      @app.call(env)
    end
  end
end