import "package:flutter/material.dart";
import "model/application.dart";
import "model/repository.dart";
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

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
                    builder: (context) => DetailViewStatefull(
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

class DetailViewStatefull extends StatefulWidget {
  final Application app;

  DetailViewStatefull({this.app});

  @override
  State<StatefulWidget> createState() {
    return new DetailViewState(app: app);
  }
}

class DetailViewState extends State<DetailViewStatefull> {
  var _activeSessions;
  var _javaMaxMemory;
  var _javaTotalMemory;
  var _freePhysicalMemorySize;
  var _totalPhysicalMemory;

  final Application app;

  DetailViewState({this.app});

  @override
  void initState() {
    http.get(app.url + "/promitea-status").then((result) {
      var xmlContent = result.body;
      var document = xml.parse(xmlContent);

      var activeSessions = document
          .findElements("monitoringStatus")
          .first
          .findElements("activeSessions")
          .first
          .text;
      var javaMaxMemory = document
          .findElements("monitoringStatus")
          .first
          .findElements("javaMaxMemory")
          .first
          .text;
      var javaTotalMemory = document
          .findElements("monitoringStatus")
          .first
          .findElements("javaTotalMemory")
          .first
          .text;
      var freePhysicalMemorySize = document
          .findElements("monitoringStatus")
          .first
          .findElements("freePhysicalMemorySize")
          .first
          .text;
      var totalPhysicalMemory = document
          .findElements("monitoringStatus")
          .first
          .findElements("totalPhysicalMemory")
          .first
          .text;
      setState(() {
        _activeSessions = activeSessions;
        _javaMaxMemory = javaMaxMemory;
        _javaTotalMemory = javaTotalMemory;
        _freePhysicalMemorySize = freePhysicalMemorySize;
        _totalPhysicalMemory = totalPhysicalMemory;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_activeSessions == null) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          app.name,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: new Text(_activeSessions),
    );
  }
}
