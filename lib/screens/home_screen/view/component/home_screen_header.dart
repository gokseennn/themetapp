import 'package:flutter/material.dart';
import 'package:neon_app_case/common/util/responsive_util.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "THE\nMET",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 38,
            fontWeight: FontWeight.w500,
            height: 0.9,
            letterSpacing: -4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/img_home_01@3x.png",
              ),
              Positioned(
                bottom: 40,
                left: 20,
                child: Column(
                  children: [
                    SizedBox(
                      width: ResponsiveUtil.value(
                        context: context,
                        xs: 200,
                        s: 250,
                        m: 300,
                        l: 350,
                      ),
                      child: Text(
                        "Welcome to The Met",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                          fontSize: ResponsiveUtil.value(
                            context: context,
                            xs: 28,
                            s: 38,
                            m: 48,
                            l: 58,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveUtil.value(
                              context: context,
                              xs: 8,
                              s: 28,
                              m: 50,
                              l: 50,
                            ),
                          ),
                          child: Text(
                            "Explore Collection",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
