class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate, only: [:index]
end
