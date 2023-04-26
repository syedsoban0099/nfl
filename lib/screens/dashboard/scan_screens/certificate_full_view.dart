import 'package:cached_network_image/cached_network_image.dart';
import 'package:fan_hall/controller/auth/league_api.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../widgets/common.dart';
import '../../../widgets/style.dart';

class CertificateFullview extends StatefulWidget {
  final Image? image;
  const CertificateFullview({Key? key, this.image}) : super(key: key);

  @override
  State<CertificateFullview> createState() => _CertificateFullviewState();
}

class _CertificateFullviewState extends State<CertificateFullview> {
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor1,
          body: Column(
            children: [
              Stack(
                children: [
                  
                  SizedBox(
                    height: size.height * 0.6,
                    child:
                      Image(image: widget.image!.image, fit: BoxFit.fitWidth)
                  /*CachedNetworkImage(
                      imageUrl:widget.image!, fit: BoxFit.fitWidth,
                      height: size.height * 0.3125,

                      // progressIndicatorBuilder: (context, url, downloadProgress) =>
                      //         CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),*/
                  ),
                  Positioned(
                    right: size.width * 0.07,
                    top: size.height * 0.035,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(200))),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.close)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      btnHeight: size.height * 0.06,
                      btnWidth: size.width * 0.50,
                      btnColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                      btnRadius: 200,
                      btnTxt: "Do IT NFT(ETH)",
                      fontSize: size.height * 0.018,
                      fontFamily: fontMedium,
                      weight: FontWeight.w500,
                      txtColor: Theme.of(context).iconTheme.color,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: size.width * 0.04),
                    Icon(Icons.share, color: Theme.of(context).iconTheme.color)
                  ],
                ),
              )
            ],
          )),
    );
  }
}
