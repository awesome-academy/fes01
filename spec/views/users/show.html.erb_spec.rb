require "rails_helper"

RSpec.describe "users/show", type: :view do
  let(:user) {FactoryGirl.create :user}

  before(:each) do
    sign_in user
    assign :user, user
    @ability = user
    @ability.extend(CanCan::Ability)
    controller.stub(:current_ability) { @ability }
  end

  context "authorized user" do
    it "can see the path to edit user" do
      @ability.can :update, user
      render
      expect(rendered).to match(user.name)
      expect(rendered).to match("Edit profile")
    end
  end

  context "unauthorized user" do
    it "cannot see the path to edit user" do
      render
      expect(rendered).to match(user.name)
      expect(rendered).not_to match("Edit profile")
    end
  end
end
