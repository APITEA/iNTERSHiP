
import 'application.dart';

class ApplicationRepository {

  List<Application> getApplications() {
    var app1 = Application(name: "App 1", url: "http://example1.com", pic: "https://www.i60.cz/images/pes1-2-1.jpg");
    var app2 = Application(name: "App 2", url: "http://example2.com", pic: "https://www.zoohit.cz/magazin/CACHE_IMAGES/768/wp-content/uploads/2018/11/kocka-tigrovan%C3%A1.jpg");
    var app3 = Application(name: "App 3", url: "http://example3.com", pic: "https://img.blesk.cz/img/1/normal620/5064713-img-kun-v0.jpg?v=0");
    return [app1, app2, app3];
  }
}
