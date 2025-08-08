// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kryptowallet/shared_utils/extension.dart';

class HoveringContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color? entry_color;
  final Color? exit_color;
  final Border? border;
  final BorderRadius? borderRadius;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final double? fontSize;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback? onTap;
  // final Gradient? gradient;
  // final DecorationImage? image;

  const HoveringContainer({
    required this.width,
    required this.height,
    required this.text,
    this.entry_color,
    this.exit_color,
    this.border,
    this.borderRadius,
    this.fontSize,
    this.icon,
    this.onTap,
    // this.gradient,
    // this.image,
    this.iconColor,
    this.textColor,
    this.iconSize,
    super.key,
  });

  @override
  State<HoveringContainer> createState() => _HoveringContainerState();
}

class _HoveringContainerState extends State<HoveringContainer> {
  bool isHovering = false;
  // This variable is used to track whether the button is being hovered over.

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
            color: isHovering ? widget.entry_color : widget.exit_color,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.iconColor,
                size: widget.iconSize ?? 18,
              ),
              10.hSpace,
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.fontSize ?? 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
