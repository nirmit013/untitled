
import 'package:flutter/material.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text('Savings',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(

              child: Column(


                children: <Widget>[
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child: Text('Pay through UPI ',

                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 20.0,right: 20.0),
                    child: TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Enter UPI Number',
                        enabledBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.purple,
                          ),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 310.0,
                  ),

                  Container(
                    child: Column(

                      children: <Widget>[
                        Text('Search Contact',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 20.0,right: 20.0),
                          child: TextFormField(

                            decoration: InputDecoration(
                              hintText: 'Select Number',
                              enabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
                                  color: Colors.purple,
                                ),
                              ),

                            ),
                          ),
                        ),





                      ],
                    ),





                  ),
               SizedBox(
                 height: 45.0,
               ),

               Container(
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: <Widget>[
                     Padding(
                       padding:  EdgeInsets.only(left: 8.0),
                       child: CircleAvatar(

                         radius: 35.0,
                         backgroundImage: NetworkImage("https://content.fakeface.rest/male_23_84fb4a3a54582772ac5fc327c5dd26cb555889f2.jpg"),

                       ),
                     ),

                     SizedBox(
                       width: 20.0,
                     ),

                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Text('Nirmit Patel ',
                         ),
                         SizedBox(
                           height: 15.0,
                         ),

                         Text('7530009088',
                         ),
                       ],
                     ),
                   ],
                 ),
               ),







                ],
              ),





            ),


          ),



        );

  }
}









