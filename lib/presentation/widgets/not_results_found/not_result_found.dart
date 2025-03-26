import 'package:flutter/material.dart';

class NoResultsFound extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final double spacing;
  final Color? iconColor;
  final TextStyle? textStyle;

  const NoResultsFound({
    super.key,
    this.message = 'No results found',
    this.icon = Icons.search_off,
    this.iconSize = 64,
    this.spacing = 16,
    this.iconColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: iconColor ?? theme.colorScheme.secondary,
          ),
          SizedBox(height: spacing),
          Text(
            message,
            style: textStyle ??
                theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
