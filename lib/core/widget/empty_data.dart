import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/color.dart';
import '../config/constant.dart';
import '../config/cus_text_style.dart';
import '../widget/cus_button.dart';
import '../widget/image_builder.dart';
import '../widget/svg_builder.dart';

class EmptyData extends StatelessWidget {
  final String toolTip;
  final String svgUrl;
  final String imageUrl;
  final IconData icon;
  final String message;
  final String secondaryText;
  final Function()? secondaryOnTap;
  final String buttonText;
  final Function()? buttonOnTap;
  final bool failedConnectionGif;

  const EmptyData({
    super.key,
    this.toolTip = "",
    this.icon = Icons.dangerous,
    this.svgUrl = "",
    this.imageUrl = "",
    this.message = "",
    this.secondaryText = "",
    this.secondaryOnTap,
    this.buttonText = "",
    this.buttonOnTap,
    this.failedConnectionGif = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        children: [
          Center(
            child: SizedBox(
                height: 200,
                width: 355,
                child: imageUrl != ""
                    ? ImageBuilder(
                        imageUrl: imageUrl,
                        height: 400,
                      )
                    : svgUrl != ""
                        ? SvgBuilder(
                            svgUrl: svgUrl,
                            height: 400,
                          )
                        : Icon(
                            icon,
                            size: 100,
                          )),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: cusTextStyle(size: 12, weight: 600, color: CusColor.kBlack),
          ),
          SizedBox(
            height: 2.h,
          ),
          secondaryText == ""
              ? const SizedBox()
              : InkWell(
                  onTap: secondaryOnTap,
                  child: Text(
                    secondaryText,
                    style: cusTextStyle(
                        size: 12, weight: 600, color: CusColor.kY200),
                    textAlign: TextAlign.center,
                  ),
                ),
          SizedBox(
            height: 2.h,
          ),
          if (failedConnectionGif)
            ImageBuilder(
              fit: BoxFit.contain,
              imagePath: OtherAsset.kAFiNoConnection,
              width: double.infinity,
              height: 30.h,
            ),
          SizedBox(
            height: 1.5.h,
          ),
          buttonText == ""
              ? const SizedBox()
              : CusButton(
                  toolTip: toolTip,
                  text: buttonText,
                  onPressed: buttonOnTap!,
                )
        ],
      ),
    );
  }
}
