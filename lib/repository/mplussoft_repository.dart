import 'dart:convert';
import 'dart:developer';

import 'package:mplussoft/model/mplussoft.dart';
import 'package:http/http.dart' as http;

import '../helper/api_endpoints.dart';

class MplusRepository {
  Future<MplusSoft?> detailsRepository() async {
    const path = ApiEndPoints.baseUrl;

    Uri uri = Uri.parse(path);
    try {
      Map<String, String> headers = {
        "Content-Type": 'application/json',
      };
      try {
        final response = await http.post(
          uri,
          headers: headers,
        );
        // print(map);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          // print(response.body);
          if (data['statusCode'] == 200) {
            // print(response.body);
            return MplusSoft.fromJson(data);
          }
        }
      } catch (e, s) {
        log("stack trace: $s");
        rethrow;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
