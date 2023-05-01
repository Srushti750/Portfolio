import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> readjsondata() async {
  final String response = await rootBundle.loadString("assets/sample.json");
  final jsondata = await json.decode(response);
  throw Expando("Failed while fetching data from API");
}
