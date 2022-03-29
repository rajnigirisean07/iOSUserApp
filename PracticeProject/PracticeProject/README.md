# Practice-iOS

Before starting with this task, create a git repository for the project and add our developer 
github account as a collaborator. This allows for a better technical discussion within git 
to comment and ask questions on the codebase. 

This can be done in github repository page - Settings -> Manage Access -> Invite a collaborator,  
and invite ``nets-dev`` and ``sagarbheda`` to the repository. 

It is advised to commit the progress of the task and create a pull request with ``nets-dev`` and ``sagarbheda``
as reviewer when the task is complete. 

Please actively participate in the pull request review discussion during the review period
which will take place in the github pull request comments section. 

## Task description in order of importance:

(Please reach out if any part of the task description is unclear, we'll be happy to elaborate)

### Use:

* SwiftUI 
* URLSession

---

* Git - short commits at each stage of the project progress 
* Code comment - add code comment when necessary (Do not comment everything)
* Indentation - according to apple official guidelines/conventions 
* Naming (properties, functions, classes…) - according to apple official guidelines/conventions 

### Summary: 

The app should show list of users in rows. 
(This list is retrieved from: [https://jsonplaceholder.typicode.com/users](https://jsonplaceholder.typicode.com/users) )

Each row should show: id, name, email, city and company name.
**Note:** Do not include any other information, e.g. phone number, zipcode...

Upon selecting a row from the list,
display Name and id of the selected user on top and
the app should re-fetch the list and exclude the user on the selected row.
e.g. If a user with id = 3 is selected, exclude this user from fetch result.
Subsequently, if a user with id = 1 is selected, exclude only this user
(and not the previously selected user with id = 3)

### Task 1 : Implement a simple REST client that asynchronously fetches JSON 


Fetch a users list from source: `https://jsonplaceholder.typicode.com/users`.

Use URLSession, however, the implementation should not contain any unused code, e.g. from another project or template. 

This project contains an ``API`` with a single `fetchUsers` contract (shown below)
to **isolate** networking implementation detail, this should not be modified. 

```
// Asynchronously fetch users list and return the response in reverse order than received. 
// Upon failure, return the error through the `failure` callback.
// Use the `excludingUserWithID` to filter out an unwanted user from the list. 
//

func fetchUsers(
     excludingUserWithID: String?,
     success: (UsersList) -> Void, 
     failure: (FetchError) -> Void
)
```

* Use Swift's Decoding Custom Type to deserialize the JSON response
* After obtaining the users list, always return the list to the caller in reverse order

### Task 2 : SwiftUI implementation of given UI design

* Implement a UI using SwiftUI according to the design in the image Design.png located in the project folder. 


### Task 3 (Bonus) : Write unit tests for the units you see need testing
