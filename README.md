iNTERSHiP
======

## Guidelines

* [Day 1](#day-1)
* [Day 2](#day-2)

## Day 1

Keywords: [Version Control](https://en.wikipedia.org/wiki/Version_control), [Git](https://en.wikipedia.org/wiki/Git), [GitHub](https://github.com/), [Flutter](https://flutter.dev/), [Android Studio](https://developer.android.com/studio)

### Git & Github

Git is a distributed version-control system for tracking changes in source code during software development. It is designed for coordinating work among programmers, but it can be used to track changes in any set of files. Its goals include speed, data integrity, and support for distributed, non-linear workflows.

GitHub is a project management and code versioning system as well as a social network platform made for developers. But what is GitHub used for? Well, amongst all, it allows you to work collaboratively with other people around the world, plan your projects and track your work.

[![](http://img.youtube.com/vi/w3jLJU7DT5E/0.jpg)](http://www.youtube.com/watch?v=w3jLJU7DT5E "")
[![](http://img.youtube.com/vi/noZnOSpcjYY/0.jpg)](http://www.youtube.com/watch?v=noZnOSpcjYY "")
[![](http://img.youtube.com/vi/SWYqp7iY_Tc/0.jpg)](http://www.youtube.com/watch?v=SWYqp7iY_Tc "")

### Flutter

Flutter is Google’s portable UI toolkit for building beautiful, native applications for mobile, web, and desktop from a single codebase.

[![](http://img.youtube.com/vi/fq4N0hgOWzU/0.jpg)](http://www.youtube.com/watch?v=fq4N0hgOWzU "")

### Android Studio

Android Studio provides the fastest tools for building apps on every type of Android device.

[![](http://img.youtube.com/vi/W1pNjxmNHNQ/0.jpg)](http://www.youtube.com/watch?v=W1pNjxmNHNQ "")

### TODO

#### Install Flutter SDK & Android Studio

1. https://flutter.dev/docs/get-started/install
1. https://developer.android.com/studio

#### Create Flutter App

1. Create Flutter App in Adroid Studio
1. Commit created App into GitHub
1. `Collaborate` via GitHub

## Day 2

Keywords: Application Prototype, [Data modeling](https://en.wikipedia.org/wiki/Data_modeling), [Repository Pattern](https://medium.com/@krzychukosobudzki/repository-design-pattern-bc490b256006), [Flutter ListView](https://www.youtube.com/watch?v=Lf9DwdVbBuM)

### Application Prototype

<img src="https://raw.githubusercontent.com/APITEA/iNTERSHiP/master/D062FB13-BF80-4E0F-8DB7-449C7EFFE012.jpeg" width="250">

### Data Modeling

Data modeling in software engineering is the process of creating a data model for an information system by applying certain formal techniques.

```dart
class Application {
  
  final String name;
  final String url;

  Application({@required this.name, @required this.url});
}
```

```dart
class ApplicationRepository {

  List<Application> getApplications() {
    
    //TODO
    
  }
}
```

### Flutter ListView

A scrollable list of widgets arranged linearly.

ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.

![](http://img.youtube.com/vi/Lf9DwdVbBuM/0.jpg)](http://www.youtube.com/watch?v=Lf9DwdVbBuM =250x)

### TODO

1. Add data model
1. Add data repository
1. Add ListView

## Day 3

Keywords: [Flutter Navigation](https://flutter.dev/docs/cookbook/navigation/navigation-basics)

### TODO

1. Add navigation to detail page and back
