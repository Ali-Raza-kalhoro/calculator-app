import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatefulWidget {

  final String title;
  final Color color;
  final VoidCallback onpress;
  const button({super.key, required this.title, this.color=const Color(0xff00E676), required this.onpress});

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: InkWell(
        onTap: widget.onpress,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Expanded(

              child: Container(
                height: 80,

                decoration: BoxDecoration(shape: BoxShape.circle,color:widget.color),
                child: Center(child: Text(widget.title,style: TextStyle(fontSize: 20),)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

