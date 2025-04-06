import 'package:cleanerapp/view/authentication/login/login_provider/login_provider.dart';
import 'package:cleanerapp/view/dashboard/dashboard_provider/dashboard_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/bin_request/bin_request_provider/bin_request_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/home/home_provider/home_provider.dart';
import 'package:cleanerapp/view/dashboard_screens/my_orders/my_orders_provider/myorders_providers.dart';
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
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => MyordersProviders(),
    ),
    ChangeNotifierProvider(
      lazy: false,
      create: (context) => BinRequestProvider(),
    ),
     ChangeNotifierProvider(
      lazy: false,
      create: (context) => MyordersProviders(),
    ),
  ];
}
