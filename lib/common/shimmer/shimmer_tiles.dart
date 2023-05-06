import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

//common shimmer list tile
class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListTile(
                title: const ShimmerText(
                  height: 16,
                  width: 50,
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const ShimmerText(
                      height: 16,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ShimmerText(
                          height: 16,
                          width: 50,
                        ),
                        ShimmerText(
                          height: 16,
                          width: 50,
                        ),
                      ],
                    )
                  ],
                ),
                leading: const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: ShimmerContainer(),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        });
  }
}

//common shimmer text widget
class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.height, this.width});
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
          width: width ?? double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.amber,
          )),
    );
  }
}

//common shimmer container widget
class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const CircleAvatar(),
    );
  }
}
