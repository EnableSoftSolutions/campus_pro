import 'package:campus_pro/src/UI/PAGES/payByCheque.dart';
import 'package:flutter/material.dart';
import 'package:campus_pro/src/DATA/MODELS/feeDummyData.dart';

import '../../CONSTANTS/themeData.dart';

class FeePayment extends StatefulWidget {
  static const routeName = "/fee-payment";
  @override
  _FeePaymentState createState() => _FeePaymentState();
}

class _FeePaymentState extends State<FeePayment> {
  List<String> feeTypeList = ['MAIN', 'TRANSPORT', 'HOSTEL'];
  List<String> monthList = ['Nov', 'Dec', 'Jan', 'Feb', 'Mar'];

  String _selectedFeeType = 'MAIN';
  String _selectedMonth = 'Nov';

  var scrollController = ScrollController();

  TabController? tabController;
  int _currentIndex = 0;

  void tabIndexChange(int tabIndex) {
    setState(() {
      _currentIndex = tabIndex;
    });
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
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
          ),
          title: Text("Fee Payment"),
        ),
        body: NestedScrollView(
          controller: scrollController,
          physics: ScrollPhysics(parent: PageScrollPhysics()),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  buildFeeDescription(context),
                  // Container(height: 300, color: Colors.blue),
                ]),
              ),
            ];
          },
          body: DefaultTabController(
            initialIndex: _currentIndex,
            length: 2,
            child: Column(
              children: [
                buildTabBar(context),
                Expanded(
                  child: TabBarView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildReceipts(context),
                      buildHistory(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildFeeDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   padding: const EdgeInsets.symmetric(
          //       vertical: 8.0, horizontal: 16.0),
          //   decoration: BoxDecoration(
          //     gradient: customGradient,
          //   ),
          //   child: Text(
          //     "Fee Details",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //         fontSize: 18),
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopDropdowns(context,
                    heading: "Fee Type",
                    selectedValue: _selectedFeeType,
                    currentList: feeTypeList),
                SizedBox(height: 16),
                buildTopDropdowns(context,
                    heading: "Month",
                    selectedValue: _selectedMonth,
                    currentList: monthList),
                SizedBox(height: 16),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildDetailsRow(
                    title: "Receipt No.",
                    dueAmount: "Due",
                    paidAmount: "Paid",
                    color: Theme.of(context).primaryColor),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildDetailsRow(
                    title: "Tuition Fee", dueAmount: "100", paidAmount: "100"),
                Divider(color: Colors.white, height: 10),
                buildDetailsRow(
                    title: "Transport Fee",
                    dueAmount: "100",
                    paidAmount: "100"),
                Divider(color: Colors.white, height: 10),
                buildDetailsRow(
                    title: "Transport Maintainence Fee",
                    dueAmount: "100",
                    paidAmount: "100"),
                Divider(color: Colors.white, height: 10),
                buildDetailsRow(
                    title: "Fine",
                    dueAmount: "",
                    paidAmount: "100",
                    color: Colors.red[400]),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildDetailsRow(
                    title: "Total Amount", dueAmount: "", paidAmount: "100"),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlineButton(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        width: 0.8,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, PayByCheque.routeName);
                      },
                      child: Text(
                        "By Cheque",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    FlatButton(
                      color: Colors.green[400],
                      onPressed: () {},
                      child: Text(
                        "Pay Online",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildTabBar(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: TabBar(
          unselectedLabelColor: Theme.of(context).primaryColor,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            gradient: customGradient,
            // color: Theme.of(context).primaryColor,
          ),
          // isScrollable: true,
          physics: ClampingScrollPhysics(),
          onTap: (int tabIndex) {
            print("tabIndex: $tabIndex");
            switch (tabIndex) {
              case 0:
                tabIndexChange(tabIndex);
                // getSample();
                break;
              case 1:
                tabIndexChange(tabIndex);
                // getReports();
                break;
              default:
                tabIndexChange(tabIndex);
                // getSample();
                break;
            }
          },
          tabs: [
            buildTabs(title: 'Fee Receipts', index: _currentIndex),
            buildTabs(title: 'Trans. History', index: _currentIndex),
          ],
          controller: tabController,
        ),
      ),
    );
  }

  Tab buildTabs({String? title, int? index}) {
    return Tab(
      child: Text(title ?? ""),
    );
  }

  Row buildTopDropdowns(BuildContext context,
      {String? heading, String? selectedValue, List<String>? currentList}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            child: Text(heading ?? "",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w600)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide())),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: DropdownButton<String>(
              isDense: true,
              value: selectedValue,
              key: UniqueKey(),
              isExpanded: true,
              underline: Container(),
              items: currentList!
                  .map((item) =>
                      DropdownMenuItem<String>(child: Text(item), value: item))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedValue = val.toString();
                  print("_selectedFeeType: $val");
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Container buildReceipts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: feeReceiptList.length,
        itemBuilder: (context, i) {
          var item = feeReceiptList[i];
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            child: Column(
              children: [
                buildRow(title: "Receipt No.", value: item.receiptNo),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildRow(title: "Month", value: "October"),
                Divider(color: Colors.white, height: 10),
                buildRow(title: "Payment Date", value: item.date),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildRow(title: "Total Amount", value: item.amount),
              ],
            ),
          );
        },
      ),
    );
  }

  Container buildHistory(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: feeReceiptList.length,
        itemBuilder: (context, i) {
          var item = feeReceiptList[i];
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffDBDBDB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildColumn(
                    title: "Transaction Id",
                    value: "WEBPayUBiz202008171304007188"),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildRow(title: "Transaction Date", value: "17 Aug 2020"),
                Divider(color: Colors.white, height: 10),
                buildColumn(
                    title: "Transaction Status",
                    value: "Pending Approval From School",
                    color: Colors.red[400]),
                Divider(color: Color(0xffDBDBDB), height: 20),
                buildRow(title: "Amount", value: '5570'),
              ],
            ),
          );
        },
      ),
    );
  }

  Row buildRow({String? title, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style:
              TextStyle(color: Color(0xff777777), fontWeight: FontWeight.w600),
        ),
        Text(
          value ?? "",
          style:
              TextStyle(color: Color(0xff3A3A3A), fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Row buildDetailsRow(
      {String? title, String? dueAmount, String? paidAmount, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: TextStyle(
              color: color ?? Color(0xff777777), fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(
              dueAmount ?? "",
              style: TextStyle(
                  color: color ?? Color(0xff3A3A3A),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 30),
            Text(
              paidAmount ?? "",
              style: TextStyle(
                  color: color ?? Color(0xff3A3A3A),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Column buildColumn({String? title, String? value, Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style:
              TextStyle(color: Color(0xff777777), fontWeight: FontWeight.w600),
        ),
        Text(
          value ?? "",
          style: TextStyle(
              color: color ?? Color(0xff3A3A3A), fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

// DefaultTabController(
//                 initialIndex: _currentIndex,
//                 length: 2,
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   child: Column(
//                     children: [
//                       buildTabBar(context),
//                       Expanded(
//                         child: TabBarView(
//                           // physics: NeverScrollableScrollPhysics(),
//                           children: [
//                             buildReceipts(context),
//                             buildHistory(context),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
