import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class MainLayoutPart extends StatelessWidget {
  final controller;
  final child;
  final bool lastPage;

  const MainLayoutPart({
    this.controller,
    this.child,
    this.lastPage = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: accent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: child,
          ),
          if (!lastPage)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: NextPageIndicator(
                controller: controller,
              ),
            ),
        ],
      ),
    );
  }
}
