import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
    this.iconColor,
    this.titleStyle,
  });

  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;
  final Color backgroundColor;
  final double elevation;
  final Color? iconColor;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: iconColor ?? Colors.black87,
                  ),
                  onPressed: onBack ??
                      (canPop
                          ? () {
                              Navigator.of(context).maybePop();
                            }
                          : null),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: titleStyle ??
                      const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: trailing ??
                    const SizedBox(
                      width: kMinInteractiveDimension,
                      height: kMinInteractiveDimension,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



