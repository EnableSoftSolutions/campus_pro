import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../CONSTANTS/themeData.dart';
import '../../UTILS/fieldValidators.dart';

class PayByCheque extends StatefulWidget {
  static const routeName = "/pay_by_cheque";
  @override
  _PayByChequeState createState() => _PayByChequeState();
}

class _PayByChequeState extends State<PayByCheque> {
  TextEditingController chequeNoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController bankDetailController = TextEditingController();
  TextEditingController depositedBankController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final _feeFormKey = GlobalKey<FormState>();

  File? _pickedImage;

  Future<File?> getImage({ImageSource source = ImageSource.gallery}) async {
    Navigator.pop(context);
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      print('Wow! Image selected.');
      final image = File(pickedFile.path);
      return image;
    } else {
      print('Ops! No Image selected.');
    }

    // setState(() {
    //   if (pickedFile != null) {
    //     _pickedImage = File(pickedFile.path);
    //     print('Wow! Image selected.');
    //   } else {
    //     print('Ops! No Image selected.');
    //   }
    // });
  }

  showUploadSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Upload via",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 60),
              child: Row(
                children: [
                  buildUploadOption(
                    context,
                    icon: Icons.camera_alt,
                    title: "Camera",
                    onTap: () async {
                      File? tempFile =
                          await getImage(source: ImageSource.camera);
                      if (mounted && tempFile != null) {
                        setState(() {
                          _pickedImage = tempFile;
                        });
                      }
                    },
                    // onTap: () => getImage(source: ImageSource.camera),
                  ),
                  buildUploadOption(
                    context,
                    icon: Icons.photo_library,
                    title: "Gallery",
                    onTap: () async {
                      File? tempFile =
                          await getImage(source: ImageSource.gallery);
                      if (mounted && tempFile != null) {
                        setState(() {
                          _pickedImage = tempFile;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Expanded buildUploadOption(BuildContext context,
      {IconData? icon, String? title, void Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Theme.of(context).accentColor, size: 28),
            Text(
              title.toString(),
              textScaleFactor: 1.0,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    chequeNoController.dispose();
    dateController.dispose();
    bankDetailController.dispose();
    depositedBankController.dispose();
    amountController.dispose();
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
          title: Text("Pay By Cheque"),
        ),
        body: Form(
          key: _feeFormKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextFields(
                          label: "Cheque No / Transaction No",
                          controller: chequeNoController,
                          validator: FieldValidators.chequeNoValidator,
                        ),
                        buildTextFields(
                          label: "Cheque Date / Transaction Date",
                          controller: dateController,
                          validator: FieldValidators.globalValidator,
                        ),
                        buildTextFields(
                          label: "Bank Details",
                          controller: bankDetailController,
                          validator: FieldValidators.globalValidator,
                        ),
                        buildTextFields(
                          label: "Deposited in Bank",
                          controller: depositedBankController,
                          validator: FieldValidators.globalValidator,
                        ),
                        buildTextFields(
                          label: "Amount",
                          controller: amountController,
                          validator: FieldValidators.globalValidator,
                        ),
                        buildImageUpload(context),
                        buildSignUpBtn(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSignUpBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [accentColor, primaryColor]),
      ),
      child: FlatButton(
        onPressed: () {
          if (_feeFormKey.currentState!.validate()) {
            print("Form is Validated");
          }
        },
        child: Text(
          "SAVE DETAILS",
          style:
              TextStyle(fontFamily: "BebasNeue-Regular", color: Colors.white),
        ),
      ),
    );
  }

  Padding buildImageUpload(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabels("Deposite Proof:"),
          Center(
            child: GestureDetector(
              onTap: () => showUploadSheet(),
              child: Container(
                height: 150,
                width: 150,
                decoration: new BoxDecoration(
                  color: Color(0xffFAFAFA),
                  border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Color(0xffECECEC)),
                ),
                child: _pickedImage != null
                    ? GestureDetector(
                        onTap: () => showUploadSheet(),
                        child: Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child:
                                  Image.file(_pickedImage!, fit: BoxFit.cover),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 30,
                                width: 150,
                                color: Colors.black54,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: FittedBox(
                                      child: Text(
                                    "Change",
                                    style: TextStyle(color: Colors.white70),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file,
                              color: Theme.of(context).accentColor, size: 28),
                          Text(
                            "Upload",
                            textScaleFactor: 1.0,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextFields(
      {String? label,
      TextEditingController? controller,
      String? Function(String?)? validator}) {
    return Container(
      // color: Colors.white,
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

  Padding buildLabels(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: TextStyle(
          // color: Theme.of(context).primaryColor,
          color: Color(0xff313131),
        ),
      ),
    );
  }

  Container buildTextField({
    String? Function(String?)? validator,
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
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(18.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
            gapPadding: 0.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffECECEC),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          hintText: "type here",
          hintStyle: TextStyle(color: Color(0xffA5A5A5)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
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
}
