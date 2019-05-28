import "package:flutter/material.dart";
import "model/application.dart";
import "model/repository.dart";
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:charts_flutter/flutter.dart' as charts;

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
  var _javaFreeMemory;
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
      var javaFreeMemory = document
          .findElements("monitoringStatus")
          .first
          .findElements("javaFreeMemory")
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
        _javaFreeMemory = int.parse(javaFreeMemory);
        _javaTotalMemory = int.parse(javaTotalMemory);
        _freePhysicalMemorySize = int.parse(freePhysicalMemorySize);
        _totalPhysicalMemory = int.parse(totalPhysicalMemory);
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
        body: new Center(
          child: new CircularProgressIndicator(),
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
      body: Center(
          child: Chart.withData(createData(
              _javaTotalMemory - _javaFreeMemory, _javaTotalMemory))),
    );
  }

  List<charts.Series<SeriesData, int>> createData(int part, int total) {
    final data = [
      new SeriesData(0, part),
      new SeriesData(1, total),
      // new SeriesData(2, 25),
      // new SeriesData(3, 5),
    ];

    return [
      new charts.Series<SeriesData, int>(
        id: 'Sales',
        domainFn: (SeriesData sales, _) => sales.all,
        measureFn: (SeriesData sales, _) => sales.amount,
        data: data,
        labelAccessorFn: (SeriesData row, _) => '${row.all}: ${row.amount}',
      )
    ];
  }
}

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Chart(this.seriesList, {this.animate});

  factory Chart.withData(List<charts.Series<SeriesData, int>> data) {
    return new Chart(
      data,
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 100,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }
}

class SeriesData {
  final int all;
  final int amount;

  SeriesData(this.all, this.amount);
}
