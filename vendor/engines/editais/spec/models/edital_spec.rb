require 'spec_helper'

describe Edital do

  def reset_edital(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @edital.destroy! if @edital
    @edital = Edital.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_edital
  end

  context "validations" do
    
    it "rejects empty titulo" do
      Edital.new(@valid_attributes.merge(:titulo => "")).should_not be_valid
    end

    it "rejects non unique titulo" do
      # as one gets created before each spec by reset_edital
      Edital.new(@valid_attributes).should_not be_valid
    end
    
  end

end