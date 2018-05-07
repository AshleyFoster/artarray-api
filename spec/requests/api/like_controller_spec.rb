require "rails_helper"

describe "LikesController" do
  describe '#create' do
    it 'creates a like for a signed in user' do
      user = create(:user)
      post = create(:post, id: 1)

      expect{
        post "/api/posts/#{post.id}/like", headers: {
          'X-User-Email' => user.email,
          'X-User-Token' => user.authentication_token
        }
      }.to change{Like.count}.by(1)
      expect(response.status).to eq(200)
    end

    it 'returns 401 when user is not signed in' do
      post = create(:post, id: 1)

      post "/api/posts/#{post.id}/like"

      expect(response.status).to eq(401)
    end
  end

  describe "DELETE #destroy" do
    context "when user owns like" do
      it "deletes the like" do
        user = create(:user)
        post = create(:post, id: 1)
        create(:like, user: user, post: post)

        expect{
          delete "/api/posts/#{post.id}/like", headers: {
            'X-User-Email' => user.email,
              'X-User-Token' => user.authentication_token
          }
        }.to change{Like.count}.by(-1)
        expect(response.status).to eq(204)
      end
    end

    context "when user does not own like" do
      it "does not delete the like" do
        owner = create(:user, id: 1)
        user = create(:user, id: 2)
        post = create(:post, id: 1)
        create(:like, user: owner, post: post)

        expect{
          delete "/api/posts/#{post.id}/like", headers: {
            'X-User-Email' => user.email,
            'X-User-Token' => user.authentication_token
          }
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
