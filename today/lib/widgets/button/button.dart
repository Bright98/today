import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class Button extends StatefulWidget {
  // final width;
  final child;
  final click;
  final bool loading;
  final bool disable;

  Button({
    @required this.child,
    // this.width,
    this.click,
    this.loading = false,
    this.disable = false,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory:
              widget.disable ? NoSplash.splashFactory : InkSplash.splashFactory,
          shadowColor: Colors.transparent,
          // side: const BorderSide(
          //   width: 1.2,
          //   color: Colors.transparent,
          // ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 55,
            vertical: 12,
          ),
          primary: text.withOpacity(0.1),
          onPrimary: text,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.w500,
          ),
        ),
        child: widget.loading
            ? SizedBox(
                width: 18,
                height: 18,
                child: Center(
                  child: CircularProgressIndicator(
                    color: text,
                    strokeWidth: 1.5,
                  ),
                ),
              )
            : widget.child,
        onPressed: widget.disable
            ? () {
                return null;
              }
            : widget.click,
      ),
    );
  }
}
