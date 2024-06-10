import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/mahas/mahas_config.dart';
import 'package:kelas_belajar/infrastructure/theme/typografi.dart';
import 'package:kelas_belajar/infrastructure/widget/constant.dart';

import '../../../infrastructure/widget/mahas_avatar.dart';
import '../../../infrastructure/widget/mahas_badge.dart';
import '../../../infrastructure/widget/mahas_card.dart';
import '../controllers/profile.controller.dart';

class MobileLayout extends GetView<ProfileController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());
    return Column(
      children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80)),
            color: MahasColors.primaryColor,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Spacer(),
                const MahasBadgeWith(
                  badgeColor: MahasColors.successColor,
                  badgePosition: BadgePosition.bottomRight,
                  text: 'Online',
                  showBadgeText: true,
                  child: MahasAvatar(
                    size: MahasAvatarSize.large,
                    borderRadius: MahasBorderRadius.circle,
                    avatarUrl:
                        "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  MahasConfig.userModel?.nama ?? '',
                  style: MahasTypography.subtitle1.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        deviderText("Akun"),
        taskCard(text: "Edit Data Pribadi", onPressed: () {}),
        deviderText("Pengaturan"),
        taskCard(text: "Bahasa", onPressed: () {}),
        taskCard(
            text: "Sign Out",
            onPressed: () {
              controller.signOut();
            }),
      ],
    );
  }

  InkWell taskCard({
    required String text,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: MahasCustomizableCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Container deviderText(
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Text(text),
        ],
      ),
    );
  }
}
