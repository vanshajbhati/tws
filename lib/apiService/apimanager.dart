import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tws/apiService/AppConstant.dart';
import 'package:tws/apiService/apiRepository.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchAppointment.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchBlog.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchCertificateType.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchClientWorkout.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchClients.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchExerciseByUserId.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchMealDiet.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchMembers.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchMembership.dart';
import 'package:tws/apiService/apiResponse/ResponseFetchUnits.dart';
import 'package:tws/apiService/apiResponse/ResponseProfile.dart';
import 'package:tws/apiService/sharedprefrence.dart';
import 'package:tws/fragment/createnewdiet.dart';
import 'package:tws/fragment/feedlist.dart';
import 'package:tws/fragment/newaddsetworkouttemplate.dart';
import 'package:tws/routing/bouncypageroute.dart';
import 'package:tws/screen/appointmentlist.dart';
import 'package:tws/screen/certificatelist.dart';
import 'package:tws/screen/editmembershippackage.dart';
import 'package:tws/screen/homescreen.dart';
import 'package:tws/screen/membershippackage.dart';
import 'package:tws/screen/otp.dart';
import 'package:tws/screen/register.dart';
import 'package:tws/screen/subcategory.dart';
import 'package:tws/screen/workout.dart';
import '../main.dart';
import 'apiResponse/ResponseFetchCertificate.dart';
import 'apiResponse/ResponseFetchChatMessage.dart';
import 'apiResponse/ResponseFetchWorkout.dart';
import 'apiResponse/ResponseFetchWorkoutDetails.dart';
import 'apiResponse/ResponseFetchWorkoutId.dart';
import 'apiResponse/ResponsePlans.dart';

class ApiManager extends ChangeNotifier{

  APIRepository _apiRepository = APIRepository();

  ////////////// login Api //////////////////////

