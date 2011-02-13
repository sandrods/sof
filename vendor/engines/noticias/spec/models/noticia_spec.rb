require 'spec_helper'

describe Noticia do

  def reset_noticia(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @noticia.destroy! if @noticia
    @noticia = Noticia.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_noticia
  end

  context "validations" do
    
    it "rejects empty titulo" do
      Noticia.new(@valid_attributes.merge(:titulo => "")).should_not be_valid
    end

    it "rejects non unique titulo" do
      # as one gets created before each spec by reset_noticia
      Noticia.new(@valid_attributes).should_not be_valid
    end
    
  end

end