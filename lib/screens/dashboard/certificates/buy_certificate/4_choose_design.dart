import 'package:cached_network_image/cached_network_image.dart';
import 'package:fan_hall/controller/auth/league_api.dart';
import 'package:fan_hall/models/certificate.dart';
import 'package:fan_hall/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_file/internet_file.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/common.dart';
import '../../../../widgets/style.dart';
import '5_buy.dart';

class ChooseDesignScreen extends StatefulWidget {
  final String type;
  final String id;
  const ChooseDesignScreen({Key? key, required this.type, required this.id})
      : super(key: key);

  @override
  State<ChooseDesignScreen> createState() => _ChooseDesignScreenState();
}

class _ChooseDesignScreenState extends State<ChooseDesignScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetFloat;
  var nameCert;
  String? certId;
  List<Image> certtemp=[];
  int indexx = 0;
  bool isLoading = false;
  setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  getcertificate() {
    if (selectedHero == null &&selectedmomentId == null) {
      getteamcertificate();
    }
    if (selectedHero != null) {
      getHeroCertificate();
    } if(selectedmomentId!=null) {
      getMomentsCertificate();
    }
  }
  Future pdftoimgOld(String pdf) async {
    setLoading(true);
    var res = await ApiModel().CertificateconvertTo(pdf.toString());
    if (res != null) {

      certtemp.add(res);


    }
    setLoading(false);

    setState(() {});

    //  PdfToImg _pdf=PdfModel.fromJson(res);

    // print(cert);

  }
  Future pdftoimg(String pdf) async {
    //setLoading(true);
    try {
      //print("downloading pdf");
      final document = await PdfDocument.openData(InternetFile.get(pdf));
      final page = await document.getPage(1);
      //print("converting to image");
      final pageImage = await page.render(width: page.width, height: page.height,
      format: PdfPageImageFormat.png);
      await page.close();
      certtemp.add(Image.memory(pageImage!.bytes));
      //print("done!!!!!!!");
    } on PlatformException catch (error) {
      print("@@: " + error.details.toString());
    }
    //setLoading(false);
  }
  getteamcertificate() async {
    setLoading(true);
    var res = await ApiModel().getCertificate(widget.type, widget.id);

    Certificate? _certificate;
    // print(res);
    TeamCertificate.clear();
     certtemp.clear();
    if (res != null && res['status']) {
      for (var item in res['data']) {
        print("@: ${item.toString()}");
        _certificate = Certificate.fromJson(item);
        await pdftoimg(_certificate.certImg.toString());
        TeamCertificate.add(_certificate);
//  herosNameIdTeams.add(_herosName.id!.toString());

      }
      setLoading(false);
      print(nationalities1);
      // nationalId = leagueModel!.data![1]!.id.toString();
      setState(() {});
    }
    setLoading(false);
  }

  getHeroCertificate() async {
    setLoading(true);
    var res = await ApiModel().getherosCertificate(widget.type, widget.id);

    Certificate? _certificate;
    // print(res);
    TeamCertificate.clear();
    certtemp.clear();
    if (res != null && res['status']) {
      for (var item in res['data']) {
        _certificate = Certificate.fromJson(item);
        pdftoimg(_certificate.certImg.toString());
        TeamCertificate.add(_certificate);
//  herosNameIdTeams.add(_herosName.id!.toString());

      }
      setLoading(false);
      print(nationalities1);
      // nationalId = leagueModel!.data![1]!.id.toString();
      setState(() {});
    }
  }

  getMomentsCertificate() async {
    setLoading(true);
    var res = await ApiModel().getmomeCertificate(widget.type, widget.id);

    Certificate? _certificate;
    // print(res);
    TeamCertificate.clear();
    certtemp.clear();
    if (res != null && res['status']) {
      for (var item in res['data']) {
        _certificate = Certificate.fromJson(item);
        pdftoimg(_certificate.certImg.toString());
        TeamCertificate.add(_certificate);
//  herosNameIdTeams.add(_herosName.id!.toString());

      }
      setLoading(false);
      print(nationalities1);
      // nationalId = leagueModel!.data![1]!.id.toString();
      setState(() {});
    }
  }

  // var nickName;
  List<Certificate> TeamCertificate = [];

  @override
  void initState() {
    getcertificate();
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //  reverseDuration: Duration(seconds: 6),
      duration: const Duration(milliseconds: 500),
    );
    _offsetFloat = Tween(begin: Offset(5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller!,
    ));

    _offsetFloat!.addListener(() {
      setState(() {});
    });
    _controller!.forward();
  }

  TextEditingController _certificateName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ThemeProvider>(context).theme1model;
    var size = MediaQuery.of(context).size;
    setState(() {
      nameCert = _certificateName;
    });
    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),

            ///appbar
            MenuAppbar(),
            SizedBox(height: size.height * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                            child: VariableText(
                                text: "Choose your design!",
                                fontcolor: primaryColorW,
                                fontsize: size.height * 0.024,
                                fontFamily: fontSemiBold,
                                max_lines: 1,
                                textAlign: TextAlign.center),
                          )
                  ],
                ),
                SizedBox(height: size.height * 0.02),

                if(isLoading)
                  ...[
                    SizedBox(height: size.height * 0.30),
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                if(!isLoading)
                  ...[
                    ///Name
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.20),
                      child: MyRoundTextField(
                        text: "Enter name",
                        lenght: 20,
                        fontColor: textColor1,
                        cont: _certificateName,
                        hintColor: textColor3,
                        filled: true,
                        filledColor: primaryColorW,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      //color: Colors.red,
                      alignment: Alignment.center,
                      height: size.height * 0.50,
                      width: size.width,
                      child: SlideTransition(
                        position: _offsetFloat!,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: certtemp.length,
                          controller: PageController(
                              viewportFraction: 0.60,
                              keepPage: true,
                              initialPage: 0),
                          onPageChanged: (int index) => setState(() {
                            indexx = index;
                          }),
                          itemBuilder: (_, i) {
                            return Transform.scale(
                                scale: i == indexx ? 1 : 0.8,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      certId=TeamCertificate[indexx].id!.toString();
                                    });

                                  },
                                  child: Container(
                                      child: Stack(
                                        children: [
                                          /*Positioned(
                                    child: certtemp.isNotEmpty?
                                    CachedNetworkImage(
                                      imageUrl:
                                         certtemp[i].toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ):Container(),
                                    //  Image.network(TeamCertificate[i].img.toString(),fit: BoxFit.cover,)
                                  ),*/
                                          Positioned(
                                            child: certtemp.isNotEmpty?
                                            Image(image: certtemp[i].image, fit: BoxFit.cover)
                                                :
                                            Container(),
                                            //  Image.network(TeamCertificate[i].img.toString(),fit: BoxFit.cover,)
                                          ),
                                          Positioned(
                                            top: widget.type == "Digital"
                                                ? size.height * 0.325
                                                : size.height * 0.280,
                                            right: size.width * 0.05,
                                            left: size.width * 0.05,
                                            child: Container(
                                              width: size.width * 0.255,
                                              height: size.height * 0.035,

                                              child: VariableText(
                                                  text: _certificateName.text
                                                      .toUpperCase(),
                                                  fontcolor:widget.type == "Digital"?textColorW:textColorB,
                                                  fontsize: size.height * 0.014,
                                                  fontFamily: fontSemiBold,
                                                  max_lines: 1,
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                        ],
                                      )),
                                ));
                          },
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: VariableText(
                        text: "View Full Screen",
                        fontcolor: primaryColorW,
                        fontsize: size.height * 0.010,
                        fontFamily: fontMedium,
                        max_lines: 1,
                        textAlign: TextAlign.center,
                        underlined: true,
                      ),
                    ),
                    MyButton(
                      btnHeight: size.height * 0.055,
                      btnWidth: size.width * 0.60,
                      btnColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                      btnRadius: 200,
                      btnTxt: "Continue",
                      fontSize: size.height * 0.018,
                      fontFamily: fontSemiBold,
                      weight: FontWeight.w500,
                      txtColor: Theme.of(context).iconTheme.color,
                      onTap: () {
                        if(_certificateName.text.isEmpty){
                          customToast("Enter your Name");
                        }else{
                          setState(() {
                            certId=TeamCertificate[indexx].id!.toString();
                          });
                          Navigator.push(
                              context, SwipeLeftAnimationRoute(widget: BuyScreen(CertificateName:_certificateName.text.trim(),type:widget.type.toString(),id: certId.toString(),)));


                        }
                      },
                    ),
                  ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
