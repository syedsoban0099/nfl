import 'package:fan_hall/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/userProvider.dart';
import '../../../widgets/common.dart';
import 'certificates_screen.dart';
import 'fanlikes_screen.dart';
import 'no_certificate_Screen.dart';
import 'no_fanlike_screen.dart';

class CertificateMainScreen extends StatefulWidget {
  const CertificateMainScreen({Key? key}) : super(key: key);

  @override
  State<CertificateMainScreen> createState() => _CertificateMainScreenState();
}

class _CertificateMainScreenState extends State<CertificateMainScreen>
    with TickerProviderStateMixin {
  ScrollController? _scrollController;
  TabController? tabViewController;
  TabController? tabController;

  TabBar get _tabBar => TabBar(
        controller: tabController,
        indicatorColor: Theme.of(context).primaryColor,
        labelColor: textColorW,
        indicatorWeight: 3.0,
        isScrollable: false,
        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (int i) {
          onTabPressed(i);
        },
        tabs: [
          Tab(
              icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VariableText(
                text: "Certificates",
                fontsize: 12,
                fontcolor: textColorW,
                fontFamily: fontMedium,
                max_lines: 1,
              ),
            ],
          )),
          Tab(
              icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VariableText(
                text: "NFT’s",
                fontsize: 12,
                fontcolor: textColorW,
                fontFamily: fontMedium,
                max_lines: 1,
              ),
            ],
          ))
        ],
      );

  onTabPressed(int i) {
    setState(() {
      tabViewController!.animateTo(i);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabViewController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.network(
                      user.img!,
                      scale: 2,
                      fit: BoxFit.fill,
                      height: size.height * 0.05,
                      width: size.width * 0.10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: size.width * 0.05),
                Flexible(
                  child: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Color(0xFF555555), width: 3.0),
                          ),
                        ),
                      ),
                      _tabBar,
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * horizontalPadding),
                  child: Row(
                    children: [
                      Image.asset("assets/icons/ic_certificate_slider_view.png",
                          scale: 2),
                      SizedBox(width: size.width * 0.06),
                      Image.asset("assets/icons/ic_certificate_grid_view.png",
                          scale: 2)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CertificatesScreen(isshow: true,), //NoCertificateScreen(),
          FanlikesScreen(),
        ],
      ),
    );
  }
}
