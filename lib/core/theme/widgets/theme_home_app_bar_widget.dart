import 'package:flutter/material.dart';
import 'package:levy_theme/core/theme/theme.dart';
import 'package:levy_core/core/utils/commons_translation.dart';

final class ThemeHomeAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ThemeHomeAppBarWidget({
    super.key,
    this.userImage,
    this.userName,
    this.userLastName,
    this.onActionPressed,
    required this.guestTitle,
  });

  final String? userImage;
  final String? userName;
  final String? userLastName;
  final VoidCallback? onActionPressed;
  final String guestTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 24,
      toolbarHeight: 72,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(_getUserImage()),
              radius: 24,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CommonsTranslation.texts.welcome,
                  style: ThemeTypography.regular12,
                ),
                Text(
                  _getUserText(),
                  style: ThemeTypography.semiBold16.apply(
                    color: ThemeColors.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ThemeIconWidget(
              onIconPressed: onActionPressed,
              icon: ThemeIcons.bell,
              color: ThemeColors.dark,
            ),
          ],
        ),
      ),
    );
  }

  String _getUserImage() {
    final image = userImage;

    if (image != null) {
      return ThemeImages.getImageByString(image);
    } else {
      return ThemeImages.avatar;
    }
  }

  String _getUserText() {
    final name = userName;
    final lastName = userLastName;

    if (name != null && lastName != null) {
      return '$name $lastName';
    } else {
      return guestTitle;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
