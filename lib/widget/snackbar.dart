import "package:flutter/material.dart";
import "package:nectar_groceries_app/all_path.dart";

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: ColorManager.green,
    ),
  );
}
