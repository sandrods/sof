require 'spec_helper'

describe Banner do

  def reset_banner(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @banner.destroy! if @banner
    @banner = Banner.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_banner
  end

  context "validations" do
    
    it "rejects empty titulo" do
      Banner.new(@valid_attributes.merge(:titulo => "")).should_not be_valid
    end

    it "rejects non unique titulo" do
      # as one gets created before each spec by reset_banner
      Banner.new(@valid_attributes).should_not be_valid
    end
    
  end

end