

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:urlshortner/Providers/Url_shortner_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var now = DateTime.now();



  String day = "";
  String timeStamp = "";
  List<String> itemList = [];
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortnerState>(context, listen: true);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("URL SHORTNER"),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              "SHORTEN YOUR URL",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "WITH JUST ONE CLICK",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: state.urlController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Paste or type the URL",
                  hoverColor: Colors.white10,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children:<Widget> [
                  state.finalUrl.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("See your resultant link here",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                    ),),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            state.finalUrl,
                            style: TextStyle(
                              fontSize: 21.0,
                              color: Colors.black54,
                            ),
                          ),
                      ),

                  SizedBox(

                    width: width * 0.07,
                  ),
                  IconButton(

                    icon: Icon(Icons.content_copy),
                    onPressed: (){
                      Clipboard.setData(ClipboardData(text: state.finalUrl))
                          .whenComplete(() {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Link copied'),
                          duration: Duration(seconds: 1),
                        ));
                      });

                    },

                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$day",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$timeStamp",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: height / 22,
              width: width / 2,
              child: ElevatedButton(
                onPressed: () {
                  print(state.urlController.text);


                    day = "Created on " +
                        now.day.toString() +
                        "." +
                        now.month.toString() +
                        "." +
                        now.year.toString();

                    timeStamp = "at " + now.hour.toString() + ":" +
                        now.minute.toString() + ":" + now.second.toString();


                    state.handleGetLinkButton();

                    state.urlController.text = "";

                },
                child: Text(
                  "Generate my URL",
                  style: TextStyle(
                    fontSize: 18.0,
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
    );
  }
}
