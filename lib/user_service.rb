class UserService
  def initialize(api_client:)
    @client = api_client
  end

  def find_by_id(id)
    data = @client.get('/users/1')

    User.new(data)
  end
end
