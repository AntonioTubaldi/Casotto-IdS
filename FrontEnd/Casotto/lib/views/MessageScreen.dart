import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum MessageScreenStatus { LOADING, ERROR }

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key, required this.status}) : super(key: key);
  final MessageScreenStatus status;

  List<Widget> _getContent() {
    switch (status) {
      case MessageScreenStatus.ERROR:
        return [
          const Text(
            "Ops! Qualcosa è andato storto!",
            style: TextStyle(fontSize: 30),
          ),
          const Icon(
            Icons.warning_amber,
            size: 150,
          )
        ];
      case MessageScreenStatus.LOADING:
        return [
          const Text(
            "Caricamento. Attendere prego.",
            style: TextStyle(fontSize: 30),
          ),
          const Icon(
            Icons.loop,
            size: 150,
          )
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getContent(),
        ),
      ),
    );
  }
}
