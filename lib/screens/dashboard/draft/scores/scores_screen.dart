import 'dart:async';

import 'package:fan_hall/controller/auth/league_api.dart';
import 'package:fan_hall/models/getAllUser.dart';
import 'package:fan_hall/models/score_model.dart';
import 'package:fan_hall/widgets/constants.dart';
import 'package:fan_hall/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/common.dart';
import '../draft_success_screen.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  bool hasSubscription = false;
 String? selectedyears;
  String? selectedweek;
 bool isLoading = false;
 List<ScoreModel> allteamsScores = [];
 List<String> allyears = ["2022"];
 List<String> allweeks = ["Week 18"];
  int indexx = 0;
  DateFormat chatTimeFormatter = DateFormat("hh:mm");
  late Timer _timer;

  final interval = const Duration(seconds: 5);
  setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }



   getteamScorebyweek(String week) async {
    setLoading(true);
    // var userDetails = Provider.of<UserModel>(context, listen: false);
    var response = await ApiModel.getScorebyweek(accessToken.toString(),week.toString());
    if (response != null) {
      allteamsScores.clear();
      if (response['status']) {
        for (var item in response['data']) {
          allteamsScores.add(ScoreModel.fromJson(item));
        }
      
      }
      print("length hai ${allteamsScores.length}");
       startTimer(1);
      setLoading(false);
      // startTimer(1);
    } else {
      allteamsScores.clear();
      setLoading(false);
      Fluttertoast.showToast(
          msg: "Try again later", toastLength: Toast.LENGTH_SHORT);
    }
  }


   getteamScore() async {
    setLoading(true);
    // var userDetails = Provider.of<UserModel>(context, listen: false);
    var response = await ApiModel.getScore(accessToken.toString());
    if (response != null) {
      allteamsScores.clear();
      if (response['status']) {
        for (var item in response['data']) {
          allteamsScores.add(ScoreModel.fromJson(item));
        }
      
      }
      print("length hai ${allteamsScores.length}");
       startTimer(1);
      setLoading(false);
      // startTimer(1);
    } else {
      allteamsScores.clear();
      setLoading(false);
      Fluttertoast.showToast(
          msg: "Try again later", toastLength: Toast.LENGTH_SHORT);
    }
  }
   updateScoreList() async {
    // setLoading(true);
    // var userDetails = Provider.of<UserModel>(context, listen: false);
 

    var response = await ApiModel.getScore(accessToken.toString());
    if (response != null) {
      allteamsScores.clear();
      if (response['status']) {
        for (var item in response['data']) {
          allteamsScores.add(ScoreModel.fromJson(item));
        }
      
      }
      print("length hai ${allteamsScores.length}");
       startTimer(1);
      setLoading(false);
      // startTimer(1);
    } else {
      allteamsScores.clear();
      setLoading(false);
      Fluttertoast.showToast(
          msg: "Try again later", toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    
    getteamScore();
    super.initState();

  }
   startTimer(int milliseconds) {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      if (mounted) {
        updateScoreList();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * horizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
               Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: size.height * 0.05,
                        child: InputDecorator(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: primaryColorW,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 1.0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 1.0)),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                          'assets/icons/ic_dropdown.png',
                                          color: textColor1,
                                          scale: 2),
                                    ),
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VariableText(
                                        text: "Year",
                                        fontsize: size.height * 0.017,
                                        fontcolor: textColor1,
                                        fontFamily: fontMedium,
                                      ),
                                    ),
                                    value: selectedyears,
                                    dropdownColor: primaryColorW,
                                    isExpanded: true,
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedyears = value;
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: size.height * 0.017,
                                        color: textColor1),
                                    items:allyears
                                        .map<DropdownMenuItem<String>>(
                                            (String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: VariableText(
                                            text: item,
                                            fontsize: size.height * 0.017,
                                            fontcolor: textColor1,
                                            fontFamily: fontMedium,
                                          ),
                                        ),
                                      );
                                    }).toList())))),
                  ),
                  SizedBox(width: size.width * 0.01),
                  Expanded(
                    child: SizedBox(
                        height: size.height * 0.05,
                        child: InputDecorator(
                             decoration: InputDecoration(
                              filled: true,
                              fillColor: primaryColorW,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 2.0)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                      color: primaryColorW, width: 2.0)),
                              contentPadding: EdgeInsets.all(10),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Image.asset(
                                          'assets/icons/ic_dropdown.png',
                                          color: textColor1,
                                          scale: 2),
                                    ),
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: VariableText(
                                        text: "weeks",
                                        fontsize: size.height * 0.017,
                                        fontcolor: textColor1,
                                        fontFamily: fontMedium,
                                      ),
                                    ),
                                    value: selectedweek,
                                    dropdownColor: primaryColorW,
                                    isExpanded: true,
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                    onChanged: (String? value)async{
                                      setState(() {
                                        selectedweek = value;
                                        // allUserList2.clear();
                                      });
                                      getteamScorebyweek(selectedweek.toString());
                                    //  if(selectedTeam==user.team!.name){
                                    //  await getUserListbyteam(teamId!);
                                    //  print(teamId);
                                    //  }if(selectedTeam=="All NFL teams"){
                                    //   await  getUserList();
                                    //  }
                                    //  else{
                                    //  await getUserList();
                                    //  }
                                     

                                    },
                                    style: TextStyle(
                                        fontSize: size.height * 0.017,
                                        color: textColor1),
                                    items:allweeks
                                        .map<DropdownMenuItem<String>>(
                                            (String item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: VariableText(
                                            text: item,
                                            fontsize: size.height * 0.017,
                                            fontcolor: textColor1,
                                            fontFamily: fontMedium,
                                          ),
                                        ),
                                      );
                                    }).toList())))),
                  ),
                ],
              ),
            SizedBox(height: size.height * 0.03),
           isLoading?CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
           ): Container(
            height: size.height * 0.9,
             child: ListView.builder(
                      itemCount: allteamsScores.length,
                     
                      
                      itemBuilder: (_, index){
                        return  
                        
                        renderScore(context,allteamsScores[index]);
             
              }),
           ),
            // renderScore(context),
            // Divider(color: primaryColorB, thickness: 2, height: size.height * 0.03),
            // renderScore(context),
            // Divider(color: primaryColorB, thickness: 2, height: size.height * 0.03),
            // renderScore(context),
            // Divider(color: primaryColorB, thickness: 2, height: size.height * 0.03),
            // renderScore(context),
          
            // renderScore(context),
          SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  renderScore(BuildContext context ,ScoreModel list ){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          //color: Colors.red,
          height: size.height * 0.16,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///first
                        ///
                     
                        Row(
                          children: [
                            Image.network(list.teamLogo1!, scale: 8),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              child: VariableText(
                                text: list.team1,
                                fontcolor: primaryColorW,
                                fontsize: size.height * 0.014,
                                fontFamily: fontBold,
                                max_lines: 1,
                              ),
                            ),
                            VariableText(
                              text: list.team1Score,
                              fontcolor: primaryColorW,
                              fontsize: size.height * 0.014,
                              fontFamily: fontBold,
                              max_lines: 1,
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                                child: Image.asset("assets/icons/scroes_active.png", scale: 2)
                            )
                          ],
                        ),
                        ///second
                        Row(
                          children: [
                            Image.network(list.teamLogo2!, scale: 8),
                            SizedBox(width: size.width * 0.02),
                            Expanded(
                              child: VariableText(
                                text: list.team2,
                                fontcolor: primaryColorW,
                                fontsize: size.height * 0.014,
                                fontFamily: fontBold,
                                max_lines: 1,
                              ),
                            ),
                            VariableText(
                              text: list.team2Score,
                              fontcolor: primaryColorW,
                              fontsize: size.height * 0.014,
                              fontFamily: fontBold,
                              max_lines: 1,
                            ),
                            SizedBox(
                                width: size.width * 0.05,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ///divider
                  Container(
                    height: size.height * 0.16,
                    width: 2,
                    color: Color(0xFF555555),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        VariableText(
                          text: "Final",
                          fontcolor: primaryColorW,
                          fontsize: size.height * 0.014,
                          fontFamily: fontSemiBold,
                          max_lines: 1,
                        ),
                        VariableText(
                          text: list.matchTime,
                          fontcolor: primaryColorW,
                          fontsize: size.height * 0.014,
                          fontFamily: fontRegular,
                          max_lines: 1,
                          line_spacing: 1.6,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
          Divider(color: Color(0xFF555555), thickness: 2, height: size.height * 0.03),
      ],
    );
  }
  renderNoSub(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.02),
        Stack(
          children: [
            Image.asset("assets/images/no_draft_1.png", fit: BoxFit.fitWidth),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/no_draft_2.png", scale: 2),
            )
          ],
        ),
        SizedBox(height: size.height * 0.02),
        MyButton(
          btnHeight: size.height * 0.055,
          btnWidth: size.width * 0.50,
          btnColor: Theme.of(context).primaryColor,
          borderColor: Theme.of(context).primaryColor,
          btnRadius: 200,
          btnTxt: "Access now",
          fontSize: size.height * 0.018,
          fontFamily: fontMedium,
          weight: FontWeight.w400,
          txtColor: textColor1,
          onTap: (){
            setState(() {
              hasSubscription = true;
            });
            Navigator.push(
                context,
                SwipeLeftAnimationRoute(widget: DraftSuccessScreen()));
          },
        ),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: VariableText(
                  text: "Unlock your VIP experience for just: \$4.90 USD monthly",
                  fontcolor: primaryColorW,
                  fontsize: size.height * 0.012,
                  fontFamily: fontMedium,
                  max_lines: 1,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
