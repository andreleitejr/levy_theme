import 'package:flutter/material.dart';
import 'package:levy_theme/core/theme/theme.dart';

final class ThemeListItemWidget extends StatelessWidget {
  const ThemeListItemWidget({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onPressed,
    this.showBorder = true,
    this.imageGeometry = ThemeImageGeometry.circle,
  });

  final String? image;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final bool showBorder;
  final ThemeImageGeometry imageGeometry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(
                bottom: BorderSide(
                  color: ThemeColors.grey2,
                ),
              )
            : null,
      ),
      child: ListTile(
        onTap: onPressed,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        minVerticalPadding: 28,
        leading: _buildLeadingImage(),
        title: Text(
          title,
          style: ThemeTypography.semiBold14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: ThemeTypography.regular10,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: trailing,
      ),
    );
  }

  Widget? _buildLeadingImage() {
    final leadingImage = image;

    if (leadingImage == null) return null;

    if (imageGeometry == ThemeImageGeometry.circle) {
      return ClipOval(
        child: Image.asset(
          ThemeImages.getImageByString(leadingImage),
          width: 48,
          height: 48,
          fit: BoxFit.fitWidth,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          ThemeImages.getImageByString(leadingImage),
          fit: BoxFit.fitWidth,
          height: 24,
        ),
      );
    }
  }
}
