import 'dart:async';

import 'package:cloudium_new/model/most_popular_model.dart';
import 'package:cloudium_new/service/ny_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  //variables
  RxBool isLoading = false.obs;
  RxBool isSearch = false.obs;
  var searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  MostPopularModel nyArticles = MostPopularModel();
  RxList<Result> filteredArticle = <Result>[].obs;
  Timer? articleDebounce;

  //fetch ny times most popular article function
  Future<void> fetchNyTimes() async {
    isLoading.value = true;
    var data = await NyServices.getMostPopularNyTimes();
    if (data != null) {
      nyArticles = data;
      filteredArticle.value = nyArticles.results!;
    }
    isLoading.value = false;
  }

  //function for searching article by their title
  void onsearchArticle(String query) {
    if (query.isEmpty) {
      filteredArticle.value = nyArticles.results!;
    } else {
      if (articleDebounce?.isActive ?? false) articleDebounce!.cancel();
      articleDebounce = Timer(
        const Duration(milliseconds: 500),
        () {
          filteredArticle.value = nyArticles.results!
              .where((element) => element.title
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase().toString()))
              .toList();
        },
      );
    }
  }

  //function to launch the article url
  Future<void> launchUrlFun(articleUrl) async {
    var url = Uri.parse(articleUrl);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw 'could not launch url';
    }
  }

  //initstate
  @override
  void onInit() {
    fetchNyTimes();
    super.onInit();
  }
}
