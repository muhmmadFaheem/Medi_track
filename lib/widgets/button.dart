// import 'package:flutter/material.dart';
// import 'package:medi_track/constant/app_colors.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isLoading;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.isLoading = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primary,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//           elevation: 0,
//         ),
//         onPressed: isLoading ? null : onPressed,
//         child: isLoading
//             ? const CircularProgressIndicator(color: Colors.white)
//             : Text(text, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
//       ),
//     );
//   }
// }
