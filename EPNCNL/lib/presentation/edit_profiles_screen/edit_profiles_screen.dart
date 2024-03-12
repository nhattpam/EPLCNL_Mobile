import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meowlish/core/app_export.dart';
import 'package:meowlish/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:meowlish/widgets/custom_elevated_button.dart';
import 'package:meowlish/widgets/custom_icon_button.dart';
import 'package:meowlish/widgets/custom_text_form_field.dart';

import '../../data/models/accounts.dart';
import '../../network/network.dart';

class EditProfilesScreen extends StatefulWidget {
  EditProfilesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  EditProfilesScreenState createState() => EditProfilesScreenState();
}

class EditProfilesScreenState extends State<EditProfilesScreen> {
  late Account? account = Account();

  DateTime? selectedDate;

  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('84');

  TextEditingController phoneNumberController = TextEditingController();

  List<String> dropdownItemList = [
    "Male",
    "Female",
  ];

  String _imagePath = "";
  String _image = "";
  final picker = ImagePicker();
  Dio dio = Dio();


  @override
  void initState() {
    super.initState();
    fetchAccountData();
  }

  Future<void> fetchAccountData() async {
    Account acc = await Network.getAccount();

    setState(() {
      // Set the list of pet containers in your state
      account = acc;
    });
  }
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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              width: 300,
              height: 100, // Add margin
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 34.h,
                  vertical: 40.v,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 26.v),
                    SizedBox(
                      height: 91.v,
                      width: 90.h,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 90.adaptSize,
                              width: 90.adaptSize,
                              child: _image == ''
                                  ? (account?.imageUrl != null && account!.imageUrl!.isNotEmpty
                                  ? Image.network(
                                account!.imageUrl!,
                                fit: BoxFit.cover,
                              )
                                  : Center(child: CircularProgressIndicator()))
                                  : Image.network(
                                _image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 3.h),
                            child: CustomIconButton(
                                onTap: (){
                                  _pickImage();
                                },
                                height: 32.adaptSize,
                                width: 32.adaptSize,
                                padding: EdgeInsets.all(7.h),
                                decoration: IconButtonStyleHelper.outlinePrimary,
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 12.v,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.v),
                    _buildEmail(context),
                    SizedBox(height: 18.v),
                    _buildPassword(context),
                    SizedBox(height: 18.v),
                    _buildFullName(context),
                    SizedBox(height: 18.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 18.v),
                    _buildAddress(context),
                    SizedBox(height: 18.v),
                    _buildDateOfBirth(context),
                    SizedBox(height: 18.v),
                    _buildGender(context),
                    // CustomDropDown(
                    //   hintText: account?.gender != null ? 'Male' : 'Female',
                    //   items: dropdownItemList,
                    //   onChanged: (value) {},
                    // ),
                    SizedBox(height: 18.v),
                    _buildSeven(context),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildUpdate(context),
      ),
    );
  }


  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return
      CustomTextFormField(
      controller: fullNameController,
      hintText: account?.fullName ?? '',
      hintStyle: CustomTextStyles.titleSmallGray80001,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 21.v,
      ),
      borderDecoration: TextFormFieldStyleHelper.outlineBlack,
    );
  }
  Widget _buildEmail(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        account?.email ?? '',
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }
  Widget _buildAddress(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        account?.address ?? '',
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }
  // ////Update Password
  // Widget _buildPassword(BuildContext context) {
  //   String passwordHint = account?.password != null ? '*' * (account?.password?.length as int) : '';
  //   return CustomTextFormField(
  //     obscureText: true,
  //     textInputType: TextInputType.visiblePassword,
  //     controller: nameController,
  //     hintText: passwordHint,
  //     hintStyle: CustomTextStyles.titleSmallGray80001,
  //     contentPadding: EdgeInsets.symmetric(
  //       horizontal: 22.h,
  //       vertical: 21.v,
  //     ),
  //     borderDecoration: TextFormFieldStyleHelper.outlineBlack,
  //   );
  // }
  Widget _buildPassword(BuildContext context) {
    String passwordHint =
    account?.password != null ? '*' * (account?.password?.length as int) : '';
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: AppDecoration.outlineBlack9001.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.v),
                    Text(
                      passwordHint,
                      style: CustomTextStyles.titleSmallGray80001,
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


  Widget _buildGender(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        account?.gender != null ? 'Male' : 'Female',
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    String formattedDate = '';
    if (account?.dateOfBirth != null && account!.dateOfBirth!.isNotEmpty) {
      DateTime parsedDate = DateTime.parse(account?.dateOfBirth ?? '');
      formattedDate = "${parsedDate.day.toString().padLeft(2, '0')}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.year}";
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                decoration: AppDecoration.outlineBlack9001.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.v),
                    Text(
                      formattedDate.isNotEmpty ? formattedDate : 'Select Date of Birth',
                      style: CustomTextStyles.titleSmallGray80001,
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

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        account?.phoneNumber ?? '',
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Container(
      width: 360.h,
      padding: EdgeInsets.symmetric(
        horizontal: 22.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Text(
        account?.role?.name ?? '',
        style: CustomTextStyles.titleSmallGray80001,
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdate(BuildContext context) {
    return CustomElevatedButton(
      onPressed: (){
        if(_image.isEmpty){
          Network.updateProfile(
              account?.email ?? '',
              account?.password ?? '',
              fullNameController.text,
              account?.phoneNumber ?? '',
              account?.imageUrl ?? '',
              account?.dateOfBirth ?? '',
              account?.gender ?? false,
              account?.address ?? '',
              account?.isActive ?? true,
              account?.isDeleted ?? false,
              account?.createdDate ?? '',
              account?.createdBy ?? '',
              account?.note ?? '');
        }else{
          Network.updateProfile(
              account?.email ?? '',
              account?.password ?? '',
              fullNameController.text,
              account?.phoneNumber ?? '',
              _image,
              account?.dateOfBirth ?? '',
              account?.gender ?? false,
              account?.address ?? '',
              account?.isActive ?? true,
              account?.isDeleted ?? false,
              account?.createdDate ?? '',
              account?.createdBy ?? '',
              account?.note ?? '');
        }
        AwesomeDialog(
          context: context,
          animType: AnimType.scale,
          dialogType: DialogType.success,
          body: Center(
            child: Text(
              'Edit Success!!!!!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          btnOkOnPress: () {
            setState(() {
              Navigator.pop(context,true);
            });
          },
        )..show();

      },
      text: "Update",
      margin: EdgeInsets.only(
        left: 39.h,
        right: 39.h,
        bottom: 42.v,
      ),
    );
  }
}
