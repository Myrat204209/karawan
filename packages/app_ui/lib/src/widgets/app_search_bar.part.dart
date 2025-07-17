part of 'app_search_bar.dart';

class AppActionIcon extends StatelessWidget {
  const AppActionIcon({
    super.key,
    required this.icon,
    required this.onTap,
    this.color = AppColors.iconColor,
    this.size = 24,
  });

  final Color color;
  final IconData icon;
  final double size;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      iconSize: size,
      visualDensity: VisualDensity.compact,
      onPressed: onTap,
      icon: Icon(icon, color: color),
    );
  }
}

class AppSearchDivider extends StatelessWidget {
  const AppSearchDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: VerticalDivider(
        width: 1,
        color: AppColors.border,
        thickness: 2,
        indent: 8,
        endIndent: 8,
      ),
    );
  }
}
