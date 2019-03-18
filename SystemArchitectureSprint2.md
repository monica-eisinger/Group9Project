# Program Organization

# Major Classes
  Class Diagram

# Data Design
  ERD Diagram of Database

# Business Rules
  The assumptions that impact our program design is that we will be able to use external databases to query specialists within
  the state of Florida. Since HIPAA protects our users' personal health information, we we not be storing any of the 
  data that they input into our application.

# User Interface Design
  UI Sketch

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
