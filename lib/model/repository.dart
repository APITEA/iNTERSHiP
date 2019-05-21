
import 'application.dart';

class ApplicationRepository {

  List<Application> getApplications() {
    var app1 = Application(name: "Ab1", url: "URL");
    var app2 = Application(name: "Ab1", url: "URL");
    var app3 = Application(name: "Ab1", url: "URL");
    return [app1, app2, app3];
  }
}
