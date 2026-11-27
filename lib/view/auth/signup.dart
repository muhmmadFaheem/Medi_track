// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/app_colors.dart';
// import '../controllers/auth_controller.dart';

// class SignupView extends StatelessWidget {
//   SignupView({super.key});
//   final controller = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const BackButton(color: AppColors.textDark),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Create Account',
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.textDark,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               const Text(
//                 'Set up your Meditech patient profile.',
//                 style: TextStyle(fontSize: 14, color: AppColors.textGrey),
//               ),
//               const SizedBox(height: 28),
//               _buildInput('Full Name', 'Muhammad Faheem',
//                   controller.nameController, Icons.person_outline),
//               const SizedBox(height: 16),
//               _buildInput('Email Address', 'name@example.com',
//                   controller.emailController, Icons.email_outlined),
//               const SizedBox(height: 16),
//               _buildInput('Password', 'Create a strong password',
//                   controller.passwordController, Icons.lock_outline,
//                   obscure: true),
//               const SizedBox(height: 28),
//               SizedBox(
//                 width: double.infinity,
//                 height: 52,
//                 child: ElevatedButton(
//                   onPressed: controller.signup,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryTeal,
//                     foregroundColor: AppColors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14),
//                     ),
//                   ),
//                   child: const Text(
//                     'Register & Continue',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInput(String label, String hint, TextEditingController ctrl,
//       IconData icon,
//       {bool obscure = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textDark,
//                 fontSize: 13)),
//         const SizedBox(height: 8),
//         TextField(
//           controller: ctrl,
//           obscureText: obscure,
//           decoration: InputDecoration(
//             hintText: hint,
//             prefixIcon: Icon(icon, color: AppColors.primaryTeal, size: 20),
//             filled: true,
//             fillColor: AppColors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: AppColors.borderGrey),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: AppColors.borderGrey),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
