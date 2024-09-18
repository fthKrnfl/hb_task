// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:hb_task/services/model/content_model.dart';

class ContentServices {
  static Future<List<ContentModel?>> getContentMovie() async {
    List<ContentModel> returnList = [];
    String testUrl = "https://itunes.apple.com/search?term=track&media=all&limit=199";
    try {
      final response = await Dio().get(testUrl
          //"https://itunes.apple.com/search?term=all&entity=movie"
          );
      if (response.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(response.data);
        for (var item in jsonData['results']) {
          returnList.add(ContentModel.fromJson(item));
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
    print(returnList);
    return returnList;
  }

  Future<List<ContentModel?>> fetchData(String query) async {
    List<ContentModel> returnList = [];
    String testUrl = "https://itunes.apple.com/search?term=$query&limit=199";
    try {
      final response = await Dio().get(testUrl
          //"https://itunes.apple.com/search?term=all&entity=movie"
          );
      if (response.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(response.data);
        for (var item in jsonData['results']) {
          returnList.add(ContentModel.fromJson(item));
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
    print(returnList);
    return returnList;
  }
}
