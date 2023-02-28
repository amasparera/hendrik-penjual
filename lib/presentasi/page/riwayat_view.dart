import 'package:flutter/material.dart';
import 'package:penjual/presentasi/page/riwayat_detail_selesai.dart';
import 'package:penjual/presentasi/widget/card_order.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';

class RiwayatView extends StatelessWidget {
  const RiwayatView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> hari = ["Senin", "Selasa", "Rabu", "Kamis"];
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
          "No. Pesanan #12345",
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
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: padding),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: const Color(0xffbdbdbd))),
                child: DropdownButton(
                  underline: const SizedBox(),
                  hint: Row(
                    children: [
                      Image.asset(
                        "assets/icon/Calendar.png",
                        scale: 4,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Pilih hari",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: padding),
                    ],
                  ),
                  value: "Senin",
                  items: hari.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon/Calendar.png",
                            scale: 4,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            value,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: padding),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
              const Spacer(),
            ],
          ),
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CardOrder(
                statusPesanan: StatusPesanan.pesananDatang,
                onTap: () {
                  toPageCupertino(context, const RIwayatSelesaiView());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
