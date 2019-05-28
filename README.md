iNTERSHiP
======

## Guidelines

* [Day 1](#day-1)
* [Day 2](#day-2)
* [Day 3](#day-3)
* [Day 4](#day-4)
* [Day 5](#day-5)
* [Day 6](#day-6)
* [Day 7](#day-7)
* [Day 8](#day-8)
* [Day 9](#day-9)
* [Day 10](#day-10)

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

[![](http://img.youtube.com/vi/Lf9DwdVbBuM/0.jpg)](http://www.youtube.com/watch?v=Lf9DwdVbBuM "")

### TODO

1. Add data model
1. Add data repository
1. Add ListView

## Day 3

Keywords: [Master Detail](https://en.wikipedia.org/wiki/Master–detail_interface), [Flutter Navigation](https://flutter.dev/docs/cookbook/navigation/), [Multi Screen](https://medium.com/flutter-community/developing-for-multiple-screen-sizes-and-orientations-in-flutter-fragments-in-flutter-a4c51b849434)

### Master Detail

In computer user interface design, a master–detail interface displays a master list and the details for the currently selected item.

### Flutter Navigation

Most apps contain several screens for displaying different types of information. For example, an app might have a screen that displays products. Users can then tap the image of a product to get more detailed information on a new screen.

[![](http://img.youtube.com/vi/nP2KEFnj7Ag/0.jpg)](http://www.youtube.com/watch?v=nP2KEFnj7Ag "")

### Multi Screen

Mobile applications need to support a wide range of device sizes, pixel densities and orientations. Apps need to be able to scale well, handle orientation changes and persist data through all these. Flutter gives you the capability to choose the way to tackle these challenges instead of only giving one particular solution.

<a href="https://d33wubrfki0l68.cloudfront.net/a420eb846b7feedd2cdf446451cfd70439a4b964/14a2d/images/implementing-master-detail-flow/end-result.gif"><img src="https://d33wubrfki0l68.cloudfront.net/a420eb846b7feedd2cdf446451cfd70439a4b964/14a2d/images/implementing-master-detail-flow/end-result.gif" width="250"></a>


### TODO

1. Add `imageURL` to `Application` model and use it for display in `ListView`
1. Add navigation to detail page and back
1. Design `ListView` and `DetailView` as in:

<img src="https://raw.githubusercontent.com/APITEA/iNTERSHiP/master/master-detail.png" width="600">

## Day 4

Keywords: [Continuous integration](https://flutter.dev/docs/cookbook/navigation/), [Testing Flutter Apps](https://flutter.dev/docs/testing)

### Continuous integration

Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early. 

By integrating regularly, you can detect errors quickly, and locate them more easily.

[![](http://img.youtube.com/vi/b2l4zTS8lPg/0.jpg)](http://www.youtube.com/watch?v=b2l4zTS8lPg "")

### Testing Flutter Apps

The more features your app has, the harder it is to test manually. Automated tests help ensure that your app performs correctly before you publish it, while retaining your feature and bug fix velocity.

Automated testing falls into a few categories:

* A **unit test** tests a single function, method, or class.
* A **widget test** (in other UI frameworks referred to as component test) tests a single widget.
* An **integration test** tests a complete app or a large part of an app.

[An introduction to widget testing](https://flutter.dev/docs/cookbook/testing/widget/introduction)

### TODO

1. Add real Application data
1. Create Widget test for `ListView` and `DetailView`
1. Testing Continuous integration - `fail` -> `fix` 
 * [![CircleCI](https://circleci.com/gh/APITEA/iNTERSHiP.svg?style=svg)](https://circleci.com/gh/APITEA/iNTERSHiP) 
 * [Setup CI/CD Pipeline for your Flutter App using CircleCI](https://medium.com/flutter-community/setup-ci-cd-pipeline-for-your-flutter-app-using-circleci-ef07e39982ab)

#### Data
```
name: Promitea.com
url: https://www.promitea.com
```

```
name: Demo Promitea
url: https://demo.promitea.com
```

```
name: Test Promitea
url: https://test.promitea.com
```

## Day 5

Keywords: [Continuous delivery](https://flutter.dev/docs/cookbook/navigation/)

### Continuous Delivery

Continuous Delivery can help large organizations become as lean, agile and innovative as startups. Through reliable, low-risk releases, Continuous Delivery makes it possible to continuously adapt software in line with user feedback, shifts in the market and changes to business strategy. Test, support, development and operations work together as one delivery team to automate and streamline the build-test-release process.

[![](http://img.youtube.com/vi/HnWuIjUw_Q8/0.jpg)](http://www.youtube.com/watch?v=HnWuIjUw_Q8 "")

The `spikey.apk` is continuous delivered to [GitHub Releases](https://github.com/APITEA/iNTERSHiP/releases/tag/master).

### TODO

1. Try to app on real device
    * [spikey.apk](https://github.com/APITEA/iNTERSHiP/releases/download/master/spikey.apk)
1. Improve application

## Day 6

### Dart XML

Dart XML is a lightweight library for parsing, traversing, querying, transforming and building XML documents. [[pub.dev]](https://pub.dev/packages/xml)

### TODO 

#### DetailView

1. Fix Internet Connection
1. Parse `promitea-status` by `Dart XML`
    * `https://test.promitea.com/promitea-status`
1. Get JAVA Memory data:
    * `javaFreeMemory` vs `javaTotalMemory`
1. Get Physical Memory data:
    * `freePhysicalMemorySize` vs `totalPhysicalMemory`
1. Get Users data:
    * `activeSessions`
1. Add pull-to-refresh to refresh graphs

## Day 7 

### modern_charts

A package for creating simple yet modern looking charts. [[pub.dev]](https://pub.dev/packages/modern_charts/)

### TODO 

#### DetailView

1. Add Gauge Graphs with Memory data
1. Add Gauge Graphs with Disk data
1. Add Number with Users data

## Day 8

### Pull-to-refresh

Pull-to-refresh is a touchscreen gesture that consists of touching the screen of a computing device with a finger or pressing a button on a pointing device, dragging the screen downward with the finger or pointing device, and then releasing it, as a signal to the application to refresh the contents of the screen.

[![](http://img.youtube.com/vi/5n8xP4ukzlM/0.jpg)](http://www.youtube.com/watch?v=5n8xP4ukzlM "")

### TODO

#### Application

1. Add custom icon as icon of the Spikey Application

#### DetailView

1. Add pull-to-refresh to refresh graphs

