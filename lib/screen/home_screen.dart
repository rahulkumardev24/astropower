import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // app bar
        /// --- app bar --- ///
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: _appBar(size),
        ),
      ),
    );
  }

  /// --- app bar widget --- ///
  Widget _appBar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.menu, size: 27),
            const SizedBox(width: 8),
            Text(
              "Astropower",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(child: SizedBox(width: size.width)),

            Icon(Icons.account_balance_wallet_outlined, size: 27),
            SizedBox(width: 12),

            Icon(Icons.translate_rounded, size: 27),
            SizedBox(width: 12),
            Icon(Icons.notifications, size: 27),
          ],
        ),
      ),
    );
  }
}
