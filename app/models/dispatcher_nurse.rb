class DispatcherNurse < ApplicationRecord
  belongs_to :dispatcher, class_name: 'User'
  belongs_to :nurse, class_name: 'User'
end
