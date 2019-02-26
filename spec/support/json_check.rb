module JsonCheck
  def json_body
    JSON.parse(response.body)
  end
end