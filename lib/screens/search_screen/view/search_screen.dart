import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/artifact_widget.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/screens/search_screen/controller/search_screen_binding.dart';
import 'package:neon_app_case/screens/search_screen/controller/search_screen_controller.dart';

@RoutePage()
class SearchScreen extends CommonScreen<SearchScreenController> {
  final String query;
  SearchScreen({
    super.key,
    @pathParam required this.query,
  }) : super(
          appBarTitle: "Search The Collections",
          bindingFactory: () => SearchScreenBinding(),
          body: (context, controller) => Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: controller.artifactList.value.length,
                  itemBuilder: (context, index) {
                    var item = controller.artifactList.value[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ArtifactWidget(
                        artifactId: item.objectId,
                        imageUrl: item.imageUrl,
                        title: item.title,
                        artist: item.culture,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
}
