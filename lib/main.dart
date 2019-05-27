import "package:flutter/material.dart";
import "model/application.dart";
import "model/repository.dart";

void main() {
  var applicationRepository = ApplicationRepository();

  runApp(
    MaterialApp(
      title: "Spikey",
      home: Scaffold(
          drawer: Drawer(
            // suplik pro predmety
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text("Hlavicka"),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                ListTile(
                  title: Text("Item 1"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  title: Text("Item 2"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("Spikey"),
            textTheme: TextTheme(
                title: TextStyle(fontSize: 36, fontStyle: FontStyle.normal)),
            centerTitle: true,
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
        contentPadding: EdgeInsets.all(5),
        leading: (Image.network(app.pic)),
        title: Text(app.name,
            style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2)),
        subtitle: Text(app.url),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            splashColor: Colors.green, // barva při stisknutí
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailView(
                          app: this.app,
                        )),
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
        title: Text(
          app.name,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
