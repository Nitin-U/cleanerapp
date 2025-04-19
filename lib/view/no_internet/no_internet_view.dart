import 'package:binbookingapp/view/no_internet/no_internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternetBanner extends StatefulWidget {
  const NoInternetBanner({super.key});

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

      // Show "No Internet" Snackbar
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            duration: const Duration(days: 1), // persistent until internet is back
            content: const Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.white),
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
    }

    // Internet is back after being offline
    else if (provider.hasInternet && _wasOffline) {
      _wasOffline = false;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // Show "Connected" Snackbar for 2 seconds
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Connected to Internet',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // No UI needed, just logic
  }
}
