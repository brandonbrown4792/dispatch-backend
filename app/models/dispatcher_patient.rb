class DispatcherPatient < ApplicationRecord
  belongs_to :dispatcher, class_name: 'User'
  belongs_to :patient, class_name: 'User'
end
