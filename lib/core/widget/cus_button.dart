import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/color.dart';
import '../config/text_style.dart';
import '../widget/loading_animation.dart';

class CusButton extends StatefulWidget {
  final String? text;
  final Function? onPressed;
  final bool disabled;
  final String toolTip;
  final bool loading;

  const CusButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.toolTip,
    this.disabled = false,
    this.loading = false,
  });

  @override
  State<CusButton> createState() => _CusButtonState();
}

class _CusButtonState extends State<CusButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: SizedBox(
        height: 50,
        child: Tooltip(
          message: widget.toolTip,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(kBlack),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                widget.disabled == true || widget.loading == true
                    ? null
                    : widget.onPressed!();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.loading == true) const LoadingProgressive(),
                  SizedBox(
                    width: 1.5.w,
                  ),
                  Text(widget.text!, style: smMedium(color: kWhite)),
                ],
              )),
        ),
      ),
    );
  }
}
