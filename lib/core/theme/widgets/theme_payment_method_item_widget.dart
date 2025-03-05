import 'package:flutter/material.dart';
import 'package:levy_theme/core/theme/theme.dart';

final class ThemePaymentMethodItemWidget extends StatelessWidget {
  const ThemePaymentMethodItemWidget({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    required this.cardNumber,
    this.onPressed,
    this.showTextButton = true,
    this.buttonTitle,
  });

  final String? image;
  final String title;
  final String subtitle;
  final String? cardNumber;
  final VoidCallback? onPressed;
  final bool showTextButton;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: ThemeTypography.semiBold14,
                  ),
                ),
                _buildTextButton(),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildLeadingImage(),
                Expanded(
                  child: Text(
                    subtitle,
                    style: ThemeTypography.regular12.apply(
                      color: ThemeColors.grey4,
                    ),
                  ),
                ),
                Text(
                  _obscureCardNumber(cardNumber),
                  style: ThemeTypography.regular12.apply(
                    color: ThemeColors.grey4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeadingImage() {
    final leadingImage = image;

    if (leadingImage != null) {
      return Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              ThemeImages.getImageByString(leadingImage),
              fit: BoxFit.fitWidth,
              height: 20,
            ),
          ),
          const SizedBox(width: 8),
        ],
      );
    }

    return const SizedBox.shrink();
  }


  Widget _buildTextButton() {
    final title = buttonTitle;

    if (showTextButton && title != null) {
      return Text(
        title,
        style: ThemeTypography.regular14.apply(
          color: ThemeColors.primary,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _obscureCardNumber(String? cardNumber) {
    final number = cardNumber;

    if (number == null) return '';

    if (number.length < 4) return number;

    return number.replaceRange(
      0,
      number.length - 4,
      '•••• •••• •••• ',
    );
  }
}
