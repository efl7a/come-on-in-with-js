# come-on-in

Like many other schools in the US, my daughters school started limiting access to the school after the school shooting at Stoneman Douglas High School in Florida.  This meant that before school study sessions and clubs put an extra burden on the staff and students.  The staff had to write out passes for each student coming to these sessions and then another staff member had to monitor the door and check passes.  

This app is designed to alleviate some of the hassle associated with this new routine.  It allows teachers to log in and create study sessions that students can then log in and sign up to attend.  The staff can then see a page with all students expected early at the school on a particular day.  

A wonderful extension of this app would be if the student badges could be added to the current door locks.  This would eliminate the need for school staff to monitor the doors.  The locks could then be updated every evening to prepare for the following day.  This is why I have added a student_badge column in the students table in the database.  

For licensing information, please see License.

This is my first rails app.  The following articles helped me utilize certain gems.
Resources:
Devise - https://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
Pundit -
http://vaidehijoshi.github.io/blog/2015/09/29/using-pundit-the-cool-kid-of-authorization/
Bootstrap -
https://launchschool.com/blog/integrating-rails-and-bootstrap-part-1  (and part-2)
Background Photo -
https://www.pexels.com/photo/books-school-stacked-closed-48126/




Ruby version - 2.3.3

To get started, fork the repository.
Run bundle install.
Migrate and seed the database.
Create .env file with your GOOGLE_KEY and GOOGLE_SECRET, if you want to allow third party sign in.
Use rails s to use on your local machine.

Contributions can be made through pull requests.
