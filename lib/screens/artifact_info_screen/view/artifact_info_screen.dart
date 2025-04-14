import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/util/responsive_util.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/common/widget/common_text.dart';
import 'package:neon_app_case/common/widget/network_image.dart';
import 'package:neon_app_case/screens/artifact_info_screen/controller/artifact_info_screen_binding.dart';
import 'package:neon_app_case/screens/artifact_info_screen/controller/artifact_info_screen_controller.dart';

@RoutePage()
class ArtifactInfoScreen extends CommonScreen<ArtifactInfoScreenController> {
  final int artifactId;
  final String title;
  ArtifactInfoScreen({
    super.key,
    @pathParam required this.artifactId,
    @pathParam required this.title,
  }) : super(
          padding: EdgeInsets.zero,
          appBarTitle: title,
          bindingFactory: () => ArtifactInfoScreenBinding(),
          body: (context, controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: ResponsiveUtil.value(
                        context: context,
                        s: 300,
                      ),
                      imageUrl: controller.artifact.value.imageUrl,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        controller.artifact.value.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Text(
                      controller.artifact.value.objectDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.secondary.withAlpha(26),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ArtWork Details",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 8),
                    CommonTextTitle(
                      title: "Title",
                      value: controller.artifact.value.title,
                    ),
                    const SizedBox(height: 8),

                    CommonTextTitle(
                      title: "Date",
                      value: controller.artifact.value.objectDate,
                    ),
                    const SizedBox(height: 8),

                    // Text("Geography: ${controller.artifact.value.geography}"),
                    CommonTextTitle(
                      title: "Culture",
                      value: controller.artifact.value.culture,
                    ),
                    const SizedBox(height: 8),

                    CommonTextTitle(
                      title: "Medium",
                      value: controller.artifact.value.medium,
                    ),
                    const SizedBox(height: 8),
                    CommonTextTitle(
                      title: "Dimensions",
                      value: controller.artifact.value.dimensions,
                    ),
                    const SizedBox(height: 8),

                    CommonTextTitle(
                      title: "Credit Line",
                      value: controller.artifact.value.creditLine,
                    ),
                    const SizedBox(height: 8),
                    CommonTextTitle(
                      title: "Accession Number",
                      value: controller.artifact.value.accessionNumber,
                    ),
                    // Text(
                    //     "Object Number: ${controller.artifact.value.objectNumber}"),
                  ],
                ),
              )
            ],
          ),
        );
}
