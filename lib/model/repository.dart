
import 'application.dart';

class ApplicationRepository {

  List<Application> getApplications() {
    var app1 = Application(name: "App 1", url: "http://example1.com");
    var app2 = Application(name: "App 2", url: "http://example2.com");
    var app3 = Application(name: "App 3", url: "http://example3.com");
    return [app1, app2, app3];
  }
}
