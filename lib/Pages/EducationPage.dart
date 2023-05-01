import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  List data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readjsondata();
  }

  Future<String> readjsondata() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final jsondata = await json.decode(response);
    data = jsondata;
    throw Expando("Failed while fetching data from API");
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      itemBuilder: (context, index) => Container(
        child: Text(data[index]["items"]["id"]),
      ),
    ));
  }
}
