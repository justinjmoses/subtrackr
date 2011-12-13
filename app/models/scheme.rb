class Scheme
  include Mongoid::Document
  
  field :name,      :type => String
  field :amount,    :type => Float
  field :currency,  :type => String
  field :frequency, :type => String
  
  embedded_in :service
end