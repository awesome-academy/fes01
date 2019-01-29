require "rails_helper"
require "spec_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  subject{user}

  context "type_columns" do
    it do
      should have_db_column(:email).of_type(:string)
      should have_db_column(:name).of_type(:string)
      should have_db_column(:phone).of_type(:string)
      should have_db_column(:encrypted_password).of_type(:string)
      should have_db_column(:role).of_type(:integer)
    end
  end

  context "validates" do
    it "check the presence of name" do
      is_expected.to validate_presence_of(:name).with_message(/can't be blank/)
    end

    it "check the presence of email" do
      is_expected.to validate_presence_of(:email).with_message(/can't be blank/)
    end

    it "check the presence of password" do
      is_expected.to validate_presence_of(:password).with_message(/can't be blank/)
    end

    it "check max length of name" do
      is_expected.to validate_length_of(:name).is_at_most(50).with_message(/is too long/)
    end

    it "check role" do
      is_expected.to define_enum_for(:role).with(admin: 1, subscriber: 0)
    end
  end

  context "associations" do
    it "check association with excercises" do
      is_expected.to have_many(:excercises).dependent(:destroy)
    end

    it "check association with following" do
      is_expected.to have_many(:following)
    end

    it "check association with followers" do
      is_expected.to have_many(:followers)
    end

    it "check association with passive relationships" do
      is_expected.to have_many(:passive_relationships)
    end

    it "check association with active relationships" do
      is_expected.to have_many(:active_relationships)
    end
  end

  context "scope" do
    let(:user1) {FactoryGirl.create(:user, created_at: Date.new(2016,01,01))}
    let(:user2) {FactoryGirl.create(:user, created_at: Date.new(2016,03,01))}
    let(:user3) {FactoryGirl.create(:user, created_at: Date.new(2016,02,01))}
    it "orders by created_at DESC" do
      expect_result = [user2.id, user3.id, user1.id]
      expect(User.sort_by_created.ids).to eq expect_result
    end
  end
end
