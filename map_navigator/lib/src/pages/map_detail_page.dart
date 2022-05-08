import 'package:flutter/material.dart';
import 'package:map_navigator/src/modals/route.dart';
import 'package:url_launcher/url_launcher.dart';

class MapDetailPage extends StatefulWidget {
  const MapDetailPage({Key? key, required this.routes, required this.place})
      : super(key: key);
  final List<MapRoute> routes;
  final String place;

  @override
  State<MapDetailPage> createState() => _MapDetailPageState();
}

class _MapDetailPageState extends State<MapDetailPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Text(
          widget.place,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              // height: MediaQuery.of(context).size.height -
              //     MediaQuery.of(context).padding.top -
              //     150,
              child: PageView(
                controller: pageController,
                physics: BouncingScrollPhysics(),
                children: [
                  ...widget.routes.map((route) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          // height: MediaQuery.of(context).size.height -
                          //     MediaQuery.of(context).padding.top -
                          //     150,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  route.name,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Image(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                      route.image,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.green[400],
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  alignment: Alignment.center,
                                  child: TextRow(
                                    text: "Distance",
                                    value: route.distance,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextRow(
                                  text: "Difficulty",
                                  value: route.dificulty,
                                ),
                                TextRow(
                                  text: "Elevation Gain",
                                  value: route.elevation,
                                ),
                                TextRow(
                                  text: "Approx. Time",
                                  value: route.time,
                                ),
                                TextRow(
                                  text: "Start Point",
                                  value: route.start,
                                  textSize: 20,
                                ),
                                TextRow(
                                  text: "Suitability",
                                  value: route.suitability,
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  color: Colors.blue,
                                  splashColor: Colors.blue[200],
                                  onPressed: () async {
                                    try {
                                      var uri = Uri.parse(route.link);
                                      if (await canLaunch(uri.toString())) {
                                        await launch(uri.toString());
                                      } else {
                                        throw 'Could not launch ${uri.toString()}';
                                      }
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      "Go to Map",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlatButton(
                    child: Container(
                      width: 50,
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onPressed: () {
                      pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                  ),
                  Container(
                    height: 35,
                    width: 2,
                    color: Colors.black,
                  ),
                  FlatButton(
                    child: Container(
                      width: 50,
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    onPressed: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  TextRow({
    Key? key,
    required this.text,
    required this.value,
    this.textSize = 28,
  }) : super(key: key);

  final String text;
  final String value;
  double textSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$text :',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ' ' + value,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
