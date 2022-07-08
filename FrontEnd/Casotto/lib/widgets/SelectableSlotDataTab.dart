import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/SlotData.dart';

class SelectableSlotDataTab extends StatelessWidget {
  const SelectableSlotDataTab(
      {Key? key,
      required this.child,
      required this.isActivated,
      required this.onPressed})
      : super(key: key);

  final SlotData child;
  final bool isActivated;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: isActivated ? Colors.blue : Colors.grey),
        onPressed: onPressed,
        child: Text(
          "${child.getDataString()} - ${child.getDurataString()}",
          maxLines: 2,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
