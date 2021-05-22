import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:flutter/material.dart';
import '../../CONSTANTS/themeData.dart';

class DateSheet extends StatefulWidget {
   static const routeName = "/exam-date-sheet";
  @override
  _DateSheetState createState() => _DateSheetState();
}

class _DateSheetState extends State<DateSheet> {

  List<String> dropdownValueList = <String>[
    'MONDAY TEST 1',
    'April Monday Test',
    'UNI TEST'
  ];
  String? dropdownValue;

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
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          title: Text("Exam Date Sheet",style: textStyleRegular,),
          centerTitle: true,
        ),
        body: Container(
           color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: [
              buildDropDownButton(context),
              examContainerBuilder(context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildDropDownButton(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 7.0,right: 7.0),
        child: Column(
          children: [
            Container(
              
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Exam:",style:TextStyle(color: Color(0xff3A3A3A),fontSize:18.0)
                  )),

            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 40.0,
              width: double.infinity,
            padding:EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  hint: Text(
                    "--SELECT--",
                  ),
                  iconSize: 20,
                  elevation: 16,
                  isExpanded: true,
                  dropdownColor: Color(0xffFFFFFF),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13.0,
                      ),
                  underline: Container(
                    color: Color(0xffFFFFFF),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      print(
                          ">>>>>>>>>>>selected values>>>>>>>>>>>>>>>>$dropdownValue");
                    });
                  },
                  items: dropdownValueList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


 Expanded examContainerBuilder(BuildContext context){
   return Expanded(
     child: Padding(
       padding: const EdgeInsets.all(7.0),
       child: ListView.builder(
         itemCount: 30,
         itemBuilder:(BuildContext context,int i){
           return Container(
             padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffDBDBDB)),
              ),  
             child:Column(
               mainAxisAlignment:MainAxisAlignment.start,
               children:[

                 Padding(
                   padding: const EdgeInsets.only(left:5.0,right: 5.0,top: 5.0),
                   child: Row(children: [
                
                    Expanded(child: Container(child: Text("Subject: Math",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff777777)),),)),
                    Expanded(child: Container(child: Text("Shift: Morning",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff777777)),),)),

                   ],),
                 ),
                
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                     Expanded(child: Container(child: Text("Date: 15 Apr 2021",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff777777)),),)),
                     Expanded(child: Container(child: Text("Time: 2:40 PM",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff777777)),),)),

                 ],),
                  ),
                
                 Padding(
                   padding: const EdgeInsets.only(left:5.0,right: 5.0,bottom: 5.0),
                   child: Container(
                     child: Text("Syllabus:\n"+"Relations and Functions | Algebra | Calculus | Vectors and  Three  - Dimensional Geometry | Linear Programming | Probability ",style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff3A3A3A)),),
                   ),
                 ),

               ]
             ),
           );
         },
         
         ),
     ),
   );
 }



}
