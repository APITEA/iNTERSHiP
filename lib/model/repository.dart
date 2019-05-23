
import 'application.dart';

class ApplicationRepository {

  List<Application> getApplications() {
    var app1 = Application(name: "Promitea.com", url: "https://www.promitea.com", pic: "https://media.licdn.com/dms/image/C4E0BAQEVe25JxZbqfw/company-logo_200_200/0?e=2159024400&v=beta&t=JSSxE2iR3pp2_udcjOuWe7a-NyiWHxNO_Dt3S7PYPMo");
    var app2 = Application(name: "Demo Promitea", url: "https://demo.promitea.com", pic: "https://media.licdn.com/dms/image/C4E0BAQEVe25JxZbqfw/company-logo_200_200/0?e=2159024400&v=beta&t=JSSxE2iR3pp2_udcjOuWe7a-NyiWHxNO_Dt3S7PYPMo");
    var app3 = Application(name: "Test Promitea", url: "https://test.promitea.com", pic: "https://media.licdn.com/dms/image/C4E0BAQEVe25JxZbqfw/company-logo_200_200/0?e=2159024400&v=beta&t=JSSxE2iR3pp2_udcjOuWe7a-NyiWHxNO_Dt3S7PYPMo");
    return [app1, app2, app3];
  }
}
