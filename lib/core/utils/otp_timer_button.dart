import 'dart:async';

import 'package:flutter/material.dart';

import "../widget/loading_animation.dart";

enum ButtonState { enableButton, loading, timer }

enum ButtonType { elevatedButton, textButton, outlinedButton }

class OtpTimerButton extends StatefulWidget {
  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button text
  final Text text;

  /// the loading indicator
  final ProgressIndicator? loadingIndicator;

  /// Length of the timer in second
  final int duration;

  /// Manual control button state [ButtonState]
  ///
  /// When controller is not null auto start timer is disabled on pressed button
  final OtpTimerButtonController? controller;

  /// Height of the button
  final double? height;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the text
  final Color? textColor;

  /// Color of the loading indicator
  final Color? loadingIndicatorColor;

  /// Button type
  /// elevatedButton, textButton, outlinedButton [ButtonType]
  final ButtonType buttonType;

  /// The radius of the button border
  final double? radius;

  const OtpTimerButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.loadingIndicator,
      required this.duration,
      this.controller,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.loadingIndicatorColor,
      this.buttonType = ButtonType.elevatedButton,
      this.radius});

  @override
  State<OtpTimerButton> createState() => _OtpTimerButtonState();
}

class _OtpTimerButtonState extends State<OtpTimerButton> {
  Timer? _timer;
  int _counter = 0;
  ButtonState _state = ButtonState.timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    widget.controller?._addListeners(_startTimer, _loading, _enableButton);
  }

  _startTimer() {
    _timer?.cancel();
    _state = ButtonState.timer;
    _counter = widget.duration;

    setState(() {});

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_counter == 0) {
          _state = ButtonState.enableButton;
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  _loading() {
    _state = ButtonState.loading;
    setState(() {});
  }

  _enableButton() {
    _state = ButtonState.enableButton;
    setState(() {});
  }

  _childBuilder() {
    switch (_state) {
      case ButtonState.enableButton:
        return widget.text;
      case ButtonState.loading:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.text,
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: widget.loadingIndicator ?? const LoadingHexa(),

            ),
          ],
        );
      case ButtonState.timer:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.text,
            const SizedBox(
              width: 10,
            ),
            Text(
              '$_counter',
              style: widget.text.style,
            ),
          ],
        );
    }
  }

  _roundedRectangleBorder() {
    if (widget.radius != null) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius!),
      );
    } else {
      return null;
    }
  }

  _onPressedButton() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    if (widget.controller == null) {
      _startTimer();
    }
  }

  _buildButton() {
    switch (widget.buttonType) {
      case ButtonType.elevatedButton:
        return ElevatedButton(
          onPressed:
              _state == ButtonState.enableButton ? _onPressedButton : null,
          child: _childBuilder(),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            textStyle: TextStyle(color: widget.textColor),
            shape: _roundedRectangleBorder(),
          ),
        );
      case ButtonType.textButton:
        return TextButton(
          onPressed:
              _state == ButtonState.enableButton ? _onPressedButton : null,
          child: _childBuilder(),
          style: TextButton.styleFrom(
            foregroundColor: widget.backgroundColor,
            shape: _roundedRectangleBorder(),
          ),
        );
      case ButtonType.outlinedButton:
        return OutlinedButton(
          onPressed:
              _state == ButtonState.enableButton ? _onPressedButton : null,
          child: _childBuilder(),
          style: OutlinedButton.styleFrom(
            foregroundColor: widget.backgroundColor,
            shape: _roundedRectangleBorder(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: _buildButton(),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class OtpTimerButtonController {
  late VoidCallback _startTimerListener;
  late VoidCallback _loadingListener;
  late VoidCallback _enableButtonListener;

  _addListeners(startTimerListener, loadingListener, enableButtonListener) {
    _startTimerListener = startTimerListener;
    _loadingListener = loadingListener;
    _enableButtonListener = enableButtonListener;
  }

  /// Notify listener to start the timer
  startTimer() {
    _startTimerListener();
  }

  /// Notify listener to show loading
  loading() {
    _loadingListener();
  }

  /// Notify listener to enable button
  enableButton() {
    _enableButtonListener();
  }
}
