import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:penjual/presentasi/widget/main_button.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../dummi.dart';
import '../widget/list_harga.dart';

class DetailPesananView extends StatelessWidget {
  const DetailPesananView({super.key});

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MainButton(
        symetry: padding,
        onPress: () {},
        text: "Konfirmasi order",
      ),
      body: ListView(
        padding: const EdgeInsets.only(
            left: padding, right: padding, bottom: padding * 3),
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  person,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Doe",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: fontBlack),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Rp20.000",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Image.asset(
                "assets/icon/Frame 173.png",
                scale: 4,
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffEEEEEE),
              thickness: 2,
            ),
          ),
          const Text(
            "Tipe pesanan",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E)),
          ),
          const SizedBox(height: 12),
          const Text(
            "Pesan antar",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Color(0xffEEEEEE),
              thickness: 2,
            ),
          ),
          const Text(
            "Pesanan",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E)),
          ),
          const SizedBox(height: 10),
          ...List.generate(
              2,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Expanded(
                                child: Text(
                              "Nasi Rendang Daging",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )),
                            Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "Catatan",
                                style: TextStyle(
                                    color: Color(0xffF44336), fontSize: 12),
                                children: [
                              TextSpan(
                                  text: ": sambalnya dipisah",
                                  style: TextStyle(color: Color(0xff20191B)))
                            ]))
                      ],
                    ),
                  )),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              color: Color(0xffEEEEEE),
              thickness: 2,
            ),
          ),
          const Text(
            "Detail pembayaran",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E)),
          ),
          const SizedBox(height: 10),
          const ListHarga(
            bold: true,
            quantity: "Rp15.000",
            text: "Harga",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: DottedLine(
              dashColor: Color(0xffEEEEEE),
            ),
          ),
          const ListHarga(
            bold: true,
            quantity: "Rp20.000",
            text: "Total",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: DottedLine(
              dashColor: Color(0xffEEEEEE),
            ),
          ),
          const ListHarga(
            bold: true,
            quantity: "Rp20.000",
            text: "Bayar dengan tunai",
          ),
          const SizedBox(height: padding),
        ],
      ),
    );
  }
}
