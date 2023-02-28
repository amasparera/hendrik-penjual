import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:penjual/const/main_app.dart';
import 'package:penjual/const/navigasi.dart';
import 'package:penjual/presentasi/controller/profile_controller.dart';
import 'package:penjual/presentasi/page/detail_pesanan_view.dart';
import 'package:penjual/presentasi/widget/card_order.dart';
import 'package:provider/provider.dart';

import '../widget/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bg,
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          title: const Text(
            "RM. Restu Bundo Payakumbuoh",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: fontBlack, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          leading: IconButton(
            splashRadius: 20,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Image.asset(
              "assets/icon/Group 105.png",
              scale: 3.4,
            ),
          ),
          actions: [
            Center(
              child: Consumer<ProfileController>(builder: (context, c, _) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(12, 12),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
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
                                        "Apakah anda yakin ingin menutupkantin anda sekarang?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Batal",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff616161),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          const SizedBox(
                                              height: 18,
                                              child: VerticalDivider(
                                                thickness: 2,
                                              )),
                                          Expanded(
                                            flex: 3,
                                            child: TextButton(
                                                onPressed: () {
                                                  c.openClose(context);
                                                },
                                                child: Text(
                                                  c.buka
                                                      ? "Tutup sekarang"
                                                      : 'Buka sekarang',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: c.buka
                                                          ? const Color(
                                                              0xffD32F2F)
                                                          : const Color(
                                                              0xff388E3C),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: c.buka
                        ? const Text(
                            "Buka",
                            style: TextStyle(
                                color: Color(0xff388E3C),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        : const Text(
                            "Tutup",
                            style: TextStyle(
                                color: Color(0xffD32F2F),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ));
              }),
            ),
            const SizedBox(
              width: padding,
            )
          ],
        ),
        body: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -6),
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                child: const TabBar(
                  dragStartBehavior: DragStartBehavior.start,
                  isScrollable: true,
                  padding: EdgeInsets.zero,
                  labelColor: fontBlack,
                  physics: ScrollPhysics(),
                  indicatorColor: purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color(0xffBDBDBD),
                  indicatorPadding: EdgeInsets.all(0),
                  indicatorWeight: 0,
                  labelStyle: TextStyle(
                      color: fontBlack,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 3, color: Color(0xffAB47BC)),
                      insets: EdgeInsets.only(left: 0, right: 20, bottom: 0)),
                  tabs: [
                    Tab(
                      text: "Pesanan datang",
                    ),
                    Tab(
                      text: "Terkonfirmasi",
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/image/Wavy Buddies Avatar.png",
                      scale: 4,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Text(
                        "Belum ada orderan, tunggu ya",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding, vertical: 8),
                children: List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CardOrder(
                              onTap: () {
                                toPageCupertino(
                                    context, const DetailPesananView());
                              },
                              statusPesanan: StatusPesanan.terkonfirmasi),
                        )),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
