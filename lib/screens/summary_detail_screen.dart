import 'package:flutter/material.dart';

class SummaryDetailScreen extends StatelessWidget {
  final String summary;

  const SummaryDetailScreen({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            summary,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
