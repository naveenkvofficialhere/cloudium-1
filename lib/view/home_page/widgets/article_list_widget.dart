import 'package:cloudium_new/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleListWidget extends GetView<HomeController> {
  const ArticleListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.date,
    required this.articleUrl,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String subtitle1;
  final String date;
  final String articleUrl;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        onTap: () => controller.launchUrlFun(articleUrl),
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              subtitle.isEmpty ? 'unknown' : subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.event,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(date),
              ],
            )
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(image),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
        ),
      ),
    );
  }
}
