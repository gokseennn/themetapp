import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiErrorDialog extends StatelessWidget {
  const ApiErrorDialog({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      //TODO refactor
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      children: [
        Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Error",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                visualDensity:
                    const VisualDensity(vertical: -4, horizontal: -4),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 18),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(message),
            ],
          ),
        ),
      ],
    );
  }
}
