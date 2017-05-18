# README

## Project Plan

Build rough object graph for data (Organization, Project, Task, & supporting models). Create a basic query library for Harvest data based on OAuth code from [Github](https://github.com/harvesthq/harvest_api_samples/blob/master/oauth/harvest_api_oauth_sample.rb). Fill out object graph based on actual provided data. Build routes/controller to report data. Create Dashboard & filters. Time permitting add data visualization (likely via C3-Rails gem), and user authentication/authorization.

## Assumptions
* This is a proof of concept application. User authentication/authorization will be added time permitting.
* UI is not the goal, and therefore will be kept to what is necessary to function. Bootstrap will be employed to provide basic organization.
* Harvest is the source of truth. If data has changed on Harvest, the corresponding entries should be updated to reflect the change.
* Harvest Project IDs are unique between Organizations, therefore each project can have multiple external IDs tied to each Organization.
* We do not want to store user/passwords for Harvest. Therefore access will employ OAuth tokens.
* Partner Companies will configure and provide [OAuth Client ID/Secret](https://YOURACCOUNT.harvestapp.com/oauth2_clients) to access their data. Detailed instructions will be added to the readme.
* It is possible for one staff to have multiple entries per day per project. 
* Provide near real time data. Cache queries for a reasonable time (30 minutes) to prevent multiple clients asking for the same data.
* Avoid pulling historical data whenever possible. Consider any data older than 48 hours to be historical. Provide a method to initiate a manual fetch on a data set.

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
