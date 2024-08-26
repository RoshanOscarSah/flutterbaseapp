import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/color.dart';
import '../config/cus_text_style.dart';

void snackbarBottom(
    {required BuildContext context,
    required String title,
    required String subTitle}) {
  var snackBar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.info,
          color: CusColor.kY200,
          size: 24,
        ),
        SizedBox(
          width: 3.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: cusTextStyle(
                  size: 12,
                  weight: 600,
                  color: CusColor.kBlack,
                  fontFamily: 'changa_one'),
            ),
            Text(
              subTitle,
              style: cusTextStyle(
                size: 12,
                weight: 600,
                color: CusColor.kBlack,
              ),
            ),
          ],
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: CusColor.kBlack,
    backgroundColor: CusColor.kWhite,
    shape: Border.all(width: 2, color: CusColor.kBlack),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
