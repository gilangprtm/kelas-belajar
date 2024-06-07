import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../infrastructure/widget/constant.dart';
import '../../infrastructure/widget/mahas_menubar.dart';
import '../screens.dart';
import 'controllers/base.controller.dart';

class BaseScreen extends GetView<BaseController> {
  const BaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => MahasMenuBar(
          items: [
            MenuItem(icon: Icons.home, title: 'Home'),
            MenuItem(icon: Icons.menu_book_rounded, title: 'Modul'),
            MenuItem(icon: Icons.account_circle, title: 'Profile'),
          ],
          onTap: (index) {
            // Ketika item menu dipilih, ubah indeks yang dipilih untuk menampilkan halaman yang sesuai
            controller.changeIndex(index);
          },
          selectedIndex: controller.selectedIndex.value,
          pages: const [
            HomeScreen(),
            ModuleScreen(),
            ProfileScreen(),
          ],
          isResponsive: false,
          menuType: MenuType.pill,
          selectedColor: MahasColors.primaryColor,
          textVisibility: TextVisibility.hideUnselectedText,
          centerButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          centerButtonPosition: CenterButtonPosition.aboveCenter,
        ),
      ),
    );
  }
}
