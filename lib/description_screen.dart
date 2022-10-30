import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  final String name,description,image,phone,email,address;

  DescriptionScreen({required this.name, required this.description,
    required this.image, required this.phone, required this.email, required this.address});

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff4D7482),Color(0xFF87F9BB)],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:30, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image(image: NetworkImage(
                  widget.image
              ),),
            ),
            Container(
              child: Text(
                'Dr. '+widget.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
            Container(
              child: Text(
                'Psychatrist',
                style: TextStyle(
                    color: Colors.white54,
                    fontSize: 15
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          SizedBox(width: 30,),
                          Text(
                            "About Doctor",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:Color(0xFF2f2f51)
                            ),
                          ),
                        ]),
                    Container(
                      child: Text(widget.description),
                    ),
                    Container(
                      child: Text(
                        "Rating:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color:Color(0xFF2f2f51)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
