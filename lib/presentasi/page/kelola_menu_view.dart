import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../dummi.dart';
import '../widget/card_menu.dart';
import 'add_menu_view.dart';

class KelolaMenuView extends StatelessWidget {
  const KelolaMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Review pelanggan",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontBlack,
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            backgroundColor: purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            toPageCupertino(context, const AddMenuView());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              Text(
                "Tambah Menu",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              )
            ],
          )),
      body: ListView.builder(
          itemCount: demoCategoryMenus.length,
          itemBuilder: (context, index) {
            List<Menu> items = demoCategoryMenus[index].items;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      demoCategoryMenus[index].category,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: DottedLine(
                      dashColor: Color(0xffE0E0E0),
                    ),
                  ),
                  const SizedBox(height: 18),
                  ...List.generate(
                      items.length,
                      (index) => CardMenu(
                            onTap: () {},
                            tambah: () {},
                            price: items[index].price.toInt(),
                            title: items[index].title,
                            horizontal: padding,
                          )),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    height: 4,
                    width: double.infinity,
                    color: const Color(0xffEEEEEE),
                  )
                ]);
          }),
    );
  }
}
