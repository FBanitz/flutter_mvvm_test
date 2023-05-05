import 'package:flutter/material.dart';

class ButtonWidget extends ElevatedButton {
  final bool isLoading;
  final Widget? icon;
  final double iconSize;

  const ButtonWidget({
    super.key,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.clipBehavior,
    super.statesController,
    this.isLoading = false,
    this.icon,
    this.iconSize = 20.0,
    required Widget child,
  }) : super(child: child);

  @override
  State<ButtonStyleButton> createState() {
    return _ButtonWidgetState();
  }
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    MaterialStateProperty<EdgeInsetsGeometry> padding =
        MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.fromLTRB(
        widget.icon == null ? 16.0 : 8.0,
        8.0,
        widget.icon == null ? 22.0 : 8.0,
        8.0,
      ),
    );
    ButtonStyle? style = widget.style?.copyWith(padding: padding) ??
        ButtonStyle(padding: padding);
    if (widget.isLoading) {
      style = style.copyWith(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(8.0),
        ),
      );
      Widget loadingIcon = SizedBox(
        width: widget.iconSize,
        height: widget.iconSize,
        child: const CircularProgressIndicator(color: Colors.black38),
      );
      return ElevatedButton.icon(
        onPressed: null,
        onLongPress: null,
        onHover: null,
        onFocusChange: null,
        style: style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        icon: loadingIcon,
        label: widget.child!,
      );
    } else {
      Widget icon = widget.icon ?? const SizedBox.shrink();
      if (widget.icon != null) {
        icon = SizedBox(
          width: widget.iconSize,
          height: widget.iconSize,
          child: icon,
        );
      }
      return ElevatedButton.icon(
        onPressed: widget.onPressed,
        onLongPress: widget.onLongPress,
        onHover: widget.onHover,
        onFocusChange: widget.onFocusChange,
        style: style,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        icon: icon,
        label: widget.child!,
      );
    }
  }
}
