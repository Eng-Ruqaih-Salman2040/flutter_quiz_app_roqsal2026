/*
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String emoji;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   final colorScheme = theme.colorScheme;
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Card(

      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      //color: colorScheme.surfaceContainerHighest,
        color: colorScheme.surfaceContainerHigh,
     // color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isSmallScreen ? 40 : 60,
                height: isSmallScreen ? 40 : 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: isSmallScreen ? 50 : 80,
                ),
              ),
              SizedBox(height: isSmallScreen ? 20 : 25),
              Text(
                title,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontSize: isSmallScreen ? 20 : 24,
                ),

                textAlign: TextAlign.center,
              ),
              SizedBox(height: isSmallScreen ? 8 : 16),
              Text(
                emoji,
                style: TextStyle(fontSize: isSmallScreen ? 40 : 70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


// ===================== DashboardCard =====================
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String emoji;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(
            color: colorScheme.outlineVariant,
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Combined icon + emoji container
            Container(
              padding: EdgeInsets.all(2.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Icon background
                  Container(
                    width: 20.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 10.w,
                    ),
                  ),
                  // Emoji overlay
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Text(
                      emoji,
                      style: TextStyle(fontSize: 7.w),
                    ),
                  ),
                ],
              ),
            ),

            // Title text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.sp, // Reduced font size
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  fontFamily: "Poppins",
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 1.h), // Add bottom spacing
          ],
        ),
      ),
    );
  }
}
