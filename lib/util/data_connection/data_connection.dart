import 'dart:convert';

import 'package:flutter/services.dart';

class DataConnection {
  Future<List> loadFromJson() async {
    // load data from assets/data/forecasts.json
    final json = await rootBundle.loadString('assets/data/forecasts.json');
    return jsonDecode(json);
  }
}