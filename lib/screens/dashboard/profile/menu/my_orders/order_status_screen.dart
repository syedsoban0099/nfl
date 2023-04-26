import 'package:fan_hall/screens/dashboard/certificates/buy_certificate/1_pick_category.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/common.dart';
import '../../../../../widgets/style.dart';

class OrderStatusScreen extends StatelessWidget {
  final String status;
  const OrderStatusScreen({Key? key,required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              ///appbar
              MenuAppbar(),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VariableText(
                      text: "Order Status",
                      fontcolor: primaryColorW,
                      fontsize: size.height * 0.016,
                      fontFamily: fontSemiBold,
                      max_lines: 1,
                      textAlign: TextAlign.center
                  )
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
                child: SizedBox(
                  height: size.height * 0.45,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Container(
                          //color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD9D9D9).withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(200)
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      //height: size.height * 0.15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(200),
                                            topRight: Radius.circular(200)
                                          )
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      //height: size.height * 0.15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      //height: size.height * 0.15,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(200),
                                              bottomRight: Radius.circular(200)
                                          )
                                      ),
                                    ),
                                  ),
                                  ///active
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(200),
                                              bottomRight: Radius.circular(200)
                                          )
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(200),
                                              bottomRight: Radius.circular(200)
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: Container(
                          //color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_order_approval.png", fit: BoxFit.cover,color:status=="League Approval"? Theme.of(context).primaryColor: textColor4),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_print.png", fit: BoxFit.cover,color:status=="Team Approval"? Theme.of(context).primaryColor: textColor4),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_print.png", fit: BoxFit.cover,color:status=="Printing"? Theme.of(context).primaryColor: textColor4),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_scan.png", fit: BoxFit.cover,color:status=="Framming"? Theme.of(context).primaryColor: textColor4),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_truk.png", fit: BoxFit.cover,color:status=="On Route"? Theme.of(context).primaryColor: textColor4),
                              ),
                              SizedBox(
                                height: size.height * 0.025,
                                child: Image.asset("assets/icons/ic_deliverd.png", fit: BoxFit.cover,color:status=="Delivered"? Theme.of(context).primaryColor: textColor4),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          //color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.height * 0.025,
                                child: Row(
                                  children: [
                                    VariableText(
                                        text: "League Approval",
                                        fontcolor:status=="League Approval"? Theme.of(context).primaryColor: textColor4,
                                        fontsize: size.height * 0.016,
                                        fontFamily: fontMedium,
                                        max_lines: 1
                                    ),
                                  ],
                                )
                              ),
                              SizedBox(
                                  height: size.height * 0.025,
                                  child: Row(
                                    children: [
                                      VariableText(
                                          text: "Team Approval",
                                          fontcolor:status=="Team Approval"? Theme.of(context).primaryColor: textColor4,
                                          fontsize: size.height * 0.016,
                                          fontFamily: fontMedium,
                                          max_lines: 1
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(
                                  height: size.height * 0.025,
                                  child: Row(
                                    children: [
                                      VariableText(
                                          text: "Printing",
                                          fontcolor:status=="Printing"? Theme.of(context).primaryColor: textColor4,
                                          fontsize: size.height * 0.016,
                                          fontFamily: fontMedium,
                                          max_lines: 1
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(
                                  height: size.height * 0.025,
                                  child: Row(
                                    children: [
                                      VariableText(
                                          text: "Framming",
                                          fontcolor:status=="Framming"? Theme.of(context).primaryColor: textColor4,
                                          fontsize: size.height * 0.016,
                                          fontFamily: fontMedium,
                                          max_lines: 1
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(
                                  height: size.height * 0.025,
                                  child: Row(
                                    children: [
                                      VariableText(
                                          text: "On Route",
                                          fontcolor:status=="On Route"? Theme.of(context).primaryColor:textColor4,
                                          fontsize: size.height * 0.016,
                                          fontFamily: fontMedium,
                                          max_lines: 1
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(
                                  height: size.height * 0.025,
                                  child: Row(
                                    children: [
                                      VariableText(
                                          text: "Delivered",
                                          fontcolor:status=="Delivered"? Theme.of(context).primaryColor:textColor4 ,
                                          fontsize: size.height * 0.016,
                                          fontFamily: fontMedium,
                                          max_lines: 1
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * horizontalPadding, vertical: size.height * 0.01),
                child: MyButton(
                  btnHeight: size.height * 0.055,
                  btnColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  btnRadius: 200,
                  btnTxt: "Shop More",
                  fontSize: size.height * 0.016,
                  fontFamily: fontMedium,
                  weight: FontWeight.w500,
                  txtColor: textColor1,
                  onTap: (){
                      Navigator.push(
                                context,
                                SwipeLeftAnimationRoute(widget: PickCertificateCategory()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * horizontalPadding, vertical: size.height * 0.01),
                child: MyButton(
                  btnHeight: size.height * 0.055,
                  btnColor: primaryColorW,
                  borderColor: primaryColorW,
                  btnRadius: 200,
                  btnTxt: "View Gallery",
                  fontSize: size.height * 0.016,
                  fontFamily: fontMedium,
                  weight: FontWeight.w500,
                  txtColor: textColor1,
                  onTap: (){},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
