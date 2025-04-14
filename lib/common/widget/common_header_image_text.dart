import 'package:flutter/material.dart';
import 'package:neon_app_case/common/util/responsive_util.dart';

class CommonHeaderImageText extends StatelessWidget {
  const CommonHeaderImageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/img_collection_01@3x.png',
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 60,
          left: 20,
          child: SizedBox(
            width: ResponsiveUtil.value(
              context: context,
              xs: 275,
              s: 300,
              m: 350,
              l: 400,
            ),
            child: Text(
              "Travel around the world and across 5000 years of history through 490,000+works of art.",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveUtil.value(
                      context: context,
                      xs: 30,
                      s: 28,
                      m: 26,
                      l: 24,
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
