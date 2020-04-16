# Futbol
## MOD 1 2003 Project

#### Design Strategy

We started with looking at each class that we had create to look for commonalities. The commonalities could then be used to create modules or a super parent the children can inherit from. While we were looking through the code, we also searched for duplications or unneccessary variables that are not called on throughout the method or the class. Our goal was to incorporate the refactor techniques we were introduced throughout the mod for the purpose of reducing the lines in our code. For the refactor part of our project, we utilized modules and a superclass.

#### The Superclass called Collection

In our project, the main collection classes were Team_Collection, Games_Collectoin, and Game_Stats_Collection (aka as Gameteams collection). In our super class called Collection, we defined a method called create objects. This method was used to instantiate objects from the CSV files. We recognized that the create_csv method in each of our classes followed a similar layout with the only difference being the file it was instantiating. To reduce duplication throughout the classes, as well as reduce lines, we defined a create_object method in the Collection class as demonstrated below.
```
 csv_objects = CSV.read(file_path, headers: true, header_converters: :symbol)
 csv_objects.map { |row| type.new(row)}
 ```
 Why did we use a superclass instead of a module? Because the classes we created were collections and it made sense that the children classes would inherit from a parent called Collections.
 
#### The Modules

*Mathable*

This module includes common math equations that showed up throughout the project. The methods that we used in this module include a percentage and an average. Both were common calculations that appeared. A problem we did encounter was that for certain methods, the logic depended on another method and when we replaced it with the method, it caused our test to break.

*Findable*

This module includes methods used to locate other information throughout the test that is required quite often such as finding team names or using an id number to locate all the games the team played in. Within Findable, we also included methods that help locate information given a season to help reduce the code in our classes. Also the methods in the modules can be called on in the classes to faciliate another method to function in a way that returns a result we want. In short, a lot of methods in findable act as helper methods for the methods in our classes.

#### Mocks and Stubs
Unfortunately, we tried and failed to incorporate mocks and stubs into our tests. We attempted at using mocks and stubs but the return value failed to match what we tried to force it to be.

## Group Members
Melanie Tran

Jack Puchalla

Antonio Jackson

Michael Gallup
