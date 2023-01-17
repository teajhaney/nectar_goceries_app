import 'package:flutter/material.dart';

import '/all_path.dart';

class ElevatedTextButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const ElevatedTextButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorManager.green,
        // foregroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 120,
          vertical: 24,
        ),
        child: Text(
          buttonText,
          style: getMediumStyle(
              color: ColorManager.white, fontSize: FontSize.fs20),
        ),
      ),
    );
  }
}
