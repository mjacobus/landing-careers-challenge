require "spec_helper"

RSpec.describe UserService do
  let(:client)  { double(ApiClient) }
  subject { UserService.new(api_client: client) }

  describe '#find_user_by_id' do
    before do
      allow(client).to receive(:get).with('/users/1').and_return({
        id: 1,
        name: 'John Doe',
      })
    end

    it 'returns a valid user' do
      user = subject.find_by_id(1)

      expect(user).to be_a(User)
      expect(user.name).to eq('John Doe')
    end
  end
end
