import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:penjual/presentasi/page/riwayat_detail_selesai.dart';
import 'package:penjual/presentasi/widget/card_order.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';

class RiwayatView extends StatelessWidget {
  const RiwayatView({super.key});

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
