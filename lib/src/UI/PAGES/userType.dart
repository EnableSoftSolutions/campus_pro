import 'package:bot_toast/bot_toast.dart';
import 'package:campus_pro/src/DATA/BLOC_CUBIT/GET_USER_TOKEN_CUBIT/get_user_token_cubit.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeModel.dart';
import 'package:campus_pro/src/UI/WIDGETS/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_pro/src/CONSTANTS/style.dart';
import 'package:campus_pro/src/DATA/MODELS/userTypeDummyModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CONSTANTS/themeData.dart';
import '../../DATA/BLOC_CUBIT/USER_TYPE_CUBIT/user_type_cubit.dart';
import '../../DATA/userUtils.dart';
import '../../UTILS/appImages.dart';
import 'feedBackPage.dart';
import 'homePage.dart';

class UserType extends StatefulWidget {
  static const routeName = "/user-type";
  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  void initState() {
    getSchools();
    super.initState();
  }

  getSchools() async {
    final uid = await UserUtils.idFromCache();
    final loginToken = await UserUtils.loginTokenFromCache();

    final data = {
      "OUserId": uid!,
      "Token": loginToken!,
    };

    context.read<UserTypeCubit>().userTypeCubitCall(data);
  }

  removeUserData() async {
    await UserUtils.removeUserType();
  }

  // printData() async {
  //   final uid = await UserUtils.idFromCache();
  //   final loginToken = await UserUtils.loginTokenFromCache();
  //   final userToken = await UserUtils.userTokenFromCache();
  //   print("uid: $uid, loginToken: $loginToken, userToken: $userToken");
  //   await UserUtils.removeUserToken();
  //   final userTokenRemoved = await UserUtils.userTokenFromCache();
  //   print("userTokenRemoved: $userTokenRemoved");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0.0),
        body: MultiBlocListener(
          listeners: [
            BlocListener<GetUserTokenCubit, GetUserTokenState>(
                listener: (context, state) {
              if (state is GetUserTokenLoadInProgress) {
                BotToast.showText(text: "Please wait...");
              }
              if (state is GetUserTokenLoadSuccess) {
                // printData();
                final String? userType = "student";
                Navigator.pushNamed(context, HomePage.routeName,
                    arguments: userType);
              }
              if (state is GetUserTokenLoadFail) {
                removeUserData();
                toastFailedNotification(state.failReason);
              }
            }),
          ],
          child: BlocConsumer<UserTypeCubit, UserTypeState>(
            listener: (context, state) {
              // if (state is GetOurSchoolLoadSuccess) {
              //  // toast("SignIn Successfully!");
              //   Navigator.pushNamedAndRemoveUntil(
              //       context, UserTypeList.routeName, (route) => false);
              // }
              if (state is UserTypeLoadFail) {
                toastFailedNotification(state.failReason);
              }
            },
            builder: (context, state) {
              if (state is UserTypeInProgress) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UserTypeLoadSuccess) {
                return buildSchoolList(context,
                    userTypeList: state.userTypeList);
              } else if (state is UserTypeLoadFail) {
                return buildSchoolList(context);
              } else {
                return Center(child: CircularProgressIndicator());
                // return buildSchoolList(context);
              }
            },
          ),
        ));
  }

  Flex buildSchoolList(BuildContext context,
      {List<UserTypeModel>? userTypeList}) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Column(
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                        itemCount: userTypeList?.length,
                        itemBuilder: (BuildContext context, int i) {
                          var item = userTypeList![i];
                          return InkWell(
                            onTap: () async {
                              await UserUtils.cacheUserTypeData(item);
                              final uid = await UserUtils.idFromCache();
                              final getToken = {
                                "OUserid": uid!,
                                "SchoolId": item.schoolId!,
                                "OrgId": item.organizationId!,
                                "StuEmpId": item.stuEmpId!,
                                "UserType": item.ouserType!,
                              };
                              context
                                  .read<GetUserTokenCubit>()
                                  .getUserTokenCubitCall(getToken);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Container(
                                    height: 90.0,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffE1E3E8)),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(children: [
                                      Expanded(
                                        child: Container(
                                          child: ListTile(
                                            leading: Image(
                                              image: NetworkImage(
                                                  item.logoImgPath!),
                                            ),
                                            title: Text(item.stuEmpName!,
                                                style: textStyleRegular14),
                                            subtitle: Text(
                                              item.schoolName!,
                                            ),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        thickness: 1.0,
                                        endIndent: 10,
                                        indent: 10,
                                        color: Color(0xffE1E3E8),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: 75.0,
                                          child: Text(
                                            item.ouserType!.toUpperCase() == "A"
                                                ? "Admin"
                                                : item.ouserType!
                                                            .toUpperCase() ==
                                                        "E"
                                                    ? "Employee"
                                                    : item.ouserType!
                                                                .toUpperCase() ==
                                                            "M"
                                                        ? "Manager"
                                                        : item.ouserType!
                                                                    .toUpperCase() ==
                                                                "S"
                                                            ? "Student"
                                                            : "",
                                            style: textStyleRegular14,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
