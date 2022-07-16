import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
            size: 100,
          )
        ];
      case MessageScreenStatus.LOADING:
        return [
          Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black, size: 40),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text('Caricamento...',
              style: TextStyle(
                color: Colors.black87,
              )),
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
