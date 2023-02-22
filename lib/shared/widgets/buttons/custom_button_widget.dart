import 'package:flutter/material.dart';

class OurButton extends StatefulWidget {
  final bool enabled;
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final bool shrinkWrap;
  final VoidCallback? onPressed;
  final Color? color;
  final EdgeInsets? padding;
  final bool isLoading;

  const OurButton({
    Key? key,
    this.enabled = true,
    required this.text,
    this.textSize = 14,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    this.color,
    this.padding,
    this.shrinkWrap = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State createState() => _OurButtonState();
}

class _OurButtonState extends State<OurButton> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ButtonTheme(
      materialTapTargetSize:
          widget.shrinkWrap ? MaterialTapTargetSize.shrinkWrap : null,
      height: widget.shrinkWrap ? 0 : 36,
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: widget.enabled ? widget.onPressed : null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                (widget.onPressed == null)
                    ? Colors.grey
                    : widget.color ?? Colors.transparent,
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                widget.padding,
              ),
              side: MaterialStateProperty.all(BorderSide(
                color: widget.onPressed == null ? Colors.grey : primaryColor,
              ))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: widget.isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: (widget.onPressed != null)
                          ? widget.color ?? primaryColor
                          : Colors.white,
                      fontWeight: widget.fontWeight,
                      fontSize: widget.textSize,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
