// import 'package:flutter/material.dart';
// import 'package:one_clock/one_clock.dart';
// import '../utils/app_colors.dart';

// class CustomStatusBar extends StatelessWidget {
//   const CustomStatusBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.greys['grey-300'], // Background color
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       height: 24.0, // Standard height for a status bar
//       child: Row(
//         children: [
//           // Display Current Time with DigitalClock
//           DigitalClock.light(
//             isLive: true, // Automatically updates every second
//             datetime: DateTime.now(),
//             decoration: const BoxDecoration(), // No extra styling
//             padding: EdgeInsets.zero, // Remove default padding
//             showSeconds: false, // Only show hours and minutes
//             digitalClockTextColor: AppColors.greys['grey-900'] ?? Colors.black,
//             textScaleFactor: 0.9,
//           ),
//           const Spacer(),
//           // Status Icons
//           Row(
//             children: [
//               Icon(Icons.wifi, size: 20, color: AppColors.greys['grey-900']),
//               const SizedBox(width: 8),
//               Icon(Icons.signal_cellular_alt,
//                   size: 20, color: AppColors.greys['grey-900']),
//               const SizedBox(width: 8),
//               Icon(Icons.battery_full,
//                   size: 20, color: AppColors.greys['grey-900']),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
