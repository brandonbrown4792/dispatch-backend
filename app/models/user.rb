class User < ApplicationRecord
  # Messages
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id

  # Appointments and Nurse / Patient relationships
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: :patient_id
  has_many :nurse_appointments, class_name: 'Appointment', foreign_key: :nurse_id
  has_many :nurses, through: :patient_appointments
  has_many :patients, through: :nurse_appointments

  # Dispatcher / Nurse relationships
  has_many :dn_relationships, class_name: 'DispatcherNurse', foreign_key: :dispatcher_id # Dispatcher has many nurse relationships
  has_one :nd_relationship, class_name: 'DispatcherNurse', foreign_key: :nurse_id # Nurse has one dispatcher relationship
  has_many :nurses, through: :dn_relationships
  has_one :dispatcher, through: :nd_relationship
  
  # Dispatcher / Patient relationships
  has_many :dp_relationships, class_name: 'DispatcherPatient', foreign_key: :dispatcher_id # Dispatcher has many patient relationships
  has_one :pd_relationship, class_name: 'DispatcherPatient', foreign_key: :patient_id # Patient has one dispatcher relationship
  has_many :patients, through: :dp_relationships
  has_one :dispatcher, through: :pd_relationship

  has_secure_password
end
