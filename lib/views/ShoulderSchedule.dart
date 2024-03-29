import 'package:fitnessapp/common/UserRecordManager.dart';
import 'package:fitnessapp/common/set_height_and_width.dart';
import 'package:fitnessapp/firebase/firebase_toast.dart';
import 'package:fitnessapp/workouts/ShouldeWorkout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class shoulder_schedule extends StatefulWidget {
  const shoulder_schedule({Key? key}) : super(key: key);

  @override
  State<shoulder_schedule> createState() => _shoulder_scheduleState();
}

class _shoulder_scheduleState extends State<shoulder_schedule> {
  final ref = FirebaseDatabase.instance.ref('users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  final sideraisesetsController = TextEditingController();
  final sideraiserepsController = TextEditingController();
  final sideraiseweightController = TextEditingController();

  final frontraisesetsController = TextEditingController();
  final frontraiserepsController = TextEditingController();
  final frontraiseweightController = TextEditingController();

  final shoulderpresssetsController = TextEditingController();
  final shoulderpressrepsController = TextEditingController();
  final shoulderpressweightController = TextEditingController();

  final reverseflysetsController = TextEditingController();
  final reverseflyrepsController = TextEditingController();
  final reverseflyweightController = TextEditingController();

  final uprightrowsetsController = TextEditingController();
  final uprightrowrepsController = TextEditingController();
  final uprightrowweightController = TextEditingController();
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
                'SHOULDER',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => shoulder_workout()));
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
                      'Shoulder Side Raises',
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
                          AssetImage("assets/images/sideraises.png"),
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
                                  Container(
                                    child: Row(children: [
                                      Container(
                                        child: Text(
                                          'Weight : ',
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
                                                      sideraiseweightController,
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
                                            left: getwidth(context) * 0.05),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: getwidth(context) * 0.05),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: getheight(context) * 0.01),
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
                                                    sideraisesetsController,
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
                                                      sideraiserepsController,
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
                                      if (sideraiseweightController.text
                                              .toString()
                                              .isEmpty ||
                                          sideraisesetsController.text
                                              .toString()
                                              .isEmpty ||
                                          sideraiserepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Side Raises weights':
                                              sideraiseweightController.text
                                                  .toString(),
                                          'Side Raises sets':
                                              sideraisesetsController.text
                                                  .toString(),
                                          'Side Raises reps':
                                              sideraiserepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          sideraiseweightController.clear();
                                          sideraisesetsController.clear();
                                          sideraiserepsController.clear();
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
                      'Shoulder Front Raises',
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
                          AssetImage("assets/images/frontraises.png"),
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
                                  Container(
                                    child: Row(children: [
                                      Container(
                                        child: Text(
                                          'Weight : ',
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
                                                      frontraiseweightController,
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
                                            left: getwidth(context) * 0.05),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: getwidth(context) * 0.05),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: getheight(context) * 0.01),
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
                                                    frontraisesetsController,
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
                                                      frontraiserepsController,
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
                                      if (frontraiseweightController.text
                                              .toString()
                                              .isEmpty ||
                                          frontraisesetsController.text
                                              .toString()
                                              .isEmpty ||
                                          frontraiserepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Front Raises weights':
                                              frontraiseweightController.text
                                                  .toString(),
                                          'Front Raises sets':
                                              frontraisesetsController.text
                                                  .toString(),
                                          'Front Raises reps':
                                              frontraiserepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          frontraiseweightController.clear();
                                          frontraisesetsController.clear();
                                          frontraiserepsController.clear();
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
                      'Shoulder Press',
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
                          AssetImage("assets/images/shoulderpress.png"),
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
                                  Container(
                                    child: Row(children: [
                                      Container(
                                        child: Text(
                                          'Weight : ',
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
                                                      shoulderpressweightController,
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
                                            left: getwidth(context) * 0.05),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: getwidth(context) * 0.05),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: getheight(context) * 0.01),
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
                                                    shoulderpresssetsController,
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
                                                      shoulderpressrepsController,
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
                                      if (shoulderpressweightController.text
                                              .toString()
                                              .isEmpty ||
                                          shoulderpresssetsController.text
                                              .toString()
                                              .isEmpty ||
                                          shoulderpressrepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Soulder Press weights':
                                              shoulderpressweightController.text
                                                  .toString(),
                                          'Shoulder Press sets':
                                              shoulderpresssetsController.text
                                                  .toString(),
                                          'Shoulder Press reps':
                                              shoulderpressrepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          shoulderpressweightController.clear();
                                          shoulderpresssetsController.clear();
                                          shoulderpressrepsController.clear();
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
                      'Reverse Fly',
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
                          AssetImage("assets/images/reversefly.png"),
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
                                  Container(
                                    child: Row(children: [
                                      Container(
                                        child: Text(
                                          'Weight : ',
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
                                                      reverseflyweightController,
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
                                            left: getwidth(context) * 0.05),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: getwidth(context) * 0.05),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: getheight(context) * 0.01),
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
                                                    reverseflysetsController,
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
                                                      reverseflyrepsController,
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
                                      if (reverseflyweightController.text
                                              .toString()
                                              .isEmpty ||
                                          reverseflysetsController.text
                                              .toString()
                                              .isEmpty ||
                                          reverseflyrepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Reverse Fly weights':
                                              reverseflyweightController.text
                                                  .toString(),
                                          'Reverse Fly sets':
                                              reverseflysetsController.text
                                                  .toString(),
                                          'Reverse Fly reps':
                                              reverseflyrepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          reverseflyweightController.clear();
                                          reverseflysetsController.clear();
                                          reverseflyrepsController.clear();
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
                      'Upright Row',
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
                          AssetImage("assets/images/uprightrow.png"),
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
                                  Container(
                                    child: Row(children: [
                                      Container(
                                        child: Text(
                                          'Weight : ',
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
                                                      uprightrowweightController,
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
                                            left: getwidth(context) * 0.05),
                                      ),
                                      SizedBox(
                                        width: getwidth(context) * 0.02,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: getwidth(context) * 0.05),
                                          child: Text(
                                            'kg',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ]),
                                    margin: EdgeInsets.only(
                                        top: getheight(context) * 0.01),
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
                                                    uprightrowsetsController,
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
                                                      uprightrowrepsController,
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
                                      if (uprightrowweightController.text
                                              .toString()
                                              .isEmpty ||
                                          uprightrowsetsController.text
                                              .toString()
                                              .isEmpty ||
                                          uprightrowrepsController.text
                                              .toString()
                                              .isEmpty) {
                                        toast('All Fields are required');
                                      } else {
                                        ref
                                            .child(
                                                UserRecords().Userid.toString())
                                            .update({
                                          'Upright weights':
                                              uprightrowweightController.text
                                                  .toString(),
                                          'Upright sets':
                                              uprightrowsetsController.text
                                                  .toString(),
                                          'Upright reps':
                                              uprightrowrepsController.text
                                                  .toString(),
                                        }).then((value) {
                                          toast('Workout Tracked');
                                          uprightrowweightController.clear();
                                          uprightrowsetsController.clear();
                                          uprightrowrepsController.clear();
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
        ]),
      ),
    );
  }
}
