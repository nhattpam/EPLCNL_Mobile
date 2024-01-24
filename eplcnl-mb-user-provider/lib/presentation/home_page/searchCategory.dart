import 'package:eplcnl/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

class SearchComic extends SearchDelegate {
  SearchComic({
    String hintText = "What are you looking for?",
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle:
              TextStyle(color: Color(0xff00c7a0), fontWeight: FontWeight.bold),
        );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close),
          color: Color(0xff00c7a0))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Color(0xff00c7a0),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  // @override
  // Widget buildResults(BuildContext context) {
  //   return FutureBuilder<List<Comic>>(
  //       future: _userList.getComicList(query: query),
  //       builder: (context, snapshot) {
  //         if (!snapshot.hasData) {
  //           return Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //         List<Comic>? data = snapshot.data;
  //         return ListView.builder(
  //             itemCount: data?.length,
  //             itemBuilder: (context, index) {
  //               String comicName = '${data?[index].comicName}';
  //               String comicImage = '${data?[index].image}';
  //               List<String> words =
  //                   comicName.split(' '); // Split the text into words
  //               int wordLimit = 5; // Set the word limit
  //               String limitedText = words.take(wordLimit).join(' ');
  //               return ListTile(
  //                 title: Row(
  //                   children: [
  //                     Container(
  //                       width: 100,
  //                       height: 100,
  //                       decoration: BoxDecoration(
  //                         color: Colors.deepPurpleAccent,
  //                         borderRadius: BorderRadius.circular(10),
  //                       ),
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(
  //                             3 * MediaQuery.of(context).size.width / 428),
  //                         child: Image.network(
  //                           comicImage,
  //                           fit: BoxFit.cover,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(width: 20),
  //                     Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             limitedText,
  //                             style: TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.w600),
  //                           ),
  //                           SizedBox(height: 10),
  //                           Text(
  //                             'Author: ${data?[index].author}',
  //                             style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w400,
  //                             ),
  //                           ),
  //                         ])
  //                   ],
  //                 ),
  //               );
  //             });
  //       });
  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // successbSh (479:333)
        padding: EdgeInsets.fromLTRB(32 * fem, 0 * fem, 32 * fem, 0 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            // image36G33 (479:361)
            margin: EdgeInsets.fromLTRB(1 * fem, 120 * fem, 0 * fem, 42 * fem),
            width: 153 * fem,
            height: 153 * fem,
          ),
          Container(
            // successxgZ (479:362)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
            child: Text(
              'Listen what you love',
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumOnPrimaryContainer
            ),
          ),
          Container(
            // youraccounthavebeencreated2gR (479:363)
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 48 * fem),
            child: Text(
              'Search for authors, stories, categories',
              maxLines: 1,
              textAlign: TextAlign.center,
                style: CustomTextStyles
                    .titleMediumOnPrimaryContainer
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
