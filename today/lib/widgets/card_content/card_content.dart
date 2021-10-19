import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class CardContent extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;
  final animationPart;
  final bool textValue;

  CardContent({
    Key? key,
    this.title = '',
    this.value = '',
    this.unit = '',
    this.animationPart,
    this.textValue = false,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TCard(
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 28,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: text,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style: TextStyle(
                            color: text,
                            fontSize: textValue ? 20 : 28,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Shabnam',
                          ),
                        ),
                        TextSpan(
                          text: ' $unit',
                          style: TextStyle(
                            color: text,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Shabnam',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: animationPart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
