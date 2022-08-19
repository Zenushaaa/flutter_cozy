import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/space.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  Uri url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');

  getRecommendedSpaces() async {
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
