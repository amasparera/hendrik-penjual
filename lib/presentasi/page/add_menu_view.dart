import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:penjual/presentasi/widget/main_button.dart';
import 'package:penjual/presentasi/widget/main_textfield.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';

class AddMenuView extends StatelessWidget {
  const AddMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MainButton(
        onPress: () {},
        text: "Tambahkan menu",
      ),
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: fontBlack,
            size: 20,
          ),
          onPressed: () => closePage(context),
        ),
        title: const Text(
          "Tambahkan menu",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontBlack,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        children: [
          InkWell(
            onTap: () {},
            child: DottedBorder(
              dashPattern: [8, 8],
              color: const Color(0xffeeeeee),
              strokeWidth: 1,
              radius: const Radius.circular(12),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xffbdbdbd),
                      size: 24,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Tambah Menu",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffbdbdbd)),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const MainTextField(hint: "Nama menu"),
          const SizedBox(height: 14),
          const MainTextField(hint: "Harga jual"),
          const SizedBox(height: 14),
          const MainTextField(hint: "Kategori"),
          const SizedBox(height: 14),
          const MainTextField(
            hint: "Deskripsi menu",
            maxLine: 4,
          ),
        ],
      ),
    );
  }
}
