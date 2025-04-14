import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/artifact_widget.dart';
import 'package:neon_app_case/router/app_router.gr.dart';
import 'package:neon_app_case/screens/home_screen/controller/home_screen_controller.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.controller});

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.categoriesList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  controller.categoriesList[index].name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                IconButton(
                  highlightColor: Theme.of(context).highlightColor,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    context.router.push(
                      CategoryDetailRoute(
                        categoryId: controller.categoriesList[index].id,
                        categoryName: controller.categoriesList[index].name,
                      ),
                    );
                  },
                  icon: Row(
                    children: [
                      Text(
                        "See all",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Image.asset(
                        "assets/icons/img_forward@3x.png",
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.artifactsList.value
                    .where((element) => element.categoryId == index + 1)
                    .length,
                itemBuilder: (context, artifactIndex) {
                  var artifact = controller.artifactsList.value
                      .where((element) => element.categoryId == index + 1)
                      .toList()[artifactIndex];
                  return ArtifactWidget(
                    artifactId: artifact.id,
                    imageUrl: artifact.image,
                    title: artifact.title,
                    artist: artifact.artist,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
