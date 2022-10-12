def json_response_body(&block)
  JSON.parse(response.body, symbolize_names: true).tap do |content|
    yield content if block_given?
  end
end