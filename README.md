# Project 6 Team Spaghetti-Dump-Trucks

Presentation Slides: https://docs.google.com/presentation/d/1NqZ37-5_N02vDYuBEq5RXJLWtz6QajN2AU3sTW2AR48/edit?usp=sharing

This Rails project creates a web application which streamlines the collection, collation, and analysis of peer evaluations for projects in CSE 3901. Student users are able to submit scores and comments for their teammates on different projects. Administrators are able to populate their class with students stored in formatted excel files and then view the students' submitted evaluations.

## Getting Started

1. Install Rails at the command prompt if you haven't yet:

	$ gem install rails

2. Clone this repository into the desired directory:

	$ git clone https://github.com/cse3901-2020au-1730/project6-spaghetti-dump-trucks.git

3. Run installation via the bundler inside the project directory, updating if needed:

	$ bundle update --bundler

	$ bundle install --without production

4. Run database migration:

	$ rails db:migrate

5. Open the rails console:

	$ rails console

6. Create a new admin with the desired email and password:

	$ Admin.create(email: "admin@email.com", password: "password")

7. Quit rails console and start the server:

	$ rails server -b $IP -p $PORT

	or if running locally

	$ rails server

8. Access the application via browser on the local server

## Managing Your Class

In order for students to begin submitting evaluations, each group and student must be added to the database. First, log in to an admin account. Next, use one of the following methods to create groups and students.

### Manual

1. Select "Group List" from the navigation bar. Below the group table, select "New Group". Enter the desired group name and click "Submit".

2. Select "Student List" from the navigation bar. below the student table, select "New Student". Enter the student's information and assign them to a group using the dropdown.

### Excel Upload

1. Select "Admin Upload" from the navigation bar. Click "Click here" to download a sample excel file.

2. Edit the downloaded excel file, adding information for each student. Feel free to remove the example student.

3. On the Admin Upload page, click "Browse..." and select the excel file. Click "Create Upload".

## Improvements since Beta version

* Fixed broken Excel upload feature
* Improved form styling
* Added homepage with links to student/admin logins
* Implemented foreign key referencing to database schema
* Tables using Bootstrap
* Forms use dropdowns to restrict certain input
* Access denied pages
* Improved model validation
* Moving webpage background
* Various aesthetic improvements
* New tables for viewing students in groups

## Contributors
Dominic Nappi
Jake Kett
Jack Rathbun
John McLaughlin
