// widgets/no_internet_overlay.dart
import 'package:binbookingapp/view/no_internet/no_internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternetOverlay extends StatelessWidget {
  final Widget child;
  const NoInternetOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final hasInternet = context.watch<InternetProvider>().hasInternet;

    return Stack(
      children: [
        child,
        if (!hasInternet)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.95),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 60, color: Colors.red),
                    const SizedBox(height: 12),
                    const Text("No Internet Connection",
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reload"),
                      onPressed: () {
                        context.read<InternetProvider>().checkConnection();
                      },
                    )
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
