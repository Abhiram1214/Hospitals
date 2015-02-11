class Patient < ActiveRecord::Base
	belongs_to :doctor
	has_many :medications, :dependent => :destroy
	accepts_nested_attributes_for :medications
end
