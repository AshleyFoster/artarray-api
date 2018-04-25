require 'rails_helper'

describe 'POST#create' do
  it 'creates a post with required fields' do
    user = create(:user)
    post '/api/posts', params: {
      post: {
        title: 'title',
        description: 'description',
        image: Base64.encode64(file_fixture('puppy.jpeg').read),
        file_name: 'image'
      },
      format: :json
    },
    headers: {
      'Accept': 'application/json',
      'X-User-Email': user.email,
      'X-User-Token': user.authentication_token,
    }

    expect(response.status).to eq(200)
  end

  it 'throws an error when title is blank' do
    user = create(:user)
    post '/api/posts', params: {
      post: {
        title: '',
        description: 'description',
        image: Base64.encode64(file_fixture('puppy.jpeg').read),
        file_name: 'image'
      },
      format: :json
    },
    headers: {
      'Accept': 'application/json',
      'X-User-Email': user.email,
      'X-User-Token': user.authentication_token,
    }
    expect(response.status).to eq(422)
  end

  it 'throws an error when description is blank' do
    user = create(:user)
    post '/api/posts', params: {
      post: {
        title: 'title',
        description: '',
        image: Base64.encode64(file_fixture('puppy.jpeg').read),
        file_name: 'image'
      },
      format: :json
    },
    headers: {
      'Accept': 'application/json',
      'X-User-Email': user.email,
      'X-User-Token': user.authentication_token,
    }
    expect(response.status).to eq(422)
  end
end
