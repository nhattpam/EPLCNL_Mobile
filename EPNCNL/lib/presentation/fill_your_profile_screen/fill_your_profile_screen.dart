import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dio/dio.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/widgets/custom_drop_down.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_phone_number.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../network/network.dart';
import '../otp_signup_screen/otp_signup_screen.dart';

class FillYourProfileScreen extends StatefulWidget {
  final String email;
  final String password;

  const FillYourProfileScreen({
    required this.email,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  FillYourProfileScreenState createState() => FillYourProfileScreenState();
}

class FillYourProfileScreenState extends State<FillYourProfileScreen> {
  String? selectedGender;

  DateTime? selectedDate;

  String _imagePath = "";
  String _image = "";

  final picker = ImagePicker();

  bool isLoading = false; // Add isLoading state variable
  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('84');

  TextEditingController phoneNumberController = TextEditingController();

  List<String> dropdownItemList = [
    "Male",
    "Female",
  ];
  EmailOTP myauth = EmailOTP();

  @override
  void initState() {
    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  Dio dio = Dio();

  Future<void> _registerUser() async {
    final email = widget.email;
    final password = widget.password;
    final fullName = fullNameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final imageUrl = _image; // await the result
    bool genderValue = selectedGender == 'Male' ? true : false;
    final dateOfBirth =
        selectedDate != null ? selectedDate!.toIso8601String() : "";

    setState(() {
      isLoading = true;
    });

    // Call the registerUser function from the API class
    await Network.registerUser(
      email: email,
      password: password,
      fullName: fullName,
      address: address,
      gender: genderValue,
      dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber,
      imageUrl: imageUrl, // fix parameter name
    );
  }

  Future<String> _uploadImage(File imageFile) async {
    try {
      String url =
          "https://nhatpmse.twentytwo.asia/api/accounts/image"; // Replace with your API endpoint
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path),
      });

      Response response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        // Image uploaded successfully, you can handle the response here
        print("Image uploaded successfully. Link: ${response.data}");
        setState(() {
          _image = response.data;
        });
        return response.data;
      } else {
        // Handle error
        print("Error uploading image. StatusCode: ${response.statusCode}");
      }
    } catch (error) {
      // Handle error
      print("Error uploading image: $error");
    }
    return "";
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });

      await _uploadImage(File(_imagePath));
    }
  }

  Future<void> onContinue() async {
    if (_formKey.currentState!.validate()){
      {
        myauth.setSMTP(
            host: "smtp.gmail.com",
            auth: true,
            username: "meowlish.company@gmail.com",
            password: "ybpy zzfk taaa glbd",
            secure: "TLS",
            port: 587);
        myauth.setConfig(
            appEmail: "contact@westory.com",
            appName: "Email OTP",
            userEmail: widget.email,
            otpLength: 4,
            otpType: OTPType.digitsOnly);
        if (await myauth.sendOTP() == true) {
          AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.success,
            body: Center(
              child: Text(
                'Please check OTP in your email!!!',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            // title: 'Warning',
            // desc:   'This is also Ignored',
            btnOkOnPress: () {
              _registerUser();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OTPScreen(
                    email: widget.email,
                    myauth: myauth,
                  ),
                ),
              );
            },
          )..show();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Oops, OTP send failed"),
          ));
        }
      }
    }
  }
  String? validatorDOB(String? value) {
    if (value == null || value.isEmpty) {
      return 'DOB is required';
    }
    if (selectedDate == null) {
      // Handle case where selectedDate is null
      return 'Please select a valid date';
    }
    if (selectedDate!.isAfter(DateTime.now())) {
      // Here, the `!` operator is used to assert that `selectedDate` is not null
      return 'DOB cannot be in the future';
    }

    return null;
  }
  String? validateFullName(String? fullname) {
    if (fullname == null || fullname.isEmpty) {
      return 'Full Name cannot be empty';
    }
    return null;
  }
  String? validateGender(String? fullname) {
    if (fullname == null || fullname.isEmpty) {
      return 'Full Name cannot be empty';
    }
    return null;
  }
  String? validateNickName(String? nickname) {
    if (nickname == null || nickname.isEmpty) {
      return 'Nick Name cannot be empty';
    }
    return null;
  }
  String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address cannot be empty';
    }
    return null;
  }
  String? validateMobile(String value, Country selectedCountry) {
    String countryCode = selectedCountry.phoneCode ?? '';
    String pattern = r'(^(\+' + countryCode + '|0)' + r'[0-9]{8,9}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter a mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid ' + selectedCountry.name + ' mobile number';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowDownBlueGray900,
                            height: 20.v,
                            width: 26.h,
                            margin: EdgeInsets.only(
                              top: 5.v,
                              bottom: 4.v,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.h),
                            child: Text(
                              "Fill Your Profile",
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 42.v),
                    SizedBox(
                      height: 100.adaptSize,
                      width: 100.adaptSize,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: 131.48,
                          height: 119.63,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 131.48,
                                  height: 119.63,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF6F6F6),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFFE7E7E7)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              if (_imagePath != null)
                                Container(
                                  width: 131.48,
                                  height: 119.63,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: FileImage(File(_imagePath!)),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                )
                              else
                                Center(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.v),
                    _buildFullName(context),
                    SizedBox(height: 20.v),
                    _buildName(context),
                    SizedBox(height: 20.v),
                    _buildAddress(context),
                    SizedBox(height: 20.v),
                    _buildDateOfBirth(context),
                    SizedBox(height: 20.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 20.v),
                    Container(
                      child: CustomDropDown(
                        validator: validateGender,
                        hintText: "Gender",
                        items: dropdownItemList,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 50.v),
                    _buildButton(context),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        controller: fullNameController,
        hintText: "Full Name",
        hintStyle: CustomTextStyles.titleSmallGray80001,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 21.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        validator: validateFullName,
      ),
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        controller: nameController,
        hintText: "Nick Name",
        hintStyle: CustomTextStyles.titleSmallGray80001,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 22.h,
          vertical: 21.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        validator: validateNickName,
      ),
    );
  }

  Widget _buildAddress(BuildContext context) {
    return Container(
      child: CustomTextFormField(
        controller: addressController,
        hintText: "Address",
        hintStyle: CustomTextStyles.titleSmallGray80001,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 22.h,
          vertical: 21.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineBlack,
        validator: validateAddress,
      ),
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                filled: true,
                fillColor: Colors.white,
                labelStyle: CustomTextStyles.titleSmallGray80001,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 20.v,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              controller: TextEditingController(
                text: selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : "",
              ),
              validator: validatorDOB,
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Container(
      child: CustomPhoneNumber(
        validator: validateMobile,
        country: selectedCountry,
        controller: phoneNumberController,
        onTap: (Country value) {
          selectedCountry = value;
        }, text: '0774966XXX',
      ),
    );
  }

  /// Section Widget
  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onContinue();
        // _registerUser();
      },
      child: SizedBox(
        height: 60.v,
        width: 350.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.circleBorder30,
                ),
                child: Container(
                  height: 60.v,
                  width: 350.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 6.v,
                  ),
                  decoration: AppDecoration.outlineBlack900.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder30,
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomIconButton(
                        height: 48.adaptSize,
                        width: 48.adaptSize,
                        alignment: Alignment.centerRight,
                        child: CustomImageView(),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgFill1Primary,
                        height: 17.v,
                        width: 21.h,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 13.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Continue",
                style: CustomTextStyles.titleMediumOnPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
