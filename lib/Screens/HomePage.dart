import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final focusNode = FocusNode();
  String resultUrl = "See your resultant URL here";

  @override
  Widget build(BuildContext context) {
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
              height: 100.0,
            ),
            Text(
              "SHORTEN YOUR URL WITH JUST ONE CLICK",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: width / 4,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Paste or type the link",
                  hoverColor: Colors.white10,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "$resultUrl",
              style: TextStyle(
                fontSize: 21.0,
                color: Colors.black54,
              ),
            ),

            SizedBox(

              height: 35.0,
            ),
            SizedBox(

              height: height/20,
              width: width/8,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Generate my URL",
                style: TextStyle(
                  fontSize: 18.0,

                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
