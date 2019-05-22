import "package:flutter/material.dart";

import 'model/application.dart';
import 'model/repository.dart';

void main() {
  var applicationRepository = ApplicationRepository();

  runApp(
    MaterialApp(
      title: "Spikey",
      home: Scaffold(
          appBar: AppBar(
            title: new Center(child: new Text("Spikey", textAlign: TextAlign.center)),
            backgroundColor: Colors.green,
          ),
          body: getListView(applicationRepository)),
    ),
  );
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
      .map((app) => ListItemView(app: app));

  var listView = ListView(children: applications.toList());

  return listView;
}

class ListItemView extends StatelessWidget {
  final Application app;

  const ListItemView({this.app});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(3) ,
        leading: (Image.network(app.pic)),
        title: Text(app.name),
        subtitle: Text(app.url),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailView(app: this.app,)),
              );
            }));
  }
}

class DetailView extends StatelessWidget {

  final Application app;

  DetailView({this.app});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Center(child: new Text(app.name)),
        backgroundColor: Colors.green,
      ),
    );
  }
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
