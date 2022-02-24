import 'package:flutter/material.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/screen/achievements.dart';
import 'package:tws/screen/blankexercise.dart';
import 'package:tws/screen/membershippackage.dart';
import 'package:tws/screen/paymentdetails.dart';
import 'package:tws/screen/profile.dart';
import 'package:tws/screen/workout.dart';

class AccountFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: Color(0XFF2CB3BF),
        centerTitle: true,
        title: Text("Account",style: TextStyle(
            fontSize: 22*MediaQuery.of(context).textScaleFactor,
            color: Colors.white
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 240,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spalsh.jpg"),
                            fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 90),
                        child: Card(
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                      child: Text('Surya Pratap Singh?',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),

                                  SizedBox(
                                    height: 3,
                                  ),

                                  Text("24 yrs,Male"),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 53,
                          left: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Color(0XFFFE9900),
                            radius: 58,
                            backgroundImage: AssetImage("assets/images/phoned.png"),
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 8,
                child: Column(
                  children: <Widget>[

                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
                      },
                      leading: Image.asset("assets/images/user.png",width: 27,height: 27,),
                      title: Text("Profile",style: TextStyle(
                        fontSize: 16*MediaQuery.of(context).textScaleFactor,
                        color: Color(0XFF767676),
                        fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Achivements()));
                      },
                      leading: Image.asset("assets/images/certificate.png",width: 27,height: 27,),
                      title: Text("Certificate",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      onTap: (){
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WorkOut()));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BlankExerCise()));
                      },
                      leading: Image.asset("assets/images/gallery.png",width: 27,height: 27,),
                      title: Text("Transformation Picture",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentDetails()));
                      },
                      leading: Image.asset("assets/images/paymetdetail.png",width: 27,height: 27,),
                      title: Text("Payment Details",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MemberShipPackage()));
                      },
                      leading: Image.asset("assets/images/membership.png",width: 27,height: 27,),
                      title: Text("Membership Package",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      leading: Image.asset("assets/images/twsvirtual.png",width: 27,height: 27,),
                      title: Text("Tws Virtual Office",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      leading: Image.asset("assets/images/terms.png",width: 27,height: 27,),
                      title: Text("Terms & Condition",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      leading: Image.asset("assets/images/priv.png",width: 27,height: 27,),
                      title: Text("Privacy Policy",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      height: 1,
                      color: Color(0XFF838383),
                    ),

                    ListTile(
                      onTap: (){
                        SharedPrefManager.clearPrefs();
                      },
                      leading: Image.asset("assets/images/logout.png",width: 27,height: 27,),
                      title: Text("Logout",style: TextStyle(
                          fontSize: 16*MediaQuery.of(context).textScaleFactor,
                          color: Color(0XFF767676),
                          fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.double_arrow_rounded),
                    ),

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