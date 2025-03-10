import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => LoginProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => DashboardProvider(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeProvider(),
    ),
  ];
}
