# come-on-in-with-js

Like many other schools in the US, my daughters school started limiting access to the school after the school shooting at Stoneman Douglas High School in Florida.  This meant that before school study sessions and clubs put an extra burden on the staff and students.  The staff had to write out passes for each student coming to these sessions and then another staff member had to monitor the door and check passes.  

This web page is designed to alleviate some of the hassle associated with this new routine.  It allows teachers to log in and create study sessions that students can then log in and sign up to attend.  The staff can then see a page with all students expected early at the school on a particular day.  

A wonderful extension of this site would be if the student badges could be added to the current door locks.  This would eliminate the need for school staff to monitor the doors.  The locks could then be updated every evening to prepare for the following day.  This is why I have added a student_badge column in the students table in the database. 

This is a version of my come-on-in Rails app. The added JavaScript allows for most actions to be performed on the /study_sessions page.  The admin pages have not been updated and will not work currently due to changes made in the controller.    

For licensing information, please see License.

Ruby version - 2.3.3

To get started, fork the repository.
Run bundle install.
Migrate and seed the database.
Create .env file with your GOOGLE_KEY and GOOGLE_SECRET, if you want to allow third party sign in.
Use rails s to use on your local machine.

Contributions can be made through pull requests.
