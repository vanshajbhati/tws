import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchAppointment.dart';
import 'package:tws/apiService/apimanager.dart';

class AppointmentList extends StatefulWidget {
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.arrow_back,color: Colors.white,),
          backgroundColor: Color(0XFF2CB3BF),
          centerTitle: true,
          title: Text("Meeting List",style: TextStyle(
              fontSize: 20*MediaQuery.of(context).textScaleFactor,
              color: Colors.white
          ),),
        ),
      body: FutureBuilder(
        future: Provider.of<ApiManager>(context).fetchAppointmentApi(),
        builder: (context,snapshots){
          if(snapshots.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),);
          else if (snapshots.hasError) {
            return Text("${snapshots.error}");}
          else{
            if(snapshots.hasData){
              ResponseFetchAppointment response = snapshots.data;
              List<DataFetchAppointment> data = response.data;
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top:20,bottom: 20,right: 20,left: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Meeting Type",style: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: Color(0XFF2CB3BF),
                            fontWeight: FontWeight.w600
                        ),),

                        Text(data[index].meetingType,style: TextStyle(
                            fontSize: 15*MediaQuery.of(context).textScaleFactor,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),

                      ],
                    ),

                    SizedBox(
                      height: 7,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Appointment Date",style: TextStyle(
                              fontSize: 14*MediaQuery.of(context).textScaleFactor,
                              color: Color(0XFF2CB3BF),
                              fontWeight: FontWeight.w600
                          ),),
                        ),

                        Text(data[index].appointmentDate,style: TextStyle(
                            fontSize: 15*MediaQuery.of(context).textScaleFactor,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),

                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start Time",style: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: Color(0XFF2CB3BF),
                            fontWeight: FontWeight.w600
                        ),),

                        Text(data[index].startTime,style: TextStyle(
                            fontSize: 15*MediaQuery.of(context).textScaleFactor,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),

                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End Time",style: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: Color(0XFF2CB3BF),
                            fontWeight: FontWeight.w600
                        ),),

                        Text(data[index].endTime,style: TextStyle(
                            fontSize: 15*MediaQuery.of(context).textScaleFactor,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),

                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("User",style: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: Color(0XFF2CB3BF),
                            fontWeight: FontWeight.w600
                        ),),

                        Text(data[index].selectedUser,style: TextStyle(
                            fontSize: 15*MediaQuery.of(context).textScaleFactor,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),),

                      ],
                    ),

                    SizedBox(
                      height: 7,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/edits.png",width: 28,height: 28,),

                        Image.asset("assets/images/delets.png",width: 28,height: 28,),
                      ],
                    ),
                  ],
                ),
              );
            });
            }else{
              return Center(child: Text("No meeting added yet ",
                style: TextStyle(
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600,
                    fontSize: 20*MediaQuery.of(context).textScaleFactor
                ),),);
            }
          }
        },
      )
    );
  }
}