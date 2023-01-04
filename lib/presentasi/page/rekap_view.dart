import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';

class RecapView extends StatelessWidget {
  const RecapView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> bulan = ["Oktober 2020", "September 2020", "November 2020"];
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
                        "pilih bulan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  value: "Oktober 2020",
                  items: bulan.map((value) {
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
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: const [
              Expanded(
                  flex: 5,
                  child: Text(
                    "Makanan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "Terjual",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    "Harga total",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: const [
                SizedBox(width: padding),
                Expanded(
                    flex: 5,
                    child: Text(
                      "Nasi rendang",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "50x",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "3.523.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: const [
                SizedBox(width: padding),
                Expanded(
                    flex: 5,
                    child: Text(
                      "Nasi goreng",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "50x",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "3.523.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                  flex: 5,
                  child: Text(
                    "Minuman",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: const [
                SizedBox(width: padding),
                Expanded(
                    flex: 5,
                    child: Text(
                      "Es jeruk",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "50x",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "3.523.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Row(
              children: const [
                SizedBox(width: padding),
                Expanded(
                    flex: 5,
                    child: Text(
                      "Es teh",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 2,
                    child: Text(
                      "50x",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      "3.523.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: DottedLine(
              dashColor: Color(0xffEEEEEE),
            ),
          ),
          Row(
            children: const [
              Spacer(),
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Text(
                "Rp 6.800.000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
