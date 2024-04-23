import 'package:flutter/material.dart';

class HeartIconButton extends StatefulWidget {
  final Color? color;
  final double size;
  
   const HeartIconButton({
    Key? key,
    this.color,
    this.size = 24.0,
    
  }) : super(key: key);

  @override
  _HeartIconButtonState createState() => _HeartIconButtonState();
}

class _HeartIconButtonState extends State<HeartIconButton> {
  bool isLiked = false;
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: IconButton(
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
      ),
    );
  }
}
