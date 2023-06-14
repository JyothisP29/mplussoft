import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mplussoft/model/mplussoft.dart';

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
        final response = await http.get(
          uri,
          // headers: headers,
        );
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          return MplusSoft.fromJson(data);
        }
      } catch (e, s) {
        log("stack trace: $s");
        rethrow;
      }
    } catch (e, s) {
      log("stack trace: $s");
      rethrow;
    }
    return null;
  }
}
