import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../common/UserRecordManager.dart';
import '../common/set_height_and_width.dart';
import '../firebase/firebase_toast.dart';
import '../workouts/AbsWorkout.dart';

class abs_schedule extends StatefulWidget {
  const abs_schedule({Key? key}) : super(key: key);

  @override
  State<abs_schedule> createState() => _abs_scheduleState();
}

class _abs_scheduleState extends State<abs_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final legraisessetsController = TextEditingController();
  final legraisesrepsController = TextEditingController();
  final legraisesweightController = TextEditingController();

  final crunchessetsController = TextEditingController();
  final crunchesrepsController = TextEditingController();
  final crunchesweightController = TextEditingController();

  final bicyclesetsController = TextEditingController();
  final bicyclerepsController = TextEditingController();
  final bicycleweightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                'ABS',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'WORKOUTS',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => abs_workout()));
              },
              icon: Icon(Icons.help))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 53.0,
        color: Colors.black26,
        child: IconButton(
          padding: EdgeInsets.only(left: getwidth(context) * 0.05),
          alignment: Alignment.centerLeft,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.red,
            size: 27.0,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(
                left: getwidth(context) * 0.03,
                right: getwidth(context) * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
            ),
            width: getwidth(context),
            height: getheight(context) * 0.16,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      'Leg Raises',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    margin: EdgeInsets.only(left: getwidth(context) * 0.05),
                  ),
                  Spacer(),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage:
                          AssetImage("assets/images/legraises.png"),
                      radius: 35,
                    ),
                    margin: EdgeInsets.only(
                        top: getheight(context) * 0.01,
                        right: getwidth(context) * 0.05),
                  ),
                ],
              ),
              // SizedBox(height: getheight(context)*0.03,),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            width: getwidth(context),
                            height: getheight(context) * 0.9,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          'Track Your Workout',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 15, top: 20),
                                        width: getwidth(context) * 0.4,
                                        height: getheight(context) * 0.05,
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: getwidth(context),
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text(
                                        'Sets : ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.04),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white10,
                                      ),
                                      width: getwidth(context) * 0.18,
                                      height: getheight(context) * 0.07,
                                      child: FirebaseAnimatedList(
                                        query: ref
                                            .orderByChild('Email')
                                            .equalTo(_auth.currentUser?.email
                                                .toString()),
                                        itemBuilder: (context, snapshot,
                                            animation, index) {
                                          return Container(
                                            width: getwidth(context) * 0.17,
                                            height: getheight(context) * 0.07,
                                            child: Center(
                                              child: TextField(
                                                cursorColor: Colors.red,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                controller:
                                                    legraisessetsController,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Colors.white,
                                                    )),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      width: 2,
                                                      color: Colors.red,
                                                    ))),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.09),
                                    ),
                                    SizedBox(
                                      width: getwidth(context) * 0.02,
                                    ),
                                    Row(children: [
                                      Container(
                                        child: Text(
                                          'Reps : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.04),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white10,
                                        ),
                                        width: getwidth(context) * 0.18,
                                        height: getheight(context) * 0.07,
                                        child: FirebaseAnimatedList(
                                          query: ref
                                              .orderByChild('Email')
                                              .equalTo(_auth.currentUser?.email
                                                  .toString()),
                                          itemBuilder: (context, snapshot,
                                              animation, index) {
                                            return Container(
                                              width: getwidth(context) * 0.17,
                                              height: getheight(context) * 0.07,
                                              child: Center(
                                                child: TextField(
                                                  cursorColor: Colors.red,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  controller:
                                                      legraisesrepsController,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Colors.white,
                                                      )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        width: 2,
                                                        color: Colors.red,
                                                      ))),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.09),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                    ]),
                                  ]),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: getwidth(context),
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.05,
                                          right: getwidth(context) * 0.05,
                                          top: getheight(context) * 0.2),
                                    ),
                                    onTap: () {
                                      if (legraisessetsController.text
                                              .toString()
                                              .isEmpty ||
                                          legraisesrepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Leg Raises sets':
                                              legraisessetsController.text
                                                  .toString(),
                                          'Leg Raises reps':
                                              legraisesrepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          legraisessetsController.clear();
                                          legraisesrepsController.clear();
                                          Navigator.pop(context);
                                        }).onError((error, stackTrace) {
                                          toast(error.toString());
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ]),
          ),
          SizedBox(height: getheight(context) * 0.02),
          Container(
            margin: EdgeInsets.only(
                left: getwidth(context) * 0.03,
                right: getwidth(context) * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
            ),
            width: getwidth(context),
            height: getheight(context) * 0.16,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      'Crunches Frog',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    margin: EdgeInsets.only(left: getwidth(context) * 0.05),
                  ),
                  Spacer(),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/images/crunches.png"),
                      radius: 35,
                    ),
                    margin: EdgeInsets.only(
                        top: getheight(context) * 0.01,
                        right: getwidth(context) * 0.05),
                  ),
                ],
              ),
              // SizedBox(height: getheight(context)*0.03,),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            width: getwidth(context),
                            height: getheight(context) * 0.9,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          'Track Your Workout',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 15, top: 20),
                                        width: getwidth(context) * 0.4,
                                        height: getheight(context) * 0.05,
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: getwidth(context),
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text(
                                        'Sets : ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.04),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white10,
                                      ),
                                      width: getwidth(context) * 0.18,
                                      height: getheight(context) * 0.07,
                                      child: FirebaseAnimatedList(
                                        query: ref
                                            .orderByChild('Email')
                                            .equalTo(_auth.currentUser?.email
                                                .toString()),
                                        itemBuilder: (context, snapshot,
                                            animation, index) {
                                          return Container(
                                            width: getwidth(context) * 0.17,
                                            height: getheight(context) * 0.07,
                                            child: Center(
                                              child: TextField(
                                                cursorColor: Colors.red,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                controller:
                                                    crunchessetsController,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Colors.white,
                                                    )),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      width: 2,
                                                      color: Colors.red,
                                                    ))),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.09),
                                    ),
                                    SizedBox(
                                      width: getwidth(context) * 0.02,
                                    ),
                                    Row(children: [
                                      Container(
                                        child: Text(
                                          'Reps : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.04),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white10,
                                        ),
                                        width: getwidth(context) * 0.18,
                                        height: getheight(context) * 0.07,
                                        child: FirebaseAnimatedList(
                                          query: ref
                                              .orderByChild('Email')
                                              .equalTo(_auth.currentUser?.email
                                                  .toString()),
                                          itemBuilder: (context, snapshot,
                                              animation, index) {
                                            return Container(
                                              width: getwidth(context) * 0.17,
                                              height: getheight(context) * 0.07,
                                              child: Center(
                                                child: TextField(
                                                  cursorColor: Colors.red,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  controller:
                                                      crunchesrepsController,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Colors.white,
                                                      )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        width: 2,
                                                        color: Colors.red,
                                                      ))),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.09),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                    ]),
                                  ]),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: getwidth(context),
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.05,
                                          right: getwidth(context) * 0.05,
                                          top: getheight(context) * 0.2),
                                    ),
                                    onTap: () {
                                      if (crunchessetsController.text
                                              .toString()
                                              .isEmpty ||
                                          crunchesrepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Frog Crunches sets':
                                              crunchessetsController.text
                                                  .toString(),
                                          'Frog Crunches reps':
                                              crunchesrepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          crunchessetsController.clear();
                                          crunchesrepsController.clear();
                                          Navigator.pop(context);
                                        }).onError((error, stackTrace) {
                                          toast(error.toString());
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: getheight(context) * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(
                left: getwidth(context) * 0.03,
                right: getwidth(context) * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
            ),
            width: getwidth(context),
            height: getheight(context) * 0.16,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      'Bicycle Crunches',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    margin: EdgeInsets.only(left: getwidth(context) * 0.05),
                  ),
                  Spacer(),
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage("assets/images/bicycle.png"),
                      radius: 35,
                    ),
                    margin: EdgeInsets.only(
                        top: getheight(context) * 0.01,
                        right: getwidth(context) * 0.05),
                  ),
                ],
              ),
              // SizedBox(height: getheight(context)*0.03,),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            width: getwidth(context),
                            height: getheight(context) * 0.9,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          'Track Your Workout',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 15, top: 20),
                                        width: getwidth(context) * 0.4,
                                        height: getheight(context) * 0.05,
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: getwidth(context),
                                    height: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  Row(children: [
                                    Container(
                                      child: Text(
                                        'Sets : ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.04),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white10,
                                      ),
                                      width: getwidth(context) * 0.18,
                                      height: getheight(context) * 0.07,
                                      child: FirebaseAnimatedList(
                                        query: ref
                                            .orderByChild('Email')
                                            .equalTo(_auth.currentUser?.email
                                                .toString()),
                                        itemBuilder: (context, snapshot,
                                            animation, index) {
                                          return Container(
                                            width: getwidth(context) * 0.17,
                                            height: getheight(context) * 0.07,
                                            child: Center(
                                              child: TextField(
                                                cursorColor: Colors.red,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                controller:
                                                    bicyclesetsController,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      color: Colors.white,
                                                    )),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                      width: 2,
                                                      color: Colors.red,
                                                    ))),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.09),
                                    ),
                                    SizedBox(
                                      width: getwidth(context) * 0.02,
                                    ),
                                    Row(children: [
                                      Container(
                                        child: Text(
                                          'Reps : ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.04),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white10,
                                        ),
                                        width: getwidth(context) * 0.18,
                                        height: getheight(context) * 0.07,
                                        child: FirebaseAnimatedList(
                                          query: ref
                                              .orderByChild('Email')
                                              .equalTo(_auth.currentUser?.email
                                                  .toString()),
                                          itemBuilder: (context, snapshot,
                                              animation, index) {
                                            return Container(
                                              width: getwidth(context) * 0.17,
                                              height: getheight(context) * 0.07,
                                              child: Center(
                                                child: TextField(
                                                  cursorColor: Colors.red,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                  controller:
                                                      bicyclerepsController,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        color: Colors.white,
                                                      )),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                        width: 2,
                                                        color: Colors.red,
                                                      ))),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        margin: EdgeInsets.only(
                                            left: getwidth(context) * 0.09),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                    ]),
                                  ]),
                                  SizedBox(
                                    height: getheight(context) * 0.02,
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: getwidth(context),
                                      height: 55,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: getwidth(context) * 0.05,
                                          right: getwidth(context) * 0.05,
                                          top: getheight(context) * 0.2),
                                    ),
                                    onTap: () {
                                      if (bicyclesetsController.text
                                              .toString()
                                              .isEmpty ||
                                          bicyclerepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Bicycle Crunches sets':
                                              bicyclesetsController.text
                                                  .toString(),
                                          'Bicycle Crunches reps':
                                              bicyclerepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          bicyclesetsController.clear();
                                          bicyclerepsController.clear();
                                          Navigator.pop(context);
                                        }).onError((error, stackTrace) {
                                          toast(error.toString());
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                icon: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: getheight(context) * 0.02,
          ),
        ]),
      ),
    );
  }
}
