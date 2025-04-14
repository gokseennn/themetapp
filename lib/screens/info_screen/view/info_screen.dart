import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neon_app_case/common/widget/common_header_image_text.dart';
import 'package:neon_app_case/common/widget/common_screen.dart';
import 'package:neon_app_case/common/widget/common_text.dart';
import 'package:neon_app_case/screens/info_screen/controller/info_screen_binding.dart';
import 'package:neon_app_case/screens/info_screen/controller/info_screen_controller.dart';

@RoutePage()
class InfoScreen extends CommonScreen<InfoScreenController> {
  InfoScreen({super.key})
      : super(
          appBarTitle: 'Info',
          padding: EdgeInsets.zero,
          bindingFactory: () => InfoScreenBinding(),
          body: (context, controller) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeaderImageText(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Location and Hours",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4)),
                        child: Image.asset(
                          'assets/images/img_info_01.png',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Met Fifth Avenue",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Hours',
                              value: "Sunday–Tuesday and Thursday: 10 am–5 pm",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Extended Hours',
                              value: "Friday and Saturday: 10 am–9 pm",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Closed',
                              value: "Wednesday",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Address',
                              value: "1000 Fifth Avenue, New York, NY, 10028",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Phone',
                              value: "212-535-7710",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(4)),
                        child: Image.asset(
                          'assets/images/img_info_02.png',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The Met Cloisters",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Hours',
                              value: "Thursday–Tuesday: 10 am–5 pm",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Closed',
                              value: "Wednesday",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Address',
                              value:
                                  "99 Margaret Corbin Drive, Fort Tryon Park, New York, NY, 10040",
                            ),
                            const SizedBox(height: 8),
                            CommonTextTitle(
                              title: 'Phone',
                              value: "212-923-3700",
                            ),
                          ],
                        ),
                      ),

                      // const Text(
                      //   'Lokasyonlar ve Çalışma Saatleri',
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // const SizedBox(height: 24),
                      // _buildLocationCard(
                      //   'The Met Fifth Avenue',
                      //   'Pazar-Salı ve Perşembe: 10:00-17:00',
                      //   'Cuma ve Cumartesi: 10:00-21:00',
                      //   'Çarşamba: Kapalı',
                      //   '1000 Fifth Avenue\nNew York, NY, 10028',
                      //   '212-535-7710',
                      //   'assets/images/img_info_01.png',
                      // ),
                      // const SizedBox(height: 24),
                      // _buildLocationCard(
                      //   'The Met Cloisters',
                      //   'Perşembe-Salı: 10:00-17:00',
                      //   'Çarşamba: Kapalı',
                      //   '',
                      //   '99 Margaret Corbin Drive\nFort Tryon Park\nNew York, NY, 10040',
                      //   '212-923-3700',
                      //   'assets/images/img_info_02.png',
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
