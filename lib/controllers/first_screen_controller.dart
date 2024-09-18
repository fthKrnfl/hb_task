// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hb_task/services/service/content_service.dart';

class FirstScreenController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final ContentServices contentServis = ContentServices();
  var contentList = [].obs;
  var searchText = "".obs;
  var filterMovie = false.obs;
  var filterMusic = false.obs;
  var filterTvShow = false.obs;
  var filterBook = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getContentAllList();

    debounce(searchText, (_) {
      if (searchText.value.length >= 2) {
        fetchSearchResults(searchText.value);
      } else {
        getContentAllList();
      }
    }, time: const Duration(milliseconds: 800));
  }

  Future<void> fetchSearchResults(String query) async {
    try {
      String formattedQuery = query.replaceAll(' ', '+');
      // ignore: prefer_is_empty
      if (searchText.value.length == 0) {
        query = "all";
        formattedQuery = "all";
      }
      if (filterMovie == true.obs) {
        formattedQuery = "$query&media=movie";
      }
      if (filterMusic == true.obs) {
        formattedQuery = "$query&media=music";
      }
      if (filterTvShow == true.obs) {
        formattedQuery = "$query&media=tvShow";
      }
      if (filterBook == true.obs) {
        formattedQuery = "$query&media=ebook";
      }
      var results = await contentServis.fetchData(formattedQuery); // query ile veriyi çekiyoruz
      contentList.assignAll(results);
      isLoading = false.obs;
    } catch (e) {
      print("Hata oluştu: $e");
    }
  }

  Future<void> getContentAllList() async {
    try {
      isLoading = true.obs;
      var data = await ContentServices.getContentMovie();
      contentList.assignAll(data);
      isLoading = false.obs;
    } catch (e) {
      print("Veri alınamadı: $e");
    }
  }

  // Future<List<ContentModel?>> getContentMovieList() async {
  //   //contentList = [];
  //   await ContentServices.getContentMovie().then((value) async {
  //     contentList = value;
  //   });
  //   if (kDebugMode) print(contentList);

  //   return contentList;
  // }
}
