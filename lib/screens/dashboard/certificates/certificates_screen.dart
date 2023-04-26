import 'package:cached_network_image/cached_network_image.dart';
import 'package:fan_hall/controller/auth/league_api.dart';
import 'package:fan_hall/models/get_nick.dart';
import 'package:fan_hall/models/showcase.dart';
import 'package:fan_hall/screens/dashboard/scan_screens/certificate_full_view.dart';
import 'package:flutter/material.dart';

import '../../../widgets/common.dart';
import '../../../widgets/constants.dart';
import '../../../widgets/style.dart';
import 'buy_certificate/1_pick_category.dart';

class CertificatesScreen extends StatefulWidget {
  final bool isshow;
  const CertificatesScreen({Key? key ,required this.isshow}) : super(key: key);

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
  String? selectedType;
  String? selectedSeason;
    bool isLoading = false;
  setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }
   List<ShowCase> TeamCertificate = [];
   List<String>show=["oky"];
getshowcasecertificate() async {
    setLoading(true);
    var res = await ApiModel().getShowcase();

    ShowCase? _certificate;
    // print(res);
    TeamCertificate.clear();
    if (res != null && res['status']) {
      for (var item in res['data']) {
        _certificate = ShowCase.fromJson(item);

        TeamCertificate.add(_certificate);
        show.add(_certificate.img.toString());


      }
      setLoading(false);
      
      // nationalId = leagueModel!.data![1]!.id.toString();
      setState(() {});
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    getshowcasecertificate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * horizontalPadding),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          ///filters
          Row(
            children: [
              Expanded(
                child: SizedBox(
                    height: size.height * 0.05,
                    child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: primaryColorW,
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        child:  DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset('assets/icons/ic_dropdown.png', color: textColor1, scale: 2),
                                ),
                                hint: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: VariableText(
                                    text: "Type",
                                    fontsize: size.height * 0.014,
                                    fontcolor: textColor2,
                                    fontFamily: fontMedium,
                                  ),
                                ),
                                value: selectedType,
                                dropdownColor: primaryColorW,
                                isExpanded: true,
                                onTap: (){
                                  FocusScope.of(context).unfocus();
                                },
                                onChanged: (String? value){
                                  setState(() {
                                    selectedType = value;
                                  });
                                },
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    color: textColor1
                                ),
                                items:
                                Constants.certType.map<DropdownMenuItem<String>>((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: VariableText(
                                        text: item,
                                        fontsize: size.height * 0.014,
                                        fontcolor: textColor1,
                                        fontFamily: fontSemiBold,
                                      ),
                                    ),
                                  );
                                }).toList()
                            ))
                    )
                ),
              ),
              SizedBox(width: size.width * 0.03),
              Expanded(
                child: SizedBox(
                    height: size.height * 0.05,
                    child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: primaryColorW,
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200),
                              borderSide: BorderSide(color: primaryColorW, width: 2.0)),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        child:  DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset('assets/icons/ic_dropdown.png', color: textColor1, scale: 2),
                                ),
                                hint: Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: VariableText(
                                    text: "Season",
                                    fontsize: size.height * 0.014,
                                    fontcolor: textColor2,
                                    fontFamily: fontMedium,
                                  ),
                                ),
                                value: selectedSeason,
                                dropdownColor: primaryColorW,
                                isExpanded: true,
                                onTap: (){
                                  FocusScope.of(context).unfocus();
                                },
                                onChanged: (String? value){
                                  setState(() {
                                    selectedSeason = value;
                                  });
                                },
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    color: textColor1
                                ),
                                items:
                                Constants.season.map<DropdownMenuItem<String>>((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: VariableText(
                                        text: item,
                                        fontsize: size.height * 0.014,
                                        fontcolor: textColor1,
                                        fontFamily: fontSemiBold,
                                      ),
                                    ),
                                  );
                                }).toList()
                            ))
                    )
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
           widget.isshow ?
          Expanded(
            child: GridView.builder(
                itemCount: show.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.width * 0.02,
                    mainAxisSpacing: size.height * 0.01,
                    mainAxisExtent: size.height * 0.36
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
                 if(index == 0){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                SwipeLeftAnimationRoute(widget: PickCertificateCategory())).then((value){
                                  if(value != null){
                                    getshowcasecertificate();
                                  }
                            });
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        VariableText(
                          text: "Buy new one",
                          fontcolor: primaryColorW,
                          fontsize: size.height * 0.015,
                          fontFamily: fontMedium,
                        )
                      ],
                    );
                 }
                  return Column(
                    children: [
                       CachedNetworkImage(
                                    imageUrl:show[index].toString(), height: size.height * 0.3125, fit: BoxFit.fitWidth,
                                   
                                    // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    //         CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                      //  Image.network(TeamCertificate[index].certificate!.certImg.toString(), height: size.height * 0.3125, fit: BoxFit.fitWidth)
                      ,
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/ic_certificate_nft.png", height: size.height * 0.03),
                          InkWell(
                            
                            onTap: (){
                               /*Navigator.push(context,
                                  SwipeLeftAnimationRoute(widget:CertificateFullview(image:show[index].toString())));*/
                            },
                            child: Image.asset("assets/icons/ic_certificate_zoom.png", height: size.height * 0.03)),
                          Image.asset("assets/icons/ic_certificate_share.png", height: size.height * 0.03),
                        ],
                      )
                    ],
                  );
                }),
          ) : isLoading ?
           Center(child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor)
           ) : Expanded(
            child: GridView.builder(
                itemCount: TeamCertificate.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:TeamCertificate.length ,
                    crossAxisSpacing: size.width * 0.02,
                    mainAxisSpacing: size.height * 0.01,
                    mainAxisExtent: size.height * 0.36
                ),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, int index) {
               
                  return Column(
                    children: [
                     CachedNetworkImage(
                                    imageUrl:TeamCertificate[index].certificate!.certImg.toString(), height: size.height * 0.3125, fit: BoxFit.fitWidth,
                                   
                                    // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    //         CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/icons/ic_certificate_nft.png", height: size.height * 0.03),
                          InkWell(
                            
                            onTap: (){
                               /*Navigator.push(context,
                                SwipeLeftAnimationRoute(widget:CertificateFullview(image:TeamCertificate[index].certificate!.certImg.toString())));*/
                            },
                            child: Image.asset("assets/icons/ic_certificate_zoom.png", height: size.height * 0.03)),
                          Image.asset("assets/icons/ic_certificate_share.png", height: size.height * 0.03),
                        ],
                      )
                    ],
                  );
                }),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
