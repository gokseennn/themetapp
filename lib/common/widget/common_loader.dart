import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_app_case/common/util/responsive_util.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: ResponsiveUtil.value(
              context: context, xs: 60, s: 80, m: 100, l: 120),
          child: Lottie.asset('assets/lotties/loading.json')),
    );
  }
}
