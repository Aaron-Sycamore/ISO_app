# ISO_app
A ISO app that used APIs to find searched points of interest around your location

Objectives: Further enhance the knowledge about using storyboard to develop multiview iPhone apps using table views

Lab: During this lab, you will develop a simple table view application that represents a
list of cities you have visited. Each city should have the following information:
     a) Name of the city
     b) Picture of a city
     c) A Small description of the city.
     
Table row should have (a) and (b) above. Pre-load 5 cities while initializing the table.

Once user selects a place, app should go to the detail view.  your app allows users to add places and populate the table view.
Once a location is selected, a detail view of the location is shown with a map
annotated with its name (city name). Also, show the longitude and latitude of the
location in two textboxes. Longitude and latitude values need to be generated at
runtime using geocoding (Do not hardcode longitude and latitude values, need to
get them at runtime using the geocoder). Once the city is displayed on the map, the user will be able to search places that
the user is interested in such as “coffee”, “pizza”, and “movie” …etc. Once the user
entered the search, list of places returned from the search should be displayed on
the map with annotations that includes the name of the place


Also, you should be able to add and delete cities in your App.

Requirements:
 Your design and implementation should follow the MVC architecture.
