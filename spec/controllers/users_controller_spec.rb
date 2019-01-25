require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user1) {FactoryGirl.create(:user)}

  context "GET #show/:id" do
    before(:each) do
      get :show, params: {id: user1.id}
    end

    it "should render show user" do
      expect(response).to render_template :show
    end
  end
end
