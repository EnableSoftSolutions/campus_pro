import 'package:flutter/material.dart';
import '../../CONSTANTS/themeData.dart';
import '../../UTILS/fieldValidators.dart';

class ViewProfile extends StatefulWidget {
  static const routeName = "/view-profile";
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController guardianPhoneController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? _selectedGender = "Select";
  String? _selectedCategory = "Select";
  String? _selectedNationality = "Select";
  String? _selectedReligion = "Select";
  String? _selectedBloodGroup = "Select";

  bool editButton = false;

  @override
  void dispose() {
    nameController.dispose();
    dobController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    emailController.dispose();
    guardianPhoneController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
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
          title: Text("My Profile"),
          actions: [
            !editButton
                ? buildEditbutton(
                    title: "EDIT",
                    icon: Icons.edit,
                    onTap: () => setState(() {
                          editButton = !editButton;
                        }))
                : buildEditbutton(
                    title: "DONE",
                    icon: Icons.check,
                    size: 26,
                    onTap: () => setState(() {
                          editButton = !editButton;
                        })),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.width / 3.5,
                        width: MediaQuery.of(context).size.width / 3.5,
                        color: Colors.grey),
                    Container(
                      height: MediaQuery.of(context).size.width / 3.5,
                      width: MediaQuery.of(context).size.width / 1.75,
                      // color: Colors.green,
                      child: Center(
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Text(
                              "Akshay Syal",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              text: "Class XI-B",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " | ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "Adm no: 04",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildTextFields(
              label: "Name",
              controller: nameController,
              // validator: FieldValidators.passwordValidator,
            ),
            Row(
              children: [
                Expanded(
                  child: buildDropDown(
                    title: "Gender",
                    dropDownList: genderDropdownList,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: buildTextFields(
                      label: "Date of Birth",
                      controller: dobController,
                      // validator: FieldValidators.passwordValidator,
                    ),
                  ),
                ),
              ],
            ),
            buildTextFields(
              label: "Father Name",
              controller: fatherNameController,
              // validator: FieldValidators.passwordValidator,
            ),
            buildTextFields(
              label: "Mother Name",
              controller: motherNameController,
              // validator: FieldValidators.passwordValidator,
            ),
            buildTextFields(
              label: "Mobile Number",
              controller: phoneController,
              // validator: FieldValidators.passwordValidator,
            ),
            buildTextFields(
              label: "Guardian Mobile Number",
              controller: guardianPhoneController,
              // validator: FieldValidators.passwordValidator,
            ),
            buildTextFields(
              label: "Email Id",
              controller: emailController,
              // validator: FieldValidators.passwordValidator,
            ),
            Row(
              children: [
                Expanded(
                  child: buildDropDown(
                    title: "Category",
                    dropDownList: categoryDropdownList,
                  ),
                ),
                Expanded(
                  child: buildDropDown(
                    title: "Nationality",
                    dropDownList: nationalityDropdownList,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildDropDown(
                    title: "Religion",
                    dropDownList: religionDropdownList,
                  ),
                ),
                Expanded(
                  child: buildDropDown(
                    title: "Blood Group",
                    dropDownList: bloodGroupDropdownList,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                "Present Address",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            buildTextFields(
              label: "Address",
              controller: dobController,
              // validator: FieldValidators.passwordValidator,
            ),
          ],
        ),
      ),
    );
  }

  Container buildDropDown({String? title, List<String>? dropDownList}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabels(title ?? ""),
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffECECEC)),
            ),
            child: DropdownButton<String>(
              isDense: true,
              value: _selectedGender,
              key: UniqueKey(),
              isExpanded: true,
              underline: Container(),
              items: dropDownList!
                  .map((item) =>
                      DropdownMenuItem<String>(child: Text(item), value: item))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _selectedGender = val;
                  print("_selectedLeave: $val");
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextFields(
      {String? label,
      TextEditingController? controller,
      String Function(String?)? validator}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabels(label ?? ""),
          buildTextField(
            controller: controller,
            validator: validator,
          ),
        ],
      ),
    );
  }

  Text buildLabels(String label) {
    return Text(
      label,
      style: TextStyle(
        // color: Theme.of(context).primaryColor,
        color: Color(0xff313131),
      ),
    );
  }

  Container buildTextField({
    String Function(String?)? validator,
    @required TextEditingController? controller,
  }) {
    return Container(
      child: TextFormField(
        // obscureText: !obscureText ? false : true,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: "type here",
          hintStyle: TextStyle(color: Color(0xffA5A5A5)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          // suffixIcon: suffixIcon
          //     ? InkWell(
          //         onTap: () {
          //           setState(() {
          //             _showPassword = !_showPassword;
          //           });
          //         },
          //         child: !_showPassword
          //             ? Icon(Icons.remove_red_eye_outlined)
          //             : Icon(Icons.remove_red_eye),
          //       )
          //     : null,
        ),
      ),
    );
  }

  InkWell buildEditbutton(
      {String? title, IconData? icon, void Function()? onTap, double? size}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18.0)),
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xff7292CF),
                size: size ?? 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title ?? "",
                  style: TextStyle(
                      color: Color(0xff7292CF), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String>? genderDropdownList = ["Select", "Male", "Female", "Other"];

List<String> categoryDropdownList = [
  "Select",
  "BC",
  "BC-A",
  "GEN",
  "OBC",
  "SC",
  "ST",
  "SBC",
  "BC-B"
];

List<String>? nationalityDropdownList = ["Select", "INDIAN", "NEPALI"];

List<String>? religionDropdownList = [
  "Select",
  "HINDU",
  "MUSLIAN",
  "CHRISTIAN",
  "SIKH",
  "None"
];

List<String>? bloodGroupDropdownList = [
  "Select",
  "A+",
  "A-",
  "B+",
  "B-",
  "AB+",
  "AB-",
  "O+",
  "O-"
];
