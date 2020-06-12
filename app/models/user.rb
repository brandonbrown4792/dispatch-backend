class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: :patient_id
  has_many :nurse_appointments, class_name: 'Appointment', foreign_key: :nurse_id
  has_many :nurses, through: :patient_appointments
  has_many :patients, through: :nurse_appointments
  
  has_secure_password
end
