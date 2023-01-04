import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';

class CardMenu extends StatelessWidget {
  const CardMenu(
      {Key? key,
      this.horizontal = 0,
      t,
      this.title,
      this.price,
      this.tambah,
      this.onTap,
      this.favorite})
      : super(key: key);

  final double horizontal;
  final String? title;
  final int? price;

  final VoidCallback? tambah;
  final VoidCallback? onTap;
  final VoidCallback? favorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 65,
              width: 65,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  color: fontgrey, borderRadius: BorderRadius.circular(12)),
              child: Image.network(
                rendang,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title ?? "Nasi rendang Daging",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Rp${price ?? 15000}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Text(
              "Tersedia",
              style: TextStyle(color: Color(0xff4CAF50), fontSize: 10),
            ),
            IconButton(
              splashRadius: 20,
              icon: Image.asset(
                "assets/icon/More Circle.png",
                scale: 4,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 18),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Apakah menu ini masih tersedia di kantinmu?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Habis",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffD32F2F),
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    const SizedBox(
                                        height: 18,
                                        child: VerticalDivider(
                                          thickness: 2,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Tersedia",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff4CAF50),
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
