require "rails_helper"

describe 'Sessions Api' do
  it 'signs in a user with correct credentials' do
    user = create(:user)
    delete '/api/sign_out', params:
      {user: {email: user.email, password: user.password},
       format: :json
    }

    expect(response.status).to eq(204)
  end
end
