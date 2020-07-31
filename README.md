# Dispatch Backend
Dispatch is a nurse dispatcher application that allows for digital scheduling of appointments for patients. An integrated map provides the dispatcher easier management of appointments. The appointments are also available in a list view. Nurses may log in to view their patient appointments in a map view. Patients may log in to view their appointments.


## Heroku App
This app has been deployed to Heroku [here](https://dispatch-app-front.herokuapp.com/). Please see the login instructions on the web application to view login information.


## Prerequisites
The backend install steps require the following on your system
* Rails
* Postgresql


## Install Instructions
1. Clone this repository to you local machine.
2. Once cloned, navigate to the base folder of this repository.
3. Run bundle install in the terminal to install required gems.
4. Run rails db:setup to set up the database.
5. Run rails s to start the rails server.

Note: The frontend software must be downloaded and running as well to see a user interface. See the frontend project [here](https://github.com/hoobie4792/dispatch-frontend).


## Features
* Integrated map for dispatchers and patients
* Integrated list view for of appointments for dispatchers
* Appointment filtering by nurse, patient, appointment reason, appointment status, and date
* Messaging between users