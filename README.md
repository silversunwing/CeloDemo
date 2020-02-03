# CeloDemo
=======

Practical Challenge

This practical challenge is intended for candidates to demonstrate technical capabilities. Please complete as much as possible and submit your work within 3 days of receiving the request. You can submit your work by email with a zip attachment or a public repo. Our in-person interview will heavily base on the work you have done for this challenge.

Requirement Specification

Write an iOS application using Swift and UIKit that fetches users from the public REST API at https://randomuser.me/​. This REST API can return up to 5000 random generated user information. For the simplicity of this challenge the scopes are limited as follow:

● Scrollable list view display list of users
○ Each user displayed should at least the following information

■ Thumbnail

■ Title and names 

■ Gender

■ Date of birth

○ Some kind of pagination is required
○ Some kind of filter/search functionality is prefered

● Once tap on one user in the list, a detailed view should present more information about
the selected user, including a full-sized profile image.

● After the user data is fetched, local storage of the user data is essential, as this app has
to work offline.

Technical Details

The following are a few technical suggestions:

● Since the app is required to work offline, local storage (SqlLite) is prefered, and also
ORM such as CoreData

The important things we are looking for

● Good coding standard

● Maintainable application architecture

● Testing

