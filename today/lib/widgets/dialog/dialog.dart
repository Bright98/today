import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:today/functions/preference.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class TDialog extends StatelessWidget {
  String title;
  var btnClick;

  TDialog({
    Key? key,
    this.title = '',
    this.btnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ),
        child: AlertDialog(
          backgroundColor: accent,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Button(
                    child: Text(
                      'باشه',
                      style: TextStyle(
                        color: text,
                        fontFamily: 'Shabnam',
                      ),
                    ),
                    click: btnClick,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
