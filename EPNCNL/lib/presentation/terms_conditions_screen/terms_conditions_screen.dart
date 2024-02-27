import 'package:flutter/material.dart';
import 'package:meowlish/core/app_export.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key})
      : super(
          key: key,
        );

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
                'Terms & Conditions',
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 34.h,
            top: 69.v,
            right: 34.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Condition & Attending",
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 10.v),
              Container(
                width: 351.h,
                margin: EdgeInsets.only(
                  left: 1.h,
                  right: 7.h,
                ),
                child: Text(
                  "At enim hic etiam dolore. Dulce amarum, leve asperum, prope longe, stare movere, quadratum rotundum. At certe gravius. Nullus est igitur cuiusquam dies natalis. Paulum, cum regem Persem captum adduceret, eodem flumine invectio?\n\nQuare hoc videndum est, possitne nobis hoc ratio philosophorum dare.\nSed finge non solum callidum eum, qui aliquid improbe faciat, verum etiam praepotentem, ut M.\nEst autem officium, quod ita factum est, ut eius facti probabilis ratio reddi possit.",
                  maxLines: 13,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmall15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 18.v),
              Text(
                "Terms & Use",
                style: CustomTextStyles.titleLarge20,
              ),
              SizedBox(height: 11.v),
              Container(
                width: 357.h,
                margin: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Ut proverbia non nulla veriora sint quam vestra dogmata. Tamen aberramus a proposito, et, ne longius, prorsus, inquam, Piso, si ista mala sunt, placet. Omnes enim iucundum motum, quo sensus hilaretur. Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba. Quibusnam praeteritis? Portenta haec esse dicit, quidem hactenus; Si id dicis, vicimus. Qui ita affectus, beatum esse numquam probabis; Igitur neque stultorum quisquam beatus neque sapientium non beatus.\n\nDicam, inquam, et quidem discendi causa magis, quam quo te aut Epicurum reprehensum velim. Dolor ergo, id est summum malum, metuetur semper, etiamsi non ader.",
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmall15.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
