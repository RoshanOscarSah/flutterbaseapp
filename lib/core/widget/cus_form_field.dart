import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../config/color.dart';
import '../config/cus_text_style.dart';

class CusFormField extends StatefulWidget {
  final bool obscureText;
  final bool autofillEmail;
  final bool autofillPassword;
  final TextEditingController controller;
  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool isEnabled;

  const CusFormField({
    super.key,
    this.obscureText = false,
    this.autofillEmail = false,
    this.autofillPassword = false,
    required this.controller,
    required this.text,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.isEnabled = true,
  });

  @override
  State<CusFormField> createState() => _CusFormFieldState();
}

class _CusFormFieldState extends State<CusFormField> {
  bool _seePassword = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: cusTextStyle(
              size: 12,
              weight: 600,
              color: CusColor.kBlack,
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
              controller: widget.controller,
              obscureText:
                  widget.obscureText && _seePassword == false ? true : false,
              keyboardType: widget.keyboardType,
              obscuringCharacter: "*",
              autovalidateMode: AutovalidateMode.disabled,
              validator: widget.validator,
              enabled: widget.isEnabled,
              autofillHints: widget.autofillEmail == true
                  ? [AutofillHints.username]
                  : widget.autofillPassword == true
                      ? [AutofillHints.password]
                      : null,
              style:
                  cusTextStyle(size: 12, weight: 600, color: CusColor.kBlack),
              decoration: widget.obscureText
                  ? InputDecoration(
                      errorStyle: cusTextStyle(
                          size: 12, weight: 600, color: CusColor.kE100),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border: const OutlineInputBorder(),
                      hintText: widget.hintText,
                      hintStyle: cusTextStyle(
                          size: 12, weight: 600, color: CusColor.kP500),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _seePassword = _seePassword == true ? false : true;
                          });
                        },
                        child: Icon(
                          _seePassword == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: CusColor.kBlack300,
                        ),
                      ),
                    )
                  : InputDecoration(
                      errorStyle: cusTextStyle(
                          size: 12, weight: 600, color: CusColor.kE100),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border: const OutlineInputBorder(),
                      hintText: widget.hintText,
                      hintStyle: cusTextStyle(
                          size: 12, weight: 600, color: CusColor.kP500),
                    )),
        ],
      ),
    );
  }
}
