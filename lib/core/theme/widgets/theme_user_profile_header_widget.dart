import 'package:flutter/material.dart';
import 'package:levy_theme/core/theme/theme.dart';

final class ThemeUserProfileHeaderWidget extends StatelessWidget {
  const ThemeUserProfileHeaderWidget({
    super.key,
    required this.image,
    required this.name,
    required this.email,
  });

  final String image;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              ThemeImages.getImageByString(image),
            ),
            radius: 24,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: ThemeTypography.semiBold16.apply(
                  color: ThemeColors.primary,
                ),
              ),
              Text(
                email,
                style: ThemeTypography.regular12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
