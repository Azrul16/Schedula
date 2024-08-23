import 'package:flutter/material.dart';

class TotalClassScreen extends StatefulWidget {
  const TotalClassScreen({super.key});

  @override
  State<TotalClassScreen> createState() => _TotalClassScreenState();
}

class _TotalClassScreenState extends State<TotalClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total class list'),
      ),
    );
  }
}
