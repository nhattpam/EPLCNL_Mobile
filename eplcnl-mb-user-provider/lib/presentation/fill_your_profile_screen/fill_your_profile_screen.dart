import 'dart:io';

import 'package:eplcnl/core/network/network.dart';
import 'package:eplcnl/presentation/register_now_screen/provider/register_now_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'models/fill_your_profile_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:eplcnl/core/app_export.dart';
import 'package:eplcnl/core/utils/validation_functions.dart';
import 'package:eplcnl/widgets/custom_drop_down.dart';
import 'package:eplcnl/widgets/custom_icon_button.dart';
import 'package:eplcnl/widgets/custom_phone_number.dart';
import 'package:eplcnl/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'provider/fill_your_profile_provider.dart';

class FillYourProfileScreen extends StatefulWidget {
  const FillYourProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FillYourProfileScreenState createState() => FillYourProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FillYourProfileProvider(),
      child: FillYourProfileScreen(),
    );
  }
}

class FillYourProfileScreenState extends State<FillYourProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false; // Add isLoading state variable
  DateTime? selectedDate;
  String _imagePath = "";
  final picker = ImagePicker();
  late FillYourProfileProvider fillYourProfileScreenProvider;

  @override
  void initState() {
    super.initState();
    fillYourProfileScreenProvider = Provider.of<FillYourProfileProvider>(context, listen: false);
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


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // Update the image path
      });
    }
  }
  Future<void> _registerUser() async {
    final fullName = fillYourProfileScreenProvider.fullNameController.text;
    final address = fillYourProfileScreenProvider.addressController.text;
    final phone = fillYourProfileScreenProvider.phoneNumberController.text;
    final gender = fillYourProfileScreenProvider.selectedCountry;
    // Map gender to 1 for Male and 0 for Female
    final dateOfBirth =
    selectedDate != null ? selectedDate!.toIso8601String() : "";

    setState(() {
      isLoading = true;
    });

    // Call the registerUser function from the API class
    await Network.registerUser(
      // email: email,
      // password: password,
      fullName: fullName,
      address: address,
      // gender: genderValue,
      dateOfBirth: dateOfBirth,
      phone: phone,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 65,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              width: 300,
              height: 30, // Add margin
              // decoration: BoxDecoration(
              //   color: Colors.orange,
              //   border: Border.all(
              //     color: Colors.black, // Set border color
              //     width: 0.0, // Set border width
              //   ),
              //   borderRadius: BorderRadius.circular(20.0), // Set border radius
              // ),
              // Set the background color for the text
              child: Text(
                'Fill Your Profile',
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
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                )
                              else
                                Center(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Colors.black,
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
                    _buildDateOfBirth(context),
                    SizedBox(height: 20.v),
                    _buildAddres(context),
                    SizedBox(height: 20.v),
                    _buildPhoneNumber(context),
                    SizedBox(height: 20.v),
                    Selector<FillYourProfileProvider, FillYourProfileModel?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.fillYourProfileModelObj,
                      builder: (context, fillYourProfileModelObj, child) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Adjust the offset to control the shadow's position
                              ),
                            ],
                          ),
                          child: CustomDropDown(
                            hintText: "lbl_gender".tr,
                            items:
                                fillYourProfileModelObj?.dropdownItemList ?? [],
                            onChanged: (value) {
                              context
                                  .read<FillYourProfileProvider>()
                                  .onSelected(value);
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 50.v),
                    _buildBUTTON(context),
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
    return Selector<FillYourProfileProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.fullNameController,
      builder: (context, fullNameController, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Adjust the offset to control the shadow's position
              ),
            ],
          ),
          child: CustomTextFormField(
            controller: fullNameController,
            hintText: "lbl_full_name".tr,
            hintStyle: CustomTextStyles.titleSmallGray80001,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 21.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Selector<FillYourProfileProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.nameController,
      builder: (context, nameController, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Adjust the offset to control the shadow's position
              ),
            ],
          ),
          child: CustomTextFormField(
            controller: nameController,
            hintText: "lbl_nick_name".tr,
            hintStyle: CustomTextStyles.titleSmallGray80001,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
            contentPadding: EdgeInsets.symmetric(
              horizontal: 22.h,
              vertical: 21.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    // return Selector<FillYourProfileProvider, TextEditingController?>(
    //   selector: (
    //     context,
    //     provider,
    //   ) =>
    //       provider.dateOfBirthController,
    //   builder: (context, dateOfBirthController, child) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
    //             spreadRadius: 2,
    //             blurRadius: 5,
    //             offset: Offset(0, 3), // Adjust the offset to control the shadow's position
    //           ),
    //         ],
    //       ),
    //       child: CustomTextFormField(
    //         controller: dateOfBirthController,
    //         hintText: "lbl_date_of_birth".tr,
    //         hintStyle: CustomTextStyles.titleSmallGray80001,
    //         prefix: Container(
    //           margin: EdgeInsets.fromLTRB(21.h, 20.v, 8.h, 20.v),
    //           child: CustomImageView(
    //             imagePath: ImageConstant.imgCalendar,
    //             height: 20.v,
    //             width: 18.h,
    //           ),
    //         ),
    //         prefixConstraints: BoxConstraints(
    //           maxHeight: 60.v,
    //         ),
    //         contentPadding: EdgeInsets.only(
    //           top: 21.v,
    //           right: 30.h,
    //           bottom: 21.v,
    //         ),
    //         borderDecoration: TextFormFieldStyleHelper.outlineBlack,
    //       ),
    //     );
    //   },
    // );
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
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                prefixIcon: IconButton(
                  icon: Icon(Icons.calendar_today,size: 20.v,),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'DOB is required';
                }
                return null;
              },
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
  Widget _buildAddres(BuildContext context) {
    return Selector<FillYourProfileProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.addressController,
      builder: (context, emailController, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Adjust the color and opacity as needed
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Adjust the offset to control the shadow's position
              ),
            ],
          ),
          child: CustomTextFormField(
            controller: emailController,
            hintText: "Address".tr,
            hintStyle: CustomTextStyles.titleSmallGray80001,
            contentPadding: EdgeInsets.only(
              top: 21.v,
              right: 30.h,
              bottom: 21.v,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlack,

          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Consumer<FillYourProfileProvider>(
      builder: (context, provider, child) {
        return CustomPhoneNumber(
          country: provider.selectedCountry ??
              CountryPickerUtils.getCountryByPhoneCode('1'),
          controller: provider.phoneNumberController,
          onTap: (Country value) {
            context.read<FillYourProfileProvider>().changeCountry(value);
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBUTTON(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _registerUser();
          onTapTxtVerify(context);
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
                "lbl_continue".tr,
                style: CustomTextStyles.titleMediumOnPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
  onTapTxtVerify(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.otpScreen,
    );
  }
}
