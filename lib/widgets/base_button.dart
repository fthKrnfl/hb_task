// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final bool isPressable;
  final Function onPressedFunction;
  final TextStyle? textStyle;
  final Color? color;
  final double? minWidht;
  final bool colorChange;

  const BaseButton({
    super.key,
    required this.text,
    required this.isPressable,
    required this.onPressedFunction,
    required this.colorChange,
    this.textStyle,
    this.color,
    this.minWidht,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(isPressable);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
            backgroundColor: colorChange == true
                ? WidgetStatePropertyAll(Colors.blue[700])
                : const WidgetStatePropertyAll(Colors.grey),
          ),
          // height: 30,
          // minWidth: minWidht,
          // disabledColor: Colors.grey,
          onPressed: isPressable
              ? () async {
                  await onPressedFunction();
                }
              : null,
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                    color: colorChange == true ? Colors.white : Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
          //style: textStyle == null ? Constants.normalStyle.copyWith(color: Colors.white) : textStyle,
          // color: color == null ? ColorConstants.activeColor : color,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          ),
    );
  }
}
