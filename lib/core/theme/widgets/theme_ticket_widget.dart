import 'package:flutter/material.dart';
import 'package:levy_theme/core/theme/theme.dart';

final class ThemeTicketWidget extends StatelessWidget {
  const ThemeTicketWidget({
    super.key,
    required this.title,
    required this.busImage,
    required this.busTitle,
    required this.busDescription,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureAddressTitle,
    required this.arrivalAddressTitle,
    required this.departureAddressLine,
    required this.arrivalAddressLine,
    required this.driverName,
    required this.driverImage,
    this.isReturnBus = false,
    this.showDriverInfo = false,
  });

  final String title;
  final String busImage;
  final String busTitle;
  final String busDescription;
  final String departureTime;
  final String arrivalTime;
  final String departureAddressTitle;
  final String arrivalAddressTitle;
  final String departureAddressLine;
  final String arrivalAddressLine;
  final String driverName;
  final String driverImage;
  final bool isReturnBus;
  final bool showDriverInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          transform: Matrix4.translationValues(0, 1, 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeColors.secondary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 3),
                child: Text(
                  title,
                  style: ThemeTypography.regular12.apply(
                    color: ThemeColors.primary,
                  ),
                ),
              ),
              ThemeScheduleWidget(
                padding: const EdgeInsets.fromLTRB(16, 3, 16, 16),
                departureTime: departureTime,
                arrivalTime: arrivalTime,
                departureAddressTitle: departureAddressTitle,
                arrivalAddressTitle: arrivalAddressTitle,
                departureAddressLine: departureAddressLine,
                arrivalAddressLine: arrivalAddressLine,
              ),
              if (showDriverInfo)
                ThemeListItemWidget(
                  image: busImage,
                  title: driverName,
                  subtitle: driverImage,
                  showBorder: false,
                ),
            ],
          ),
        ),
        Container(
          height: 98,
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeColors.secondary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ThemeListItemWidget(
            image: busImage,
            title: busTitle,
            subtitle: busDescription,
            showBorder: false,
          ),
        ),
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width - 74,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          transform: Matrix4.translationValues(0, -98.5, 0),
          decoration: const BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: const ThemeDashedLineWidget(
            direction: Axis.horizontal,
            dashLength: 5,
            dashSpacing: 3,
            color: ThemeColors.secondary,
            thickness: 1.25,
          ),
        ),
      ],
    );
  }
}
