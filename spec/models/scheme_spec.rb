require 'spec_helper'

describe Scheme do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }

    it { should have_field(:name).of_type(String) }
    
    it { should have_field(:amount).of_type(Float).with_default_value_of(0) }
    it { should validate_numericality_of(:amount) }
    
    it { should have_field(:currency).of_type(String).with_default_value_of("usd") }
    it { should validate_inclusion_of(:currency).to_allow("usd") }

    it { should have_field(:frequency).of_type(String).with_default_value_of("monthly") }
    it { should validate_inclusion_of(:frequency).to_allow("weekly", "monthly", "yearly") }

    it { should have_field(:offset).of_type(Integer).with_default_value_of(0) } 
    it { should validate_numericality_of(:offset).greater_than_or_equal_to(0).less_than_or_equal_to(31) }

    it { should be_embedded_in(:service).of_type(Service).as_inverse_of(:schemes)}       
  end
end
