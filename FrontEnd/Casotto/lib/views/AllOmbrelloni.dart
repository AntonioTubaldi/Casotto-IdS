import 'package:casotto/models/Ombrellone.dart';
import 'package:flutter/material.dart';
import '../services/OmbrelloneService.dart';
import '../widgets/OmbrelloniTab.dart';
import 'MessageScreen.dart';

class AllOmbrelloniView extends StatefulWidget {
  const AllOmbrelloniView({Key? key}) : super(key: key);

  static const String routeName = "AllOmbrelloni";

  @override
  State<AllOmbrelloniView> createState() => _AllOmbrelloniViewState();
}

class _AllOmbrelloniViewState extends State<AllOmbrelloniView> {
  OmbrelloneService _ombrelloneService = new OmbrelloneService();

  List<Widget> _getOmbrelloniTabs(List<Ombrellone> ombrelloni) {
    return ombrelloni.map((Ombrellone singleOmbrellone) {
      return OmbrelloniTab(child: singleOmbrellone);
    }).toList();
  }

  Widget _getScrollableView(List<Ombrellone> ombrelloneList) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getOmbrelloniTabs(ombrelloneList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ombrellone>>(
      future: _ombrelloneService.getAllOmbrelloni(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const MessageScreen(status: MessageScreenStatus.LOADING);
          case ConnectionState.none:
            return const MessageScreen(status: MessageScreenStatus.ERROR);
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const MessageScreen(status: MessageScreenStatus.ERROR);
            } else if (snapshot.hasData) {
              List<Ombrellone> list = snapshot.data!;
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Visualizza Spiaggia'),
                ),
                body: _getScrollableView(list),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => {setState(() {})},
                  tooltip: 'Refresh',
                  child: const Icon(Icons.refresh),
                ),
              );
            }
        }

        return const MessageScreen(status: MessageScreenStatus.ERROR);
      },
    );
  }
}
