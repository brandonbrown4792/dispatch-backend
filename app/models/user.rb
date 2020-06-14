class User < ApplicationRecord
  # Messages
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id

  # Appointments and Nurse / Patient relationships
  has_many :patient_appointments, class_name: 'Appointment', foreign_key: :patient_id, dependent: :destroy
  has_many :nurse_appointments, class_name: 'Appointment', foreign_key: :nurse_id, dependent: :destroy
  has_many :nurses, through: :patient_appointments
  has_many :patients, through: :nurse_appointments

  # Dispatcher / Nurse relationships
  has_many :dn_relationships, class_name: 'DispatcherNurse', foreign_key: :dispatcher_id # Dispatcher has many nurse relationships
  has_one :nd_relationship, class_name: 'DispatcherNurse', foreign_key: :nurse_id # Nurse has one dispatcher relationship
  has_many :dispatcher_nurses, through: :dn_relationships, source: :nurse
  has_one :nurse_dispatcher, through: :nd_relationship, source: :dispatcher
  
  # Dispatcher / Patient relationships
  has_many :dp_relationships, class_name: 'DispatcherPatient', foreign_key: :dispatcher_id # Dispatcher has many patient relationships
  has_one :pd_relationship, class_name: 'DispatcherPatient', foreign_key: :patient_id # Patient has one dispatcher relationship
  has_many :dispatcher_patients, through: :dp_relationships, source: :patient
  has_one :patient_dispatcher, through: :pd_relationship, source: :dispatcher

  has_secure_password

  def address=(address)
    get_coordinates(address)
    super
  end

  def get_coordinates(address)
    Mapbox.access_token = 'pk.eyJ1IjoiaG9vYmllNDc5MiIsImEiOiJja2JiN3duZzcwMXRlMnRvbDA4bTlkMm5vIn0.aOpsoQbBFrcHCgIsqAZEBQ'
    begin
      places = Mapbox::Geocoder.geocode_forward(address)
      self.latitude = places.first['features'].first['center'][1]
      self.longitude = places.first['features'].first['center'][0]
    rescue
    end
  end
  
  def get_user_type
    Rails.application.config.user_types[self.user_type]
  end
end
