import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/artifact_widget.dart';
import 'package:neon_app_case/screens/category_detail_screen/controller/category_detail_screen_controller.dart';

class CategoryDetailBody extends StatelessWidget {
  const CategoryDetailBody({super.key, required this.controller});
  final CategoryDetailScreenController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.artifactsList.value.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ArtifactWidget(
            artifactId: controller.artifactsList.value[index].id,
            imageUrl: controller.artifactsList.value[index].image,
            title: controller.artifactsList.value[index].title,
            artist: controller.artifactsList.value[index].artist,
          ),
        );
      },
    );
  }
}
