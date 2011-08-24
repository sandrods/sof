require 'spec_helper'

describe Texto do

  def reset_texto(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @texto.destroy! if @texto
    @texto = Texto.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_texto
  end

  context "validations" do
    
    it "rejects empty titulo" do
      Texto.new(@valid_attributes.merge(:titulo => "")).should_not be_valid
    end

    it "rejects non unique titulo" do
      # as one gets created before each spec by reset_texto
      Texto.new(@valid_attributes).should_not be_valid
    end
    
  end

end