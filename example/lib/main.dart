import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:myfirstplugin/myfirstplugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String response = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  getUUID() async {
    try {
      response = await Myfirstplugin.getCustomData('uuid');
    } on PlatformException {
      response = 'Failed to get uuid.';
    }
  }

  getVersion() async {
    try {
      response = await Myfirstplugin.getCustomData('buildVersion');
    } on PlatformException {
      response = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await getUUID();

                    setState(() {});
                  },
                  child: Text("Get UUID")),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await getVersion();
                    setState(() {});
                  },
                  child: Text("Get Version")),
              SizedBox(
                height: 10.0,
              ),
              Text(response),
            ],
          ),
        ),
      ),
    );
  }
}
