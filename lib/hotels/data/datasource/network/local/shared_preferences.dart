
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../presentation/screens/login_screen/login_screen.dart';

class CacheHelper
{
 static late SharedPreferences _sharedPreferences;


 static init() async
 {
  return  _sharedPreferences = await SharedPreferences.getInstance();
 }

 static Future<bool> putBoolean ({
  required String key,
  required bool value,
 })async
 {
  return await _sharedPreferences.setBool(key, value);
 }

 static Future<bool> setBoolean ({
  required String key,
  required bool value,
 })async
 {
  return await _sharedPreferences.setBool(key, value);
 }


 static dynamic getData ({
  required String key,
 })
 {
  return _sharedPreferences.get(key);
 }

 static Future<dynamic> saveData ({
  required String key,
  required dynamic value,
 })async
 {
  if (value is String) return await _sharedPreferences.setString(key, value);
  if (value is int) return await _sharedPreferences.setInt(key, value);
  if (value is bool) return await _sharedPreferences.setBool(key, value);

  // lw 7aga 8er keda htro7ll double
  return await _sharedPreferences.setDouble(key, value);
 }

 static Future<bool> removeData ({
  required String key,
 })async
 {
  return await _sharedPreferences.remove(key);
 }



 Future<void> setSplashScreenViewed() async {
  _sharedPreferences.setBool('splash', true);
 }

 Future<bool> isOnSplashScreenViewed() async {
  return _sharedPreferences.getBool('splash') ?? false;
 }

 Future<void> setOnBoardingScreenViewed() async {
  _sharedPreferences.setBool('onBoarding', true);
 }

 Future<bool> isOnBoardingScreenViewed() async {
  return _sharedPreferences.getBool('onBoarding') ?? false;
 }


 Future<void> setIsUserLoggedIn() async {
  _sharedPreferences.setBool('', true);
 }

 Future<bool> isUserLoggedIn() async {
  return _sharedPreferences.getBool('') ?? false;
 }

 Future<void> logout() async {
  _sharedPreferences.remove('');
 }



}
void signOut(context)
{

 CacheHelper.removeData(key: 'email');
 CacheHelper.removeData(key: 'password');
 CacheHelper.removeData(key: 'token');
   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
 }
