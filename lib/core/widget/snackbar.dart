import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/color.dart';
import '../config/text_style.dart';

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
          color: kY200,
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
              style: mdRegular(color: kBlack, fontFamily: 'changa_one'),
            ),
            Text(
              subTitle,
              style: smRegular(
                color: kBlack,
              ),
            ),
          ],
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
    closeIconColor: kBlack,
    backgroundColor: kWhite,
    shape: Border.all(width: 2, color: kBlack),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
