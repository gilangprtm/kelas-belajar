import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_belajar/infrastructure/theme/typografi.dart';
import 'package:kelas_belajar/infrastructure/widget/mahas_badge.dart';
import 'package:kelas_belajar/presentation/home/controllers/home.controller.dart';

import '../../../infrastructure/widget/constant.dart';
import '../../../infrastructure/widget/mahas_button.dart';
import '../../../infrastructure/widget/mahas_carousel.dart';

class MobileLayout extends GetView<HomeController> {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 50,
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('KR', style: MahasTypography.subtitle1),
                MahasBadgeWith(
                  badgePosition: BadgePosition.topLeft,
                  showBadgeText: false,
                  child: InkWell(
                    borderRadius: MahasBorderRadius.circle,
                    onTap: () {
                      // print("notification");
                    },
                    child: const Icon(
                      Icons.notifications,
                      size: 26.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi, Gilang Pratama',
                    style: MahasTypography.headline6),
                const Text('Mau Belajar Apa Hari Ini?',
                    style: MahasTypography.headline5),
                const SizedBox(
                  height: 15,
                ),
                MahasButton(
                  text: 'Cari Kelasmu',
                  onPressed: () {},
                  type: ButtonType.primary,
                  height: 52,
                  elevation: 0,
                  icon: const Icon(Icons.search_rounded),
                  borderRadius: MahasBorderRadius.large,
                  isFullWidth: true,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          MahasCarousel(
            items: [
              _buildCarouselItem(
                  'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80'),
              _buildCarouselItem(
                  'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80'),
              _buildCarouselItem(
                  'https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80'),
            ],
            height: 200.0,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Kelas Belajarmu',
                        style: MahasTypography.headline6),
                    MahasButton(
                      text: 'All',
                      onPressed: () {},
                      type: ButtonType.text,
                      borderRadius: MahasBorderRadius.extraLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            child: Row(
              children: controller.items,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
