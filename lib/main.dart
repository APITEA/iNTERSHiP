import "package:flutter/material.dart";

import 'model/repository.dart';

void main(){

  var applicationRepository = ApplicationRepository();

  runApp(MaterialApp(
    title: "Spikey",
    home: Scaffold(
      appBar: AppBar(
          title: Text("Spikey"),
          backgroundColor: Colors.green,
      ),
      body: getListView(applicationRepository),
    ),
  ));
}



//class MyApp extends StatelessWidget {

  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //title: "Spikey App",
      //theme: ThemeData(
        //primarySwatch: Colors.green
      //),
      //home: Scaffold(
        //body: getListView(),
      //),
    //);
  //}
//}

Widget getListView(ApplicationRepository applicationRepository) {

  var applications = applicationRepository
      .getApplications()
      .map((app) =>
      ListTile(
          leading: (Image.network(app.pic)),
          title: Text(app.name),
          subtitle: Text(app.url),
          trailing: Icon(Icons.arrow_forward_ios),
      ));

  var listView = ListView(children: applications.toList());

  return listView;
}



//  //@override
//  //Widget build(BuildContext context) {
//      //floatingActionButton: FloatingActionButton(
//        //onPressed: _incrementCounter,
//        tooltip: "Increment",
//        child: Icon(Icons.add_circle),
//      ),
//    );
//  }

