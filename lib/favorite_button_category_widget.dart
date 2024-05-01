import 'package:flutter/material.dart';

import 'app_text_widget.dart';

class FavoriteButtonCategoryWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const FavoriteButtonCategoryWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 364,
        height: 108,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: AppTextWidget(
            title: title,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
