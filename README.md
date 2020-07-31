## Dispatch Backend
Dispatch is a nurse dispatcher application that allows for digital scheduling of appointments for patients. An integrated map provides the dispatcher easier management of appointments. The appointments are also available in a list view. Nurses may log in to view their patient appointments in a map view. Patients may log in to view their appointments.

## Motivation
A home healthcare nurse we know works as a dispatacher to assign appointments to nurses across several cities in large metro area. Her job requires her to take a list of perhaps 50 appointments with all kinds of details and assign them as home visits to nurses who live all over the region. She has to do this whole process manually using Google maps, comparing addresses of nurses with patients, etc. We set out to optimize and streamline that workflow with this app and it's interactive map-based user interface.

As we developed the project we began to realize there are many applications for this type of tool in the service industry and got excited about building the app.

## Build status
**Heroku App**  
This app has been deployed to [Heroku here](https://dispatch-app-front.herokuapp.com/). Please see the login instructions on the web application to view login information.

## Screenshots
![logo](/public/dispatch.jpg?raw=true "screenshot")

## Tech framework used
Built with:
* [React Javascript](https://reactjs.org/)
* [Ruby on Rails backed API](https://github.com/hoobie4792/dispatch-backend/)
* [Postgresql](https://www.postgresql.org/)
* [Mapbox API](https://docs.mapbox.com/mapbox-gl-js/api/)
* [Material UI](https://material-ui.com/)
* HTML / CSS

## Features
* Interactive map interface for dispatchers and patients
* Integrated list view for of appointments for dispatchers
* Dynamic filtered views (by nurse, patient, appointment reason, appointment status, date, etc) for work management for work management
* Client-side routing (React Router)
* In-app messaging between users
* bCrypt / JWT encryption for security

## How to Use
### Heroku App
This app has been deployed to [Heroku here](https://dispatch-app-front.herokuapp.com/). Please see the login instructions on the web application to view login information.

### Prerequisites
The backend install steps require the following on your system
* [Rails](https://rubyonrails.org/)
* [Postgresql](https://www.postgresql.org/)

### Install Instructions
1. Clone this repository to you local machine.
2. Once cloned, navigate to the base folder of this repository.
3. Run bundle install in the terminal to install required gems.
4. Run rails db:setup to set up the database.
5. Run rails s to start the rails server.

**Note:** The backend software must be downloaded and running as well. See the backend project [here | Dispatch-frontend](https://github.com/hoobie4792/dispatch-frontend).

