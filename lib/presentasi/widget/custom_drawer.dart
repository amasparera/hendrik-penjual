import 'package:flutter/material.dart';
import 'package:penjual/const/navigasi.dart';
import 'package:penjual/presentasi/page/kelola_menu_view.dart';
import 'package:penjual/presentasi/page/rekap_view.dart';
import 'package:penjual/presentasi/page/review_view.dart';
import 'package:penjual/presentasi/page/riwayat_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
              child: Center(
                  child: Text(
            "RM. Restu Bundo Payakumbuoh",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ))),
          ListTile(
            onTap: () {
              toPageCupertino(context, KelolaMenuView());
            },
            leading: Image.asset(
              "assets/icon/Category.png",
              scale: 4,
            ),
            title: const Text(
              "Kelola menu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {
              toPageCupertino(context, const RiwayatView());
            },
            leading: Image.asset(
              "assets/icon/Paper.png",
              scale: 4,
            ),
            title: const Text(
              "Riwayat",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {
              toPageCupertino(context, const RecapView());
            },
            leading: Image.asset(
              "assets/icon/Activity.png",
              scale: 4,
            ),
            title: const Text(
              "Rekap bulanan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {
              toPageCupertino(context, const ReviewView());
            },
            leading: Image.asset(
              "assets/icon/Star.png",
              scale: 4,
            ),
            title: const Text(
              "Review pelanggan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              "assets/icon/Setting.png",
              scale: 4,
            ),
            title: const Text(
              "Setting",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
