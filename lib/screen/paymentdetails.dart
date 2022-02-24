import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  bool statusBank = true;
  bool statusUpi = false;
  String dropdownValue = 'Net Banking';

  List <String> spinnerItems = [
    'Net Banking',
    'Upi'] ;

  var selectedValue = "";
  var bankUpi = "",upiId = "",bankName = "";
  bool checkStatus = false;
  bool checkBankStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF2CB3BF),
        title: Text("Payment Details",style: TextStyle(
            color: Colors.white
        ),),
        leading: Icon(Icons.arrow_back,color: Colors.white,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:10.0,top: 8),
                  child: Text("Add your mode of payment",style: TextStyle(
                    fontSize: 15,
                    color: Color(0XFF2CB3BF),

                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,top: 4),
                  child: Text("Select payment type",style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 12,bottom: 10),
                  child: Container(
                    color: Color(0XFFF2F2F2),
                    padding: EdgeInsets.only(left: 8,right: 8),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String data) {
                        setState(() {
                          dropdownValue = data;
                          if(dropdownValue == "Net Banking"){
                            statusUpi = false;
                            statusBank = true;
                          }else{
                            statusUpi = true;
                            statusBank = false;
                          }
                        });
                      },
                      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: Color(0xFFB5B5B5),),
                SizedBox(height: 12,),
                Visibility(
                  visible: statusBank,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Your name in Bank*",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF262626)),
                          decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // decoration: const InputDecoration(
                          //   hintText: 'Bio',
                          //   labelText: 'Bio',
                          //
                          // ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),

                      SizedBox(height: 12,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Bank Name",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF262626)),
                          decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // decoration: const InputDecoration(
                          //   hintText: 'Bio',
                          //   labelText: 'Bio',
                          //
                          // ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),

                      SizedBox(height: 12,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("IFSC*",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF262626)),
                          decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // decoration: const InputDecoration(
                          //   hintText: 'Bio',
                          //   labelText: 'Bio',
                          //
                          // ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),

                      SizedBox(height: 12,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Branch Address*",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF262626)),
                          decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // decoration: const InputDecoration(
                          //   hintText: 'Bio',
                          //   labelText: 'Bio',
                          //
                          // ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),

                      SizedBox(height: 12,),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Cancel Cheque",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 10,top: 8),
                            height: 48,
                            color: Color(0XFFF2F2F2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text("upload cancel cheque image",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0XFF7B7B7B)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 29,
                              top: 7,
                              child: Center(
                                child: RaisedButton(
                                    onPressed: (){},
                                    color: Color(0XFF2CB3BF),
                                    child: Text("Upload",style: TextStyle(
                                        color: Colors.white
                                    ),)
                                ),
                              )),
                        ],

                      ),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 40,bottom: 10,left: 15,right: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: Center(
                            child: Text("SUBMIT",style: TextStyle(
                                fontSize: 21*MediaQuery.of(context).textScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.normal
                            ),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFF299FAB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: statusUpi,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text("Enter your UPI id.*",style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10,top: 10),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Color(0XFF262626)),
                          decoration: InputDecoration(fillColor: Color(0XFFF2F2F2), filled: true,
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // decoration: const InputDecoration(
                          //   hintText: 'Bio',
                          //   labelText: 'Bio',
                          //
                          // ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                        ),
                      ),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 40,bottom: 10,left: 15,right: 15),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: Center(
                            child: Text("SUBMIT",style: TextStyle(
                                fontSize: 21*MediaQuery.of(context).textScaleFactor,
                                color: Colors.white,
                                fontWeight: FontWeight.normal
                            ),),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0XFF299FAB),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}