# Program Organization

# Major Classes
  [Class Diagram](https://github.com/monica-eisinger/Group9Project/blob/master/ClassDiagram1.pdf)

# Data Design
  [ERD Diagram of Database](https://github.com/monica-eisinger/Group9Project/blob/master/sprint1/ERD_Database.png)

# Business Rules

# User Interface Design
  [UI Sketch](https://drive.google.com/file/d/1dLmk18_WS8frqBV0CPECexv8PHUI4Gj0/view?usp=sharing)

# Resource Management

# Security
  We will not be storing user data, so we don't need to deal with membership security, but we do need to take into account buffer overflow when programming because of the symptom search bar.

# Performance
  There shouldn't be many problems with memory space since we aren't storing membership data, and we use a database to search symptoms, so we don't have to store a ton of symptoms and diseases.

# Scalability
  The searching shouldn't be an issue with future users, as long as the databases can handle a lot of traffic, which we need to look into. Since we don't store user data, we don't need to expand our servers as we get more users. 
  
# Interoperability
  Our application will share a database to search for symptoms and find diseases. (Fill in how doing it.)
  
# Internationalization/Localization
  We don't have plans at this time to internationalize our application, we think we will stick to the United States and use English as our language.
  
# Input/Output
  We need to detect that symptoms put into the symptom textfield are actually symptoms, so we will need to check that the inputs meet what a symptom would be, so no numbers, nothing other than letters really. We will use a look-ahead reading scheme for out I/O, and so we will detect I/O errors at the field.

# Error Processing

# Fault Tolerance

# Architectural Feasibility
  For our UI, we will need to make a prototype and make sure it is easily used and intuitive for the user. We will also need to make sure whichever database we use to match symptoms with diseases can handle multiple people querying it at the same time.
  
# Overengineering
  We will probably err on the side of overengineering since this is a fairly straightforward application to create.

# Build-vs-Buy Decisions

# Reuse

# Change Strategy
