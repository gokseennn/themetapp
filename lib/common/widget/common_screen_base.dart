import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:neon_app_case/base/base_controller.dart';

abstract class CommonScreenBase<T extends BaseController>
    extends StatelessWidget {
  const CommonScreenBase({
    super.key,
    required this.body,
    required this.bindingFactory,
    String? tag,
  });

  final Widget Function(BuildContext, T) body;
  final String? tag = null;
  final Binding Function()? bindingFactory;

  @override
  Widget build(BuildContext context);
}
