import 'package:flutter/material.dart';

class HeartIconButton extends StatefulWidget {
  final Color? color;
  final double size;
  // Callback for when the button is liked

  const HeartIconButton({
    Key? key,
    this.color,
    this.size = 24.0,
     // Required callback
  }) : super(key: key);

  @override
  _HeartIconButtonState createState() => _HeartIconButtonState();
}

class _HeartIconButtonState extends State<HeartIconButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isLiked ? Colors.red : widget.color ?? Colors.white,
        size: 30,
      ),
    );
  }
}
