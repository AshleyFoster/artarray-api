require "rails_helper"

describe "Users Api" do
  it "signs up a new user with correct credentials" do
    post "/api/signup", params:
      {user: {email: "test@email.com", password: "test-password"},
       registration: {email: "test@email.com", password: "test-password"},
       format: :json
    }
    expect(response.status).to eq(201)
  end

  it "throws an error when a user signs up with a short password" do
    post "/api/signup", params:
      {user: {email: "test@email.com", password: "te"},
       registration: {email: "test@email.com", password: "te"},
       format: :json
    }
    expect(response.status).to eq(422)
  end

  it "throws an error when a user signs up with an invalid email" do
    post "/api/signup", params:
      {user: {email: "test", password: "test-password"},
       registration: {email: "test", password: "test-password"},
       format: :json
    }
    expect(response.status).to eq(422)
  end

  it "throws an error when a user signs up with empty credentials" do
    post "/api/signup", params:
      {user: {email: " ", password: " "},
       registration: {email: " ", password: " "},
       format: :json
    }
    expect(response.status).to eq(422)
  end

end
