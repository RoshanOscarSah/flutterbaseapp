import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/config/cus_text_style.dart';
import 'package:flutterbaseapp/core/widget/loading_animation.dart';

class CusButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool disabled;
  final String toolTip;
  final bool loading;
  final Color buttonColor;
  final Color textColor;
  final String text;
  final double height;
  final Color borderColor;

  const CusButton({
    super.key,
    required this.onPressed,
    this.buttonColor = CusColor.kY200,
    this.textColor = CusColor.kWhite,
    required this.text,
    this.disabled = false,
    this.toolTip = '',
    this.loading = false,
    this.height = 52,
    this.borderColor = CusColor.kTransparent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Tooltip(
        message: toolTip,
        child: ElevatedButton(
            onPressed: (disabled || loading) ? null : onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: borderColor,
                    width: 1,
                  )),
              backgroundColor: disabled ? CusColor.kY100 : buttonColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (loading) ...[
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: LoadingHexa(
                      color: Colors.white,
                      sizeInt: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
                Text(
                  text,
                  style: cusTextStyle(
                      color: textColor,
                      size: 18,
                      weight: 600,
                      letterSpacing: -3),
                ),
              ],
            )),
      ),
    );
  }
}
