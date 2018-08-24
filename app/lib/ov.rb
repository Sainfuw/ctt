class Ov
  def self.request(endpoint = "api/tokens", method = "POST", body = {})
    base_url = "https://45.56.120.113:4443/"
    url = URI(base_url + endpoint)

    http = Net::HTTP.new(url.host, url.port)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'Basic ' + Base64.encode64('OPENVIDUAPP:YOUR_SECRET').chomp
    request["Content-Type"] = 'application/json'
    request.body = body.to_json

    response = http.request(request)
    puts response
    puts response.read_body

    @token = JSON.parse(response.read_body)
  end
end
