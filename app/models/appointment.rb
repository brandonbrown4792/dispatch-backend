class Appointment < ApplicationRecord
  has_many :notes
  belongs_to :patient, class_name: 'User'
  belongs_to :nurse, class_name: 'User', optional: true
end
