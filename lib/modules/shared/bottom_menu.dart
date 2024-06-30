// card Pemilih
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Row bottomMenu(context, tabIndex, roleId) {
  return Row(
    children: [
      Expanded(
        flex: 11,
        child: SalomonBottomBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: ThemeColor.primary,
          onTap: (index) {
            if (index == 0) {
              Get.offAllNamed("/home");
            }
            if (index == 1) {
              Get.offAllNamed("/pemilih");
            }
            if (index == 2) {
              Get.offAllNamed("/laporan");
            }
            if (index == 3) {
              Get.offAllNamed("/statistik");
            }
            if (index == 4) {
              Get.offAllNamed("/survey");
            }
          },
          currentIndex: tabIndex,
          backgroundColor: ThemeColor.greylight,
          items: [
            _bottomNavigationBarItem(
              icon: 'assets/icons/home.png',
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: 'assets/icons/pemilih.png',
              label: 'Pemilih',
            ),
            _bottomNavigationBarItem(
              icon: 'assets/icons/laporan.png',
              label: 'Laporan',
            ),
            _bottomNavigationBarItem(
              icon: 'assets/icons/statistik.png',
              label: 'Statistik',
            ),
            _bottomNavigationBarItem(
              icon: 'assets/icons/survey.png',
              label: 'Survey',
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 60,
          color: ThemeColor.greylight,
          child: TextButton(
            onPressed: () {
              _showModalBottomSheet(context, roleId);
            },
            child: Image.asset('assets/icons/other.png'),
          ),
        ),
      )
    ],
  );
}

_bottomNavigationBarItem({required String icon, required String label}) {
  return SalomonBottomBarItem(
    icon: Image.asset(icon),
    activeIcon: Image.asset(
      icon,
      color: ThemeColor.primary,
    ),
    title: Text(label),
    selectedColor: ThemeColor.primary,
  );
}

_showModalBottomSheet(context, roleId) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: ThemeColor.background,
    builder: (context) {
      if (roleId == 3) {
        return Wrap(
          children: [
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/quick-count.png'),
              ),
              title: const Text('Quick Count'),
              onTap: () {
                Get.toNamed(AppRoutes.quickcount);
              },
            ),
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/setting.png'),
              ),
              title: const Text('Setting'),
              onTap: () {
                Get.toNamed(AppRoutes.setting);
              },
            ),
          ],
        );
      } else {
        return Wrap(
          children: [
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/quick-count.png'),
              ),
              title: const Text('Quick Count'),
              onTap: () {
                Get.toNamed(AppRoutes.quickcount);
              },
            ),
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/pengeluaran.png'),
              ),
              title: const Text('Pengeluaran'),
              onTap: () {
                Get.toNamed(AppRoutes.pengeluaran);
              },
            ),
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/inventaris.png'),
              ),
              title: const Text('Inventaris'),
              onTap: () {
                Get.toNamed(AppRoutes.inventaris);
              },
            ),
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/relawan.png'),
              ),
              title: const Text('Relawan'),
              onTap: () {
                Get.toNamed(AppRoutes.relawan);
              },
            ),
            ListTile(
              leading: const ImageIcon(
                AssetImage('assets/icons/setting.png'),
              ),
              title: const Text('Setting'),
              onTap: () {
                Get.toNamed(AppRoutes.setting);
              },
            ),
          ],
        );
      }
    },
  );
}
