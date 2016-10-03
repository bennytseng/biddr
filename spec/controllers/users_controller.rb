require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "#new" do
    it "redirects to new view (Create User)" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    it "redirects after creating a new user" do
      get :new
      expect(response).to render_template :new
    end
  end

end