  Future loginApi(String phone) async{
    await SharedPrefManager.savePrefString(AppConstant.NUMBER, phone);
    var response = await _apiRepository.loginApi(phone);
    if(response['error_code'] == 1){
      navigatorKey.currentState.push(MaterialPageRoute(builder: (builder) => OtpScreen(phone:phone,otp:response['otp'].toString())));
      // navigatorKey.currentState.push(BouncyPageRoute(widget: OtpScreen(phone:phone,otp:response['otp'].toString())));
      await SharedPrefManager.savePrefString(AppConstant.OTP, response['otp'].toString());
      Fluttertoast.showToast(
          msg: response['otp'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      navigatorKey.currentState.push(MaterialPageRoute(builder: (builder) => OtpScreen(phone:phone,otp:response['otp'].toString())));
      await SharedPrefManager.savePrefString(AppConstant.OTP, response['otp'].toString());
      Fluttertoast.showToast(
          msg: response['otp'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }

  ////////////// resend Api //////////////////////

  Future resendApi() async{
    var response = await _apiRepository.resendApi();
    if(response['error_code'] == 1){
      await SharedPrefManager.savePrefString(AppConstant.OTP, response['otp'].toString());
      Fluttertoast.showToast(
          msg: response['otp'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }else{
      await SharedPrefManager.savePrefString(AppConstant.OTP, response['otp'].toString());
      Fluttertoast.showToast(
          msg: response['otp'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );

    }
  }

  ///////////// otp Api ////////////////////////

  Future verifyOtp(String phone,String otp) async{
    var response = await _apiRepository.verifyOtpApi(phone,otp);
    if(response['error_code'] == 1){
      if(response['response_string'] == "NEW_USER"){
        navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => RegisterScreen()));
      }else{
        await SharedPrefManager.savePrefString(AppConstant.KEY, response['data']['client_key'].toString());
        navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
        SharedPrefManager.savePreferenceBoolean(true);
      }
    }else{
    }
  }


  ///////////// register Api ///////////////////////

  Future registerApi(String email,String name) async{
    var response = await _apiRepository.registerApi(email,name);
    if(response['error_code'] == 1){
      print(response['data']['client_key'].toString());
      await SharedPrefManager.savePrefString(AppConstant.KEY, response['data']['client_key'].toString());
      navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
      SharedPrefManager.savePreferenceBoolean(true);
    }else{

    }
  }

  ////////////////////// add Category //////////////////////////////////

  Future addCategoryApi(String categoryName,description,filename) async {
    try {
      var response = await _apiRepository.addWorkOutApi(categoryName, description, filename);
      print(response['error_code'].toString());
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (builder) => HomeScreen()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////////// fetchWorkoutApi/////////////////

  Future<ResponseFetchWorkOut> fetchWorkOutApi() async {
    try {
      var response = await _apiRepository.fetchWorkOutApi();
      return response;
    } catch (e) {
      print(e);
    }
  }

  ////////////////////// fetchProfileApi/////////////////

  Future<ResponseProfile> fetchProfileApi() async {
    try {
      var response = await _apiRepository.fetchProfileApi();
      await SharedPrefManager.savePrefString(AppConstant.USERID,response.data.id);
      return response;
    } catch (e) {
      print(e);
    }
  }

  ////////////////////////////////addMember Api////////////////////////////////////
  Future addMemberApi(String memberName,String experience,String designation) async {
    try {
      var response = await _apiRepository.addMemberApi(memberName, experience, designation);
      return response;
    } catch (e) {
      print(e);
    }
  }

  ////////////////////// editProfileApi/////////////////

  Future editProfileApi(filename,String bio,String address,String aadhaarCard) async {
    try {
      var response = await _apiRepository.editProfileApi(filename, bio, address, aadhaarCard);
      return response;
    } catch (e) {
      print(e);
    }
  }


  ////////////////////// fetchUnitApi////////////////////////

  Future<ResponseFetchUnits> fetchUnitApi() async {
    try {
      var response = await _apiRepository.fetchUnitApi();
      return response;
    } catch (e) {
      print(e);}}

  ////////////////////// fetchCertificateType/////////////////

  Future<ResponseFetchCertificateType> fetchCertificateType() async {
    try {
      var response = await _apiRepository.fetchCertificateTypeApi();
      if(response.errorCode.toString() == "1"){
        return response;
      }else{}

    } catch (e) {
      print(e);}}


  ////////////////////// fetchCertificate/////////////////

  Future<ResponseFetchCertificate> fetchCertificateApi() async {
    try {
      var response = await _apiRepository.fetchCertificateApi();
      if(response.errorCode.toString() == "1"){
        return response;
      }else{

      }
    } catch (e) {
      print(e);}}

  ////////////////////// fetchOrganizationApi/////////////////

  Future<ResponseFetchCertificateType> fetchOrganizationApi() async {
    try {
      var response = await _apiRepository.fetchOrganisationApi();
      return response;
    } catch (e) {
      print(e);}}

  /*///////////////////// add Exercise Api///////////////////
  Future addNewExercise(file,String name,description,String youtubeLink,String selectUnit) async {
    try {
      var response = await _apiRepository.addNewExerCiseApi(file, name, description, youtubeLink, selectUnit);
      print(response['error_code'].toString());
      return response;
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }*/

  ///////////////////// add Exercise Api///////////////////
  Future addNewExercise(file,String name,description,String selectUnit) async {
    try {
      var response = await _apiRepository.addNewExerCiseApi(file, name, description,selectUnit);
      print(response['error_code'].toString());
      if(response['error_code'].toString() == "1"){
        navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (builder) => SubCategory()));
      }
      return response;
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ///////////////////// add YoutubeLink Api///////////////////
  Future addNewExerciseYoutube(String name,String description,String youtubeLink,String selectUnit) async {
    try {
      var response = await _apiRepository.addYoutubeLinkApi(name, description,youtubeLink,selectUnit);
      print(response['error_code'].toString());
      if(response['error_code'].toString() == "1"){
        navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (builder) => SubCategory()));
      }
      return response;
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);}}

  ////////////////////// fetchWorkoutApi/////////////////

  Future<ResponseFetchWorkoutCategoryId> fetchExerciseByWorkOutId() async {
    try {
      var response = await _apiRepository.fetchExerCiseByWorkOutId();
      return response;
    } catch (e) {
      print(e);
    }}

    ///////////////////////NewCertificateApi//////////////

  Future newCertificateApi(file,String certificateTye,String organisationName,String description) async {
    try {
      var response = await _apiRepository.newCertificateApi(file, certificateTye, organisationName, description);
      print(response['error_code'].toString());
      if(response['error_code'].toString() == "1"){
        navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => CertificateList()));
      }
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////////// fetchPlansApi/////////////////

  Future<ResponsePlans> fetchPlansApi() async {
    try {
      var response = await _apiRepository.fetchPlansApi();
      return response;
    } catch (e) {
      print(e);}}

      //////////////////////add Memeber Ship Package Api////////////////////

  Future addMemberShipPackageApi(String plan,String price) async {
    try {
      var response = await _apiRepository.addMembershipPackageApi(plan, price);
      print(response['error_code'].toString());
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchMemberShipPackage /////////////////////

  Future<ResponseFetchMembership> fetchMemberShipPackage() async {
    try {
      var response = await _apiRepository.fetchMembershipPackage();
      if(response.errorCode == 1){
        return response;
      }

    } catch (e) {
      print(e);}}

  //////////////////////edit Membership Package Api////////////////////

  Future editMemberShipPackageApi(String plan,String price,String id) async {
    try {
      var response = await _apiRepository.editMembershipApi(plan, price,id);
      print(response['error_code'].toString());
      // navigatorKey.currentState.pop();
      navigatorKey.currentState.pushReplacement(BouncyPageRoute(widget: MemberShipPackage()));
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
    } catch (e) {
      print(e);
    }
  }

  ///////////////////create Blog Api////////////////////////

  Future addFeedsApi(String title,String description,file) async {
    try {
      var response = await _apiRepository.createBlogApi(title, description, file);
      if(response['error_code'].toString() == "1"){
        navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => FeedList()));
      }
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchMemberShipPackage /////////////////////

  Future<ResponseFetchBlog> fetchBlogApi() async {
    try {
      var response = await _apiRepository.fetchBlogApi();
      if(response.errorCode.toString() == "1"){
        return response;
      }
    } catch (e) {
      print(e);}}



  ///////////////////create Blog Api////////////////////////

  Future createAppointment(String meetingType,String appointmentDate,String startTime,String endTime,String selectuser,String description,String link) async {
    try {
      var response = await _apiRepository.createAppointmentApi(meetingType, appointmentDate, startTime, endTime, selectuser, description,link);
      // print(response['error_code'].toString());
      if(response['error_code'].toString() == "1"){
        navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => AppointmentList()));
      }
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchAppointmentApi /////////////////////

  Future<ResponseFetchAppointment> fetchAppointmentApi() async {
    try {
      var response = await _apiRepository.fetchAppointmentApi();
      if(response.errorCode == 1){
        return response;
      }else{

      }

    } catch (e) {
      print(e);}}


  ////////////////// fetchMembers /////////////////////

  Future<ResponseFetchMembers> fetchMembersApi() async {
    try {
      var response = await _apiRepository.fetchMembersApi();
      if(response.data.isEmpty){
      }else{
        return response;
      }
    } catch (e) {
      print(e);}}

  ///////////////////edit Blog Api////////////////////////

  Future editBlogApi(String title,String description,file,String id) async {
    try {
      var response = await _apiRepository.editBlogApi(title, description, file, id);
      print(response['error_code'].toString());
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchClientsApi /////////////////////

  Future<ResponseFetchCleints> fetchClientsApi() async {
    try {
      var response = await _apiRepository.fetchClientsApi();
      if(response.errorCode.toString() == "1"){
        return response;
      }else{
      }
    } catch (e) {
      print(e);}}


  ///////////////////create New Diet Api////////////////////////

  Future createNewDietApi(String name,String fromDate,String toDate) async {
    try {
      var response = await _apiRepository.createNewDietApi(name, fromDate, toDate);
      print(response['error_code'].toString());
      SharedPrefManager.savePrefString(AppConstant.DIETID, response['data']['id'].toString());
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ///////////////////create Meal Api////////////////////////

  Future createMealApi(String name,String mealTime) async {
    try {
      var response = await _apiRepository.createMealApi(name, mealTime);
      print(response['error_code'].toString());
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => CreateNewdiet(id:response['data']['id'].toString(),tagMeal:"tagmeal")));
      // navigatorKey.currentState.pushReplacement(BouncyPageRoute(widget: CreateNewdiet(id:response['data']['id'].toString(),tagMeal:"tagmeal")));
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
    } catch (e) {
      print(e);
    }
  }

  ///////////////////edit Meal Api////////////////////////

  Future editMealApi(String name,String mealTime,String mealId) async {
    try {
      var response = await _apiRepository.editMealApi(name, mealTime,mealId);
      print(response['error_code'].toString());
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => CreateNewdiet(tagMeal:"tagmeal")));
      // navigatorKey.currentState.pushReplacement(BouncyPageRoute(widget: CreateNewdiet(id:response['data']['id'].toString(),tagMeal:"tagmeal")));
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchMealApi /////////////////////

  Future<ResponseFetchMeal> fetchMealByUserIdApi(String id) async {
    try {
      var response = await _apiRepository.fetchMealApi(id);
      return response;
    } catch (e) {
      print(e);}}

  ///////////////////add Food Api////////////////////////

  Future addFoodApi(String name,String protein,String carb,String fats,String mealId) async {
    try {
      var response = await _apiRepository.addFoodApi(name, protein, carb, fats);
      print(response['error_code'].toString());
      if(response['error_code'] == 1){
        addFoodToMealApi(response['data']['id'].toString(),mealId);
      }
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ///////////////////add Food To Meal Api////////////////////////

  Future addFoodToMealApi(String id,String mealId) async {
    try {
      var response = await _apiRepository.addFoodToMealApi(id,mealId);
      // print(response['error_code'].toString());
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => CreateNewdiet(tagMeal:"tagmeal")));
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  Future addFoodToMealOutApi(String id,String mealId) async {
    try {
      var response = await _apiRepository.addFoodToMealApi(id,mealId);
      // print(response['error_code'].toString());
      // navigatorKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) => CreateNewdiet(tagMeal:"tagmeal")));
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ///////////////////create New Workout Api////////////////////////

  Future createNewWorkOutApi(String name,String fromDate,String toDate) async {
    try {
      var response = await _apiRepository.createClientWorkOutApi(name, fromDate, toDate);
      print(response['error_code'].toString());
      // SharedPrefManager.savePrefString(AppConstant.DIETID, response['data']['id'].toString());
      return Fluttertoast.showToast(msg: response['reponse_string'],
          gravity: ToastGravity.BOTTOM);
      // navigatorKey.currentState.push(BouncyPageRoute(widget: WorkOut()));
    } catch (e) {
      print(e);
    }
  }

  ////////////////// fetchCleintWorkoutApi /////////////////////

  Future<ResponseFetchClientWorkout> fetchCleintWorkoutApi() async {
    try {
      var response = await _apiRepository.fetchCleintWorkoutApi();
      if(response.errorCode == 0){

      }else{
        return response;
      }

    } catch (e) {
      print(e);}}

  ////////////////// fetchExercisesByUserId /////////////////////

  Future<ResponseFetchExerciseByUserId> fetchExercisesByUserId() async {
    try {
      var response = await _apiRepository.fetchExerciseByUserId();
      return response;
    } catch (e) {
      print(e);
    }
  }

  ////////////////// add_exercise_to_client_workout /////////////////////

  Future addExerciseToClientWorkout(String exerciseSuperset,Set setExerciseId,Set exerciseName) async {
    try {
      var response = await _apiRepository.addExerciseToClientWorkout(exerciseSuperset, setExerciseId, exerciseName);

      print("dsssss"+response['error_code'].toString());
      if(response['error_code'] == 1){
        navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => NewAddWorkoutTemplate(exerciseSuperset:exerciseSuperset)));
      }

      return response;
    } catch (e) {
      print(e);}}

  ////////////////// fetchCleintWorkoutDetailsApiApi /////////////////////

  Future fetchCleintWorkoutDetailsApiApi() async {
    try {
      var response = await _apiRepository.fetchWorkOutDetailsApi();

      return response;
    } catch (e) {
      print(e);}}

  ////////////////// addToSetApi /////////////////////

  Future addToSetApi(String tag,String id,String time) async {
    try {
      var response = await _apiRepository.addTosetApi(tag,id,time);
      return response;
    } catch (e) {
      print(e);}}

  ////////////////// addToSetTwoControllerApi /////////////////////

  Future addToSetTwoControllerApi(String tag,String id,String level,String time) async {
    try {
      var response = await _apiRepository.addTosettwoControllerApi(tag,id,level,time);
      return response;
    } catch (e) {
      print(e);}}

  ////////////////// editToSetApi /////////////////////

  Future editToSetApi(String tag,String id,String level) async {
    try {
      var response = await _apiRepository.editToSetControllerApi(tag,id,level);
      return response;
    } catch (e) {
      print(e);}}


  ////////////////// removeExerciseApi /////////////////////

  Future removeExerCiseApi(String id) async {
    try {
      var response = await _apiRepository.removeExerCiseApi(id);
      return response;
    } catch (e) {
      print(e);}}

  ////////////////// reviewDietListApi /////////////////////

  Future reviewDietListApi() async {
    try {
      var response = await _apiRepository.dietListApi();
      return response;
    } catch (e) {
      print(e);}}


  ////////////////// reviewDietDatesApi /////////////////////

  Future reviewDietDatesApi(String id) async {
    try {
      var response = await _apiRepository.reviewDietDatesApi(id);
      if(response['error_code'] == 1){
        return response;
      }
    } catch (e) {
      print(e);}}


  ////////////////// reviewDietByDatesApi /////////////////////

  Future reviewDietByDatesApi(String id,String date) async {
    try {
      var response = await _apiRepository.reviewDietByDatesApi(id, date);
      if(response['error_code'] == 1){
        return response;
      }
    } catch (e) {
      print(e);}}


  /////////////////////////// sendMessageApi ////////////////////////////////

  Future sendMessageApi(msg) async {
    try {
      var response = await _apiRepository.sendMessageApi(msg);
      if(response['error_code'] == 0){}else{
        return response;}
    } catch (e) {
      print(e);}}


  /////////////////////////// newsendMessageApi ////////////////////////////////

  Future newSendMessageApi(msg,filename) async {
    try {
      var response = await _apiRepository.newSendMessageApi(msg, filename);
      if(response['error_code'] == 0){}else{
        return response;}
    } catch (e) {
      print(e);}}

  //////////////////////////////FetchIndividualChatApi ////////////////////////////////

  Future<ResponseFetchChatMessage> fetchIndividualChat() async {
    final response = await _apiRepository.fetchIndividualChat();
    if (response.errorCode.toString() == "1") {
      return response;
    }
  }


}