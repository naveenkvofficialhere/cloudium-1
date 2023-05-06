import 'package:cloudium_new/common/shimmer/shimmer_tiles.dart';
import 'package:cloudium_new/controller/homecontroller.dart';
import 'package:cloudium_new/view/home_page/widgets/article_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 71, 228, 194),
          title: Obx(() => controller.isSearch.value
              ? TextFormField(
                  onChanged: (value) =>
                      controller.onsearchArticle(value.trim()),
                  focusNode: controller.searchFocusNode,
                  controller: controller.searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                )
              : const Text("NY Times Most Popular")),
          leading: const Icon(Icons.menu),
          elevation: 5,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                controller.isSearch.value = !controller.isSearch.value;
                controller.searchFocusNode.requestFocus();
                if (controller.searchController.text.isEmpty) {
                  controller.filteredArticle.value =
                      controller.nyArticles.results!;
                }
              },
            ),
            const SizedBox(
              width: 20,
            ),
            const Icon(Icons.more_vert_outlined)
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const ShimmerTile()
              : controller.nyArticles.results == null ||
                      controller.nyArticles.results!.isEmpty
                  ? const Center(
                      child: Text('Somethig went wrong'),
                    )
                  : ListView.builder(
                      itemCount: controller.filteredArticle.length,
                      itemBuilder: (context, index) {
                        final data = controller.filteredArticle[index];
                        var image = '';
                        if (data.media != null) {
                          if (data.media!.isNotEmpty) {
                            image =
                                data.media![0].mediaMetadata![0].url.toString();
                          }
                        }

                        return ArticleListWidget(
                          articleUrl: data.url.toString(),
                          date: data.publishedDate.toString(),
                          image: image,
                          subtitle: data.byline.toString(),
                          subtitle1: '',
                          title: data.title.toString(),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
