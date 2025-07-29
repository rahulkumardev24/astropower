import 'package:flutter/material.dart';

class MurtiDetailsScreen extends StatefulWidget {
  final String imagePath ;
  const MurtiDetailsScreen({super.key , required this.imagePath });

  @override
  State<MurtiDetailsScreen> createState() => _MurtiDetailsScreenState();
}

class _MurtiDetailsScreenState extends State<MurtiDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: AppBar(
        title: Text("Product details"),
      ),
    );
  }
}
