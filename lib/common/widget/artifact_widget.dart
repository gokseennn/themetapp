import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/network_image.dart';
import 'package:neon_app_case/main.dart';
import 'package:neon_app_case/router/app_router.gr.dart';

class ArtifactWidget extends StatelessWidget {
  const ArtifactWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.artifactId,
  });
  final String imageUrl;
  final String title;
  final String artist;
  final int artifactId;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        appRouter.push(
          ArtifactInfoRoute(
            artifactId: artifactId,
            title: title,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        width: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    artist,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
