import 'package:flutter/material.dart';
import 'package:penjual/presentasi/widget/list_harga.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    Key? key,
    required this.statusPesanan,
    this.onTap,
  }) : super(key: key);

  final StatusPesanan statusPesanan;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14)))),
      onPressed: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffE1BEE7),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                if (statusPesanan == StatusPesanan.terkonfirmasi)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Text(
                      "Terjadwal untuk 12.30 - 12.45",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fontBlack),
                    ),
                  ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Text(
                    "No. Pesanan #12345",
                    style: TextStyle(fontSize: 11, color: fontBlack),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: const Color(0xffBDBDBD))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(person),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "John Doe",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: fontBlack),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "pesan antar",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 11, color: fontBlack),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Pembayaran",
                            style: TextStyle(fontSize: 10, color: fontBlack),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Tunai",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: fontBlack),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tarif",
                            style: TextStyle(fontSize: 10, color: fontBlack),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Rp17.000",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: fontBlack),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffEEEEEE),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Pesanan",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: fontBlack),
                  ),
                  const ListHarga(
                    text: "Nasi Rendang",
                    quantity: "1",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum StatusPesanan { pesananDatang, terkonfirmasi }

enum StatusKirim { terjadwal, pesanAntar, diambilSendiri }
