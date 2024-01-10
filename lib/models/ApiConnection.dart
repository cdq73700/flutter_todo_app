import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

const String urlBase = "http://localhost:4000/api/v1";
const String urlBasePhone = "http://10.0.2.2:4000/api/v1";

class ApiConnection {
  const ApiConnection();

  Future<Response> apiConnection(String path, String type,
      {Object? body}) async {
    Uri url;
    Response response;

    if (kIsWeb) {
      url = Uri.parse(join(urlBase, path));
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        url = Uri.parse(join(urlBasePhone, path));
      } else {
        url = Uri.parse(join(urlBase, path));
      }
    }

    switch (type) {
      case "get":
        response = await http.get(url);
        break;
      case "post":
        response = await http.post(url, body: body);
        break;
      case "put":
        response = await http.put(url, body: body);
        break;
      case "delete":
        response = await http.delete(url);
        break;
      default:
        response = Response("", 500);
        break;
    }

    return response;
  }
}
