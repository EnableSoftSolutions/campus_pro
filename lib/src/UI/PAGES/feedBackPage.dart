import 'package:campus_pro/src/CONSTANTS/themeData.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  static const routeName = "/feedback";
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController topicController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = "Complain";
  }

  @override
  void dispose() {
    super.dispose();
    topicController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            automaticallyImplyLeading: true,
            // leading: IconButton(
            //   onPressed: () => Navigator.pop(context),
            //   icon: Icon(
            //     Icons.arrow_back_ios_outlined,
            //     color: Colors.white,
            //   ),
            // ),
            title: Text("FeedBack"),
            centerTitle: true,
          ),
          body: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.white,
                        child: Column(children: [
                          buildRadioSelector(context),
                          buildTopicTextField(context),
                          SizedBox(
                            height: 20.0,
                          ),
                          buildSubjectTextField(context),
                          SizedBox(
                            height: 20.0,
                          ),
                          buildMessageTextField(context),
                          SizedBox(
                            height: 10.0,
                          ),
                          buildSendButton(context),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Container buildRadioSelector(BuildContext context) {
    return Container(
      child: Row(children: [
        new Radio(
          value: "Complain",
          groupValue: selectedValue,
          activeColor: Colors.blue,
          onChanged: (String? newValue) {
            setState(() {
              print(">>>>>>>>>>>>>>>1>>>>>>>>>>>>>>>>>$newValue");
              selectedValue = newValue;
            });
          },
        ),
        new Text(
          'Complain',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          value: "Suggestion",
          activeColor: Colors.blue,
          groupValue: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              print(">>>>>>>>>>>>>>>>2>>>>>>>>>>>>>>>>$newValue");
              selectedValue = newValue;
            });
          },
        ),
        new Text(
          'Suggestion',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ]),
    );
  }

  Container buildTopicTextField(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: topicController,
          style: TextStyle(fontSize: 16.0, color: Color(0xff323643)),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            hintText: "Topic",
            hintStyle: TextStyle(
                color: Color(
              0xff323643,
            )),
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Color(0xff323643)),
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  Container buildSubjectTextField(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLines: 2,
        style: TextStyle(fontSize: 16.0, color: Color(0xff323643)),
        controller: subjectController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          hintText: "Subject",
          hintStyle: TextStyle(fontSize: 16.0, color: Color(0xff323643)),
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xff323643)),
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  Container buildMessageTextField(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 16.0, color: Color(0xff323643)),
        controller: messageController,
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          hintText: "Message",
          hintStyle: TextStyle(fontSize: 16.0, color: Color(0xff323643)),
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xff323643)),
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }

  Container buildSendButton(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 1.0, top: 5.0, right: 1.0),
        child: Container(
          height: 50.0,
          width: double.infinity,
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
            onPressed: () {
              print(">>>>>>>>>>>>>>>>>>>>>changed press button");
            },
            child: Text(
              "Send",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
