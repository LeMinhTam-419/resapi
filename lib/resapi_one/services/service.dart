import 'dart:convert';

import 'package:appmau/resapi_one/model/model.dart';
import 'package:http/http.dart' as http;
Future<List<Model>> fetchAlbum() async {
  final response =
  await http.get(Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // final jsonresponse = json.decode(response.body);
    // jsonresponse.map((model) => Model.fromJson(model)).toList();
    // return jsonresponse;
    final data = json.decode(response.body);
    List<Model> responses =
    data.map((j) => Model.fromJson(j)).toList();
    return responses;
   // return Model.fromJson(jsonDecode(response.body)[1]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}