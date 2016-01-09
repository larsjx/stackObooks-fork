helpers do
  def add_response(respondable, response_body)
    respondable.responses.new(body: response_body, user_id: current_user.id)
  end
end
