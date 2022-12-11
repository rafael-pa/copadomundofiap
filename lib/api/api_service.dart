import 'dart:developer';

import 'package:copadomundofiap/api/model/matches_model.dart';
import 'package:copadomundofiap/utils/utils.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class ApiService {
  Future<List<Match>> getMatches() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.matchesEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Match> _model = matchesFromJson(response.body);
        return _model;
      }
    } catch (e) {
      showToast(e.toString());
    }
    return [];
  }
}
