import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/widgets/button/basic_app_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  void _handleSignSinUp(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupOrSigninPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(AppImages.chooseModeBG)),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.15)),
          _buildContentPage(context)
        ],
      ),
    );
  }

  Widget _buildContentPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(AppVectors.logo),
          ),
          const Spacer(),
          const Text(
            'Choose Mode',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDarkMode(context),
              const SizedBox(width: 40),
              _buildLightMode(context),
            ],
          ),
          const SizedBox(height: 50),
          BasicAppButton(
            onPressed: () => _handleSignSinUp(context),
            title: 'Continue',
          )
        ],
      ),
    );
  }

  Widget _buildDarkMode(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(AppVectors.moon, fit: BoxFit.none),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Dark Mode',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
        )
      ],
    );
  }

  Widget _buildLightMode(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // context.read<ThemeCubit>().updateTheme(ThemeMode.light);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff30393C).withOpacity(0.5),
                ),
                child: SvgPicture.asset(AppVectors.sun, fit: BoxFit.none),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Light Mode',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
        )
      ],
    );
  }
}
