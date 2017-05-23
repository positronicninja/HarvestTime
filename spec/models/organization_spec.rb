require 'rails_helper'

describe Organization, type: :model do
  describe "username/password errors" do
    it "should raise error if missing a credential" do
      expect { Organization.create!.harvesting }.to raise_error(/Missing Credentials/i)
    end
  end
end
