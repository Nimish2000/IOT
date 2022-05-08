import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  String status = "OFF";
   var url = Uri.parse("https://safe-reaches-93337.herokuapp.com/LED");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "IOT",
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.withOpacity(0.8),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "LED status : $status",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var response = await http.post(
                        url,
                        body: jsonEncode({"status": "1"}),
                        headers: {"content-type":"application/json"},
                      );
                      print(response.statusCode);
                      print(response.body);
                      setState(() {
                        status = "ON";
                      });
                      print("Button is pressed");
                    },
                    child: Text(
                      "ON",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var res = await http.post(
                        url,
                        body: jsonEncode({"status": "0"}),
                        headers: {"content-type":"application/json"},
                      );
                      print(res.body);
                      print(res.statusCode);
                      setState(() {
                        status = "OFF";
                      });
                    },
                    child: Text(
                      "OFF",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
