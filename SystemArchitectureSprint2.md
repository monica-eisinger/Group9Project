# Program Organization
  [High Level Sketch](https://github.com/monica-eisinger/Group9Project/blob/master/High%20Level%20Sketch.png)
  ![alt text](https://github.com/monica-eisinger/Group9Project/blob/master/High%20Level%20Sketch.png)
  
In this Model-View-Controller architecture design, the doctor database and diagnoses databases are the models.  Within the  doctor database model, the doctor name, specialty, address, phone number, and website(if available) are stored.  Within the diagnoses database, the disease name, top symptoms, and brief description are stored. These can be traced back to the following user stores and requirements:
- User Story 4: As a user, I want various diseases to be referenced in the app, so that it's more probable that I'll find a specialist.
- User Story 6: As a user, I want various options of specialists (at least 5) to look through, so that I can have a range of options to choose from
- Requirement 5: The user's symptoms must be searched from within a database.
- Requirement 8: The top-1 disease match must be used as data to search for a specialist.

In the controller part of the database, the specialist logic, it is able to receive the data retrieved from the two databases and is used to update the User View and sort based on certain properties.  The following User Stories and Requirements that are explicitly traced to this portion:
- User Story 2: As a user, I want the 200 most common symptoms to be organized by body region so that I can check mine off for searching.
- User Story 5: As a user, I want to find a specialist for my illness, so that I can seek treatment.
- User Story 9: As a user, I want those listed specialists to be ordered by rating, so that I can find the most appropriate specialist for me.
- User Story 13: As a user, I want the doctor's website to open externally in my phone's web browser and not within the app.
- Requirement 3: 200 of the most common symptoms must be check box options for the symptoms.
- Requirement 4: The symptoms must be organized by body region.
- Requirement 5: The user's symptoms must be searched from within a database.
- Requirement 7: The returned disease matches must show a percentage match for the user's symptoms.
- Requirement 11: The 5 specialized doctors returned from the search default to being listed by distance.
- Requirement 19: A user's personal information will only be kept temporarily as variables and not stored inside the app.

In the view portion of the system architecture, the User view will able to list all these possible diseases with the corresponding specialists and have the user look at it and select which one they want based on certain factors. The requirements and user stories that are traced to this portion of the architecture are:
- User Story 3: As a user, I want a table to appear with up to 5 potential diagnoses after I click my symptoms, so I can see which illnesses I match to.
- User Story 6: As a user, I want various options of specialists (at least 5) to look through, so that I can have a range of options to choose from
- User Story 7: As a user, I want that specialist to be 5, 10, or 15 miles, so that I can meet with them face-to-face.
- User Story 8: As a user, I want to be able to see the address of the specialist, so that I know where I have to go to visit them
- User Story 9: As a user, I want those listed specialists to be ordered by rating, so that I can find the most appropriate specialist for me.
- User Story 10: As a user, I'd like to be able to see the ratings left by other patients within the same app
- User Story 17: As a user, I want to be able to return to the previous page, so that I can choose a different option if I need to.
- Requirement 7: The returned disease matches must show a percentage match for the user's symptoms.
- Requirement 8: The top-1 disease match must be used as data to search for a specialist.
- Requirement 9: The user must be able to specifiy a distance to search for specialists, choosing between 5, 10, or 15 miles
- Requirement 10: The user is returned up to 5 specialized doctors for their most probable disease.
- Requirement 11: The 5 specialized doctors returned from the search default to being listed by distance.
- The user will be able the view the specialiasts by rating and view the actual google ratings from the app.  They will also be able to the view and access the website and phone number of the doctors. (Requirements 12, 13, 14, 15, 16)
- Requirement 20: There should be a back button on each page to access the previous page.


# Major Classes
 [Class Diagram](https://github.com/monica-eisinger/Group9Project/blob/master/ClassDiagram2.pdf)
 
 UserInterface Class: Handles all the things that involve displaying information to the user and gathering user input. Hitting buttons, scrolling through lists, and displaying results to the user's screen. (Req: 2, 15, 16, 17, 20, 23)
 
 -Enter symptoms by checking boxes is done through the enterSymptoms() routine in this class, allowing the user to check and uncheck boxes to select what symptoms they are experiencing. (2)
 
 -Viewing the doctor's website is done through viewWebsite(), taking the string of the doctor's website and opening it with the Safari app, bringing them to the doctor's website. (15,17)
 
 -Calling the doctor is done through callDoctor(), taking the number of the doctor and opening it with the phone's phone app, allowing the user to call the doctor. (16/18)
 
 -Back button on each page done through the goBack() function, taking the user back to the previous page they were on. (20)
 
 -Displaying a meme on the homepage done through displayMeme(), cycling through a number of predetermined memes upon interaction with the meme. (23)
 
 FindSymptoms: The logic that takes the user's input and interprets the symptoms that the user put in to get a diagnosis. This class uses the symptoms database to help carry out the logic. (Req: 3, 4, 5, 6, 7, 21)
 
 -The Symptoms Database will contain 200 of the most common symptoms, sorted by body region. This class uses the database for dipslaying the different symptoms to the user, in sorted order by body region. (3,4,5)
 
 -The determineDisease() will determine 5 different disease matches based on what the user has entered, these diseases will be sorted by percentage match for their most probable diseases, allowing the user to see what their diagnosis is. (6,7)
 
 -The symptomsList array will allow for users to make changes to the array and will persist between pages so the user can edit which symptoms they entered. (21)
 
 FindSpecialists: The logic that takes the distance and specializations of different doctors and the symptoms that the user entered in order to create a set of specialists that the user can call or view their website. (8, 9, 10, 11)
 
 -The number 1 percent match will be passed from the findSymptoms class in order to determine specializations, such that the most relevant disease that the user entered is used to determine which specialists they need. (8)
 
 -The user will be able to specify a distanceRange as a choice between ranges of 0-5, 0-10 or 0-15 miles so that the user can determine for themselves how far they are willing to go and what options are available to them based on their chosen range. (9)
 
 -Using the most probable disease and matching it to doctors that specialize in treating that disease while taking into account the distance from the user, the class will determine the specialists available to the user given all of the parameters they entered, and they will be sorted by distance. (10,11)

SpecialistList: A class that holds a specialist and all of the relevant information that we need from them like their name, office address, website, phone number, and distance from the user. (Req: 10) The user needs to be returned the information that is contained in this class so that they can see up to 5 specialized doctors for their most probable disease. 

GPS Service: Determines the location of the user so we can get distance values of how far the user is from the doctors that they are looking for. (Req: 9) The user must be able to specify a distance to search for specialists. This class allows the app to determine where the user is so that we can find doctors only in a range unique to the user and their specific location. 
 

# Data Design
  [ERD Diagram of Database](https://github.com/monica-eisinger/Group9Project/blob/master/ERD%20Diagram%20of%20Database%20(1).png)
  
  The main databases that will be implemented in this project are a Diagnosis Database, that has the name of the disease, common symptoms, and a short description of the disease, and a Physician Database that has the name of the doctor, address, specialty, phone number, and email address, and website. The diagram showcases how the Diagnoses/Disease Database is used/treated by the Physician Database.

# Business Rules
  The assumptions that impact our program design is that we will be able to use external databases to query specialists within
  the state of Florida. Since HIPAA protects our users' personal health information, we we not be storing any of the 
  data that they input into our application.

# User Interface Design
 [UI Sketch](https://github.com/monica-eisinger/Group9Project/blob/master/SickoSearch_UI.png)
 
 Initial Screen: Displays the title of the app, the button that begins the search, and a nice funny gif or meme to cheer up the sick person using the app. (Req: 23,24) There must be a "begin search" button on the first page so that the user knows when their search begins, the button brings the user to the next page where they can enter their symptoms and begin their search. (23) There is a spot for an image to go on the screen, where we can put the meme/gif to cheer up the user. 
 
 Symptoms Screen: Sorts the 200 most common symptoms (3) by body part (4) with check boxes next to each symptom that the user can toggle between checked and unchecked (2) . By default, all are checked. If the user navigates to the next page, they can come back and edit their symptoms and what they had previously will not disappear. (21)
 
 Diagnoses Screen: Displays the top 5 most relevant diseases based on the symptoms the user entered on the previous screen. The disease name, the percent match and a brief description of each disease will be shown on the screen. The top percent matching disease will be used to determine what specialists will be considered. The search of the user's symptoms must return 5 disease matches (6), it is displayed on this screen in order sorted by percentage match (7) so that the user can use the top result to search for a specialist (8). The top result is the one that is used in finding specialists in the next screens. 
 
 Distance Screen: Displays a drop-down menu of 3 different choices for distance range, 5 miles, 10 miles and 15 miles. (Req 9) This value will be used to determine how far away the app will look for specialists.
 
 Results Screen: Displays up to 5 matching doctors, sorted by closest distance to the user. (Req 10/11: the user is returned up to 5 doctors listed by distance) On this screen each of the doctors will have their name, how far away the user is, the doctor's phone number and their website. Tapping on the phone number will open the phone application and dial the number into the phone. (Req 16/18: the user can accesss the doctor's office's phone number through the app) Tapping on the website will open a link to the website within the Safari application. (Req 15/17: the user can accesss the doctor's website through the app.)
 
 Connections: Each page has a back/continue button to navigate between each page in sequential order. (Req 20: There should be a back button on each page to access the previous page) The last screen lacks a continue button since it is the last screen. 
 

# Resource Management
  Resource management will not be an issue for us, as we won't be storing any of the user's data, and thus will not require databases and servers to store this information. We will be using an externally provided database of doctors within the state of Florida, so storing this information will also be a non-issue. Our application will run on the user's iPhone device and will not require purchasing any additional hardware or software. To develop this software, we will not require any additional hardware or software during the stages of development.

# Security
  We will not be storing user data, so we don't need to deal with membership security, but we do need to take into account buffer overflow when programming because of the symptom search bar. We will ensure that all data will be flushed when the application is closed, although by not storing data this should not be a concern.

# Performance
  There shouldn't be many problems with memory space since we aren't storing membership data, and we use a database to search symptoms, so we don't have to store the symptoms and diseases we'll have listed within the application.

# Scalability
  The searching shouldn't be an issue with future users as long as the external databases we're using can the traffic. Since we don't store user data, we don't need to expand our servers as we get more users. 
  
# Interoperability
  Our application will share a database to search for symptoms and find diseases. The database is an external .xml file that we will access and reference as needed.
  
# Internationalization/Localization
  We don't have plans at this time to internationalize our application. Our specialist search will mostly be within Florida in the United States and English will be the only language we'll be displaying on the application.
  
# Input/Output
  To prevent symptom input errors from users we are displaying them as check boxes that the user can enter. The other input that the user will be entering is a distance to search from within, which will be chosen by clicking a link within the application. Therefore, erroneous user input should be a non-issue. Output will be verified through vigorous test procedures.

# Error Processing
  We have no definitive plans for error processing at this time.

# Fault Tolerance
  Since we will not be storing data, using our own servers, or using out own databases, fault tolerance is minimized internally. But, since we're using external sources of data, we may consider backing the databases up in the future, although there may be a copywright on the data. This is to be determined in the future. As part of our testing procedure we will be making sure that the databases we're using can handle multiple people querying them at the same time.
  
# Architectural Feasibility
  For our User Interface, a simple linear flow of pages will be the use progression within the application. Because of this, the architectural feasibility should be relatively simple, as there won't be any complicated connections between user interfaces.
  
# Overengineering
  Overengineering should not be an issue because our design has a linear page progression flow for the user, and thus doesn't allow for much usability to be over-engineered.
  
# Build-vs-Buy Decisions
  Our decision to purchase access to an external database was due to information constraints, as we don't have access to contact information of specialists within the state of Florida, but can purchase this access through an external database. We're building everything else within this application, and the only time and access constraint we had was in regards to the doctor database.

# Reuse
  We believe parts of the application will be reusable within the future, such as the separate user interfaces, the ability to query a database, and the ability to connect with and display information with other applications within the user's iPhone device. 

# Change Strategy
  To facilitate simple change we are building the application following the Agile methodology, where we are building working iterations of the software first and then refactoring it to be as simple and easy to follow as possibile. We're modularizing the software as much as possibile to facilitate easy change, with minimal data coupling.
