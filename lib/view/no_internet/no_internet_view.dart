import 'package:binbookingapp/utils/appcolors.dart';
import 'package:binbookingapp/utils/style.dart';
import 'package:binbookingapp/view/no_internet/no_internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternetBanner extends StatefulWidget {
  final Widget? child;

  const NoInternetBanner({super.key, this.child});

  @override
  State<NoInternetBanner> createState() => _NoInternetBannerState();
}

class _NoInternetBannerState extends State<NoInternetBanner> {
  bool _wasOffline = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final provider = Provider.of<InternetProvider>(context);

    if (!provider.hasInternet && !_wasOffline) {
      _wasOffline = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:CleanerAppcolors.primaryRedcolor,
            duration: const Duration(days: 1),
            content:  Text(
              'No Internet Connection',
              style: buttonfond,
            ),
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () async {
                await provider.checkInitialConnection();
              },
            ),
          ),
        );
      });
    } else if (provider.hasInternet && _wasOffline) {
      _wasOffline = false;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            
            backgroundColor:CleanerAppcolors.primarydarkGreencolor,
            content: Text(
              'Connected to Internet',
              style: buttonfond
            ),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // If child is passed, return it — else return nothing
    return widget.child ?? const SizedBox.shrink();
  }
}
