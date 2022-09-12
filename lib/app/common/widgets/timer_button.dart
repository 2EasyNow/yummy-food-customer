import 'dart:async';

import 'package:flutter/material.dart';

typedef CallBack = void Function();

class TimerButton extends StatefulWidget {
  const TimerButton({
    Key? key,
    this.sameCallBack = true,
    this.time = 15,
    required this.onTap,
    this.onTimeOut,
    this.style,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.splashColor,
    this.title = 'Reject', this.widht,
  }) : assert(style != null || backgroundColor != null);

  final int time;
  final bool sameCallBack;
  final CallBack onTap;
  final CallBack? onTimeOut;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? splashColor;
  final String title;
  final int? widht;

  @override
  _TimerButtonState createState() => _TimerButtonState(time);
}

class _TimerButtonState extends State<TimerButton> {
  _TimerButtonState(this.maximumTime);

  int maximumTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (tim) {
      if (maximumTime <= 0) {
        _timer.cancel();
        if (widget.sameCallBack) {
          widget.onTap();
        } else {
          var callback = widget.onTimeOut ?? widget.onTap;
          callback();
        }
      } else {
        setState(() => maximumTime--);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: widget.style ??
          TextButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            primary: widget.splashColor ?? Colors.white,
            minimumSize: Size((widget.widht ?? double.infinity).toDouble(), 60),
          ),
      onPressed: widget.onTap,
      child: FittedBox(
        child: Row(
          children: [
            Text(
              '${maximumTime}s',
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
