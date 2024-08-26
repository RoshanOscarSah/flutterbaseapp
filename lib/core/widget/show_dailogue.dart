import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/config/cus_text_style.dart';
import 'package:flutterbaseapp/core/widget/cus_button.dart';
import 'package:flutterbaseapp/core/widget/svg_builder.dart';

class ShowDailogue extends StatelessWidget {
  final String svgIcon;
  final String title;
  final Color svgColor;
  final String primaryText;
  final Function primaryTap;
  final String secondaryText;
  final Function secondaryTap;
  const ShowDailogue({
    super.key,
    required this.svgIcon,
    required this.title,
    this.svgColor = CusColor.kP100,
    required this.primaryText,
    required this.primaryTap,
    required this.secondaryText,
    required this.secondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                SvgBuilder(
                  svgPath: svgIcon,
                  color: svgColor,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: cusTextStyle(
                          color: CusColor.kP700, size: 16, weight: 600),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 44,
                  width: 107,
                  child: CusButton(
                    onPressed: () {
                      primaryTap();
                    },
                    text: primaryText,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 44,
                  width: 103,
                  child: CusButton(
                    onPressed: () {
                      secondaryTap();
                    },
                    borderColor: CusColor.kP100,
                    buttonColor: CusColor.kWhite,
                    textColor: CusColor.kP100,
                    text: secondaryText,
                  ),
                )

                /*    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CusColor.kPiP,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () => _logout(context),
                  child: Text(
                    'Yes',
                    style: cusTextStyle(
                        color: CusColor.kWhite, size: 16, weight: 700),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: CusColor.kPiP,
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: CusColor.kPiP),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () => _cancel(context),
                  child: Text(
                    'No',
                    style: cusTextStyle(
                        color: CusColor.kPiP, size: 16, weight: 700),
                  ),
                ), */
              ],
            ),
          ]),
        ));
  }
}
