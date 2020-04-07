import 'dart:convert';
import 'dart:io';

import 'package:flutter_repo/src/helpers/helper.dart';
import 'package:flutter_repo/src/models/repos.dart';
import 'package:http/http.dart' as http;


Future<Stream<Repos>> getRepos() async {
  final String url = 'https://api.github.com/search/repositories?q=flutter+language:dart&page=1&per_page=10';
  final response = await http.get(Uri.encodeFull(url), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));


  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return Repos.fromJSON(data);
  });
}
