import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = "/change-password";
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = new TextEditingController();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Change Password",
              style: textStyleRegular,
            ),
          ),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: ListView(children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text(
                        "Old Password",
                        style: textStyle12,
                      ),
                    ),
                    Container(
                        child: TextFormField(
                      cursorColor: Colors.black,
                      controller: oldPasswordController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Text(
                        "New Password",
                        style: textStyle12,
                      ),
                    ),
                    Container(
                        child: TextFormField(
                      cursorColor: Colors.black,
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Text(
                        "Retype Password",
                        style: textStyle12,
                      ),
                    ),
                    Container(
                        child: TextFormField(
                      cursorColor: Colors.black,
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE1E3E8)),
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 54.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [accentColor, primaryColor]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(13.0),
                        ),
                      ),
                      child: FlatButton(
                        //color: Colors.transparent,
                        onPressed: () {
                          print(">>>>>>>>>>>>>>>>>>>>>changed pass button");
                        },
                        child: Text(
                          "CHANGE PASSWORD",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          // style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
