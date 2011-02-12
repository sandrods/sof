require 'spec_helper'

describe Evento do

  def reset_evento(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @evento.destroy! if @evento
    @evento = Evento.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_evento
  end

  context "validations" do
    
    it "rejects empty titulo" do
      Evento.new(@valid_attributes.merge(:titulo => "")).should_not be_valid
    end

    it "rejects non unique titulo" do
      # as one gets created before each spec by reset_evento
      Evento.new(@valid_attributes).should_not be_valid
    end
    
  end

end