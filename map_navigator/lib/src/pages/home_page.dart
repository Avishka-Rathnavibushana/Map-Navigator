import 'package:flutter/material.dart';
import 'package:map_navigator/src/constants/constants.dart';
import 'package:map_navigator/src/pages/map_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Map Navigator',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        restorationId: 'homePage',
        itemCount: routeDetails.length,
        itemBuilder: (BuildContext context, int index) {
          final item = routeDetails[index];
          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trail ${item.place}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   //height: MediaQuery.of(context).size.width,
                    //   child: Image(
                    //     fit: BoxFit.contain,
                    //     image: AssetImage(
                    //       'assets/images/map 1.jpeg',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                leading: CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage(item.image),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => MapDetailPage(
                        routes: item.routes,
                        place: item.place,
                      ),
                    ),
                  );
                }),
          );
        },
        padding: const EdgeInsets.only(bottom: 30),
      ),
    );
  }
}
