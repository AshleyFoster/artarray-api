require "rails_helper"

describe 'Sessions Api' do
  it 'signs in a user with correct credentials' do
    user = create(:user)
    post '/api/sign_in', params:
      {user: {email: user.email, password: user.password},
       format: :json
    }

    expect(response.status).to eq(201)
  end

  it 'throws an error with incorrect password' do
    user = create(:user)

    post '/api/sign_in', params: {
      user: {email: user.email, password: 'not_password'},
      format: :json
    }

    expect(response.status).to eq(401)
  end

  it "throws an error with incorrect email" do
    user = create(:user)

    post "/api/sign_in", params: {
      user: {email: "not_email", password: user.password},
      format: :json
    }

    expect(response.status).to eq(401)
  end

  it "throws an error when user doesn't exits" do
    post "/api/sign_in", params: {
      user: {email: "random@user.net", password: "not_password"},
      format: :json
    }

    expect(response.status).to eq(401)
  end

  it "throws an error when recieving bad credentials" do
    post "/api/sign_in", params: {
      user: {email: " ", password: " "},
      format: :json
    }

    expect(response.status).to eq(401)
  end
end
