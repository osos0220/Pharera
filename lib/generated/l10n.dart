// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To The GEM`
  String get Welcome {
    return Intl.message(
      'Welcome To The GEM',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To The GEM`
  String get WelcomeGEM {
    return Intl.message(
      'Welcome To The GEM',
      name: 'WelcomeGEM',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get Explore {
    return Intl.message(
      'Explore',
      name: 'Explore',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeall {
    return Intl.message(
      'See All',
      name: 'seeall',
      desc: '',
      args: [],
    );
  }

  /// `King Akhenaten`
  String get Akhenaten {
    return Intl.message(
      'King Akhenaten',
      name: 'Akhenaten',
      desc: '',
      args: [],
    );
  }

  /// `King Hatshbsot`
  String get Hatshbsot {
    return Intl.message(
      'King Hatshbsot',
      name: 'Hatshbsot',
      desc: '',
      args: [],
    );
  }

  /// `King Sonsrt 1`
  String get Sonsrt1 {
    return Intl.message(
      'King Sonsrt 1',
      name: 'Sonsrt1',
      desc: '',
      args: [],
    );
  }

  /// `King Sonsrt 2`
  String get Sonsrt2 {
    return Intl.message(
      'King Sonsrt 2',
      name: 'Sonsrt2',
      desc: '',
      args: [],
    );
  }

  /// `King Tahtmos`
  String get Tahtmos {
    return Intl.message(
      'King Tahtmos',
      name: 'Tahtmos',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get image {
    return Intl.message(
      'Photo',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `For Getting Discount For The Res-ervation, book From Your Booth`
  String get Ticket_dis {
    return Intl.message(
      'For Getting Discount For The Res-ervation, book From Your Booth',
      name: 'Ticket_dis',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get adult {
    return Intl.message(
      'Adult',
      name: 'adult',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Youth`
  String get youth {
    return Intl.message(
      'Youth',
      name: 'youth',
      desc: '',
      args: [],
    );
  }

  /// `Senior`
  String get senior {
    return Intl.message(
      'Senior',
      name: 'senior',
      desc: '',
      args: [],
    );
  }

  /// `350 L.E`
  String get L_e_aud {
    return Intl.message(
      '350 L.E',
      name: 'L_e_aud',
      desc: '',
      args: [],
    );
  }

  /// `300 L.E`
  String get L_e_y {
    return Intl.message(
      '300 L.E',
      name: 'L_e_y',
      desc: '',
      args: [],
    );
  }

  /// `250 L.E`
  String get L_e_s {
    return Intl.message(
      '250 L.E',
      name: 'L_e_s',
      desc: '',
      args: [],
    );
  }

  /// `200 L.E`
  String get L_e_se {
    return Intl.message(
      '200 L.E',
      name: 'L_e_se',
      desc: '',
      args: [],
    );
  }

  /// `pay now`
  String get pay {
    return Intl.message(
      'pay now',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `For getting ticket click pay now`
  String get payy {
    return Intl.message(
      'For getting ticket click pay now',
      name: 'payy',
      desc: '',
      args: [],
    );
  }

  /// `Log IN`
  String get login {
    return Intl.message(
      'Log IN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Explore The Musuem`
  String get Ex {
    return Intl.message(
      'Explore The Musuem',
      name: 'Ex',
      desc: '',
      args: [],
    );
  }

  /// `Explore with Tour Guide`
  String get GUID {
    return Intl.message(
      'Explore with Tour Guide',
      name: 'GUID',
      desc: '',
      args: [],
    );
  }

  /// `ROYAL JOURNEY`
  String get Royal {
    return Intl.message(
      'ROYAL JOURNEY',
      name: 'Royal',
      desc: '',
      args: [],
    );
  }

  /// `Top Favorites`
  String get top {
    return Intl.message(
      'Top Favorites',
      name: 'top',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get category {
    return Intl.message(
      'Categories',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get Show {
    return Intl.message(
      'Show',
      name: 'Show',
      desc: '',
      args: [],
    );
  }

  /// ` Our mobile application offers A virtual tour Of one Of the most historical ages pharaonic civilizations.But That's not all- we go beyond by bring-ing history to life through Ai-powered lip synchronization, historical characters within the musuem tell their stories.offering tourists a unique and inspiring experience. our 360- degree virtual tour creates a sense of immersion, allowing users to delve into Egypt'rich history and civilization.`
  String get Our {
    return Intl.message(
      ' Our mobile application offers A virtual tour Of one Of the most historical ages pharaonic civilizations.But That\'s not all- we go beyond by bring-ing history to life through Ai-powered lip synchronization, historical characters within the musuem tell their stories.offering tourists a unique and inspiring experience. our 360- degree virtual tour creates a sense of immersion, allowing users to delve into Egypt\'rich history and civilization.',
      name: 'Our',
      desc: '',
      args: [],
    );
  }

  /// `WhatsAPP`
  String get whats {
    return Intl.message(
      'WhatsAPP',
      name: 'whats',
      desc: '',
      args: [],
    );
  }

  /// `FaceBook`
  String get Face {
    return Intl.message(
      'FaceBook',
      name: 'Face',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get insta {
    return Intl.message(
      'Instagram',
      name: 'insta',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get not {
    return Intl.message(
      'Notification',
      name: 'not',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get fav {
    return Intl.message(
      'Favorites',
      name: 'fav',
      desc: '',
      args: [],
    );
  }

  /// `Rating Us`
  String get rate {
    return Intl.message(
      'Rating Us',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get language {
    return Intl.message(
      'Languages',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get Logout {
    return Intl.message(
      'Log Out',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `You Have 2 Notification Today ! `
  String get have {
    return Intl.message(
      'You Have 2 Notification Today ! ',
      name: 'have',
      desc: '',
      args: [],
    );
  }

  /// `Pharaera Community Say Goodmorning`
  String get not1 {
    return Intl.message(
      'Pharaera Community Say Goodmorning',
      name: 'not1',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Come And Visit Our New VRroom`
  String get not2 {
    return Intl.message(
      'Hello! Come And Visit Our New VRroom',
      name: 'not2',
      desc: '',
      args: [],
    );
  }

  /// `Ago`
  String get ago {
    return Intl.message(
      'Ago',
      name: 'ago',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate our app?`
  String get How {
    return Intl.message(
      'How would you rate our app?',
      name: 'How',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback has been submitted.`
  String get feed {
    return Intl.message(
      'Your feedback has been submitted.',
      name: 'feed',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Feedback`
  String get enter {
    return Intl.message(
      'Enter Your Feedback',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstname {
    return Intl.message(
      'First name',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Conform Password`
  String get Conform {
    return Intl.message(
      'Conform Password',
      name: 'Conform',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact {
    return Intl.message(
      'Contact Us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `ABOUT US`
  String get ABOUT {
    return Intl.message(
      'ABOUT US',
      name: 'ABOUT',
      desc: '',
      args: [],
    );
  }

  /// `Thanks`
  String get thanks {
    return Intl.message(
      'Thanks',
      name: 'thanks',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get Forget {
    return Intl.message(
      'Forget Password',
      name: 'Forget',
      desc: '',
      args: [],
    );
  }

  /// `Have An Account ?`
  String get haveaccount {
    return Intl.message(
      'Have An Account ?',
      name: 'haveaccount',
      desc: '',
      args: [],
    );
  }

  /// `pharera`
  String get pharera {
    return Intl.message(
      'pharera',
      name: 'pharera',
      desc: '',
      args: [],
    );
  }

  /// `Exhibition Pictures`
  String get Exhibition {
    return Intl.message(
      'Exhibition Pictures',
      name: 'Exhibition',
      desc: '',
      args: [],
    );
  }

  /// `Exhibition Video`
  String get ExhibitionV {
    return Intl.message(
      'Exhibition Video',
      name: 'ExhibitionV',
      desc: '',
      args: [],
    );
  }

  /// `Download failed. Please try again.`
  String get DownloadF {
    return Intl.message(
      'Download failed. Please try again.',
      name: 'DownloadF',
      desc: '',
      args: [],
    );
  }

  /// `Download Error.`
  String get DownloadE {
    return Intl.message(
      'Download Error.',
      name: 'DownloadE',
      desc: '',
      args: [],
    );
  }

  /// `Download task ID:`
  String get DownloadT {
    return Intl.message(
      'Download task ID:',
      name: 'DownloadT',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied. Please enable storage permission.`
  String get Permission {
    return Intl.message(
      'Permission denied. Please enable storage permission.',
      name: 'Permission',
      desc: '',
      args: [],
    );
  }

  /// `Directory not found.`
  String get Directory {
    return Intl.message(
      'Directory not found.',
      name: 'Directory',
      desc: '',
      args: [],
    );
  }

  /// `Ticket`
  String get ticket {
    return Intl.message(
      'Ticket',
      name: 'ticket',
      desc: '',
      args: [],
    );
  }

  /// `Exhibition`
  String get Exhibition1 {
    return Intl.message(
      'Exhibition',
      name: 'Exhibition1',
      desc: '',
      args: [],
    );
  }

  /// `Pharaohs`
  String get pharaohs {
    return Intl.message(
      'Pharaohs',
      name: 'pharaohs',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get wellcome {
    return Intl.message(
      'Welcome',
      name: 'wellcome',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete`
  String get incomplete {
    return Intl.message(
      'Incomplete',
      name: 'incomplete',
      desc: '',
      args: [],
    );
  }

  /// `Please rate and provide feedback.`
  String get please {
    return Intl.message(
      'Please rate and provide feedback.',
      name: 'please',
      desc: '',
      args: [],
    );
  }

  /// `Provide feedback...`
  String get provide {
    return Intl.message(
      'Provide feedback...',
      name: 'provide',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate our app?`
  String get how {
    return Intl.message(
      'How would you rate our app?',
      name: 'how',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterp {
    return Intl.message(
      'Enter Password',
      name: 'enterp',
      desc: '',
      args: [],
    );
  }

  /// `CREATE ACCOUNT`
  String get create {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `USER NAME`
  String get name {
    return Intl.message(
      'USER NAME',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `WebView`
  String get web {
    return Intl.message(
      'WebView',
      name: 'web',
      desc: '',
      args: [],
    );
  }

  /// `Lets get started..`
  String get lets {
    return Intl.message(
      'Lets get started..',
      name: 'lets',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Page`
  String get weelcome {
    return Intl.message(
      'Welcome Page',
      name: 'weelcome',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signin {
    return Intl.message(
      'SIGN IN',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Exhibitions`
  String get exihibtion {
    return Intl.message(
      'Exhibitions',
      name: 'exihibtion',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get Tickets {
    return Intl.message(
      'Tickets',
      name: 'Tickets',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied. Please enable storage permission.`
  String get Permision {
    return Intl.message(
      'Permission denied. Please enable storage permission.',
      name: 'Permision',
      desc: '',
      args: [],
    );
  }

  /// `File downloaded to:`
  String get file {
    return Intl.message(
      'File downloaded to:',
      name: 'file',
      desc: '',
      args: [],
    );
  }

  /// `ARABIC`
  String get arabic {
    return Intl.message(
      'ARABIC',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `ENGLISH`
  String get English {
    return Intl.message(
      'ENGLISH',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `User is successfully created`
  String get done {
    return Intl.message(
      'User is successfully created',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Some error happend`
  String get donenot {
    return Intl.message(
      'Some error happend',
      name: 'donenot',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account`
  String get donnothaveaccount {
    return Intl.message(
      'Do not have an account',
      name: 'donnothaveaccount',
      desc: '',
      args: [],
    );
  }

  /// `User is successfully loged in`
  String get donelogin {
    return Intl.message(
      'User is successfully loged in',
      name: 'donelogin',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email or Password`
  String get invalid {
    return Intl.message(
      'Invalid Email or Password',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `password reset link sent check email`
  String get password_reset {
    return Intl.message(
      'password reset link sent check email',
      name: 'password_reset',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email and we will send you a password reset link`
  String get EnterEmail {
    return Intl.message(
      'Enter Your Email and we will send you a password reset link',
      name: 'EnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get Reset {
    return Intl.message(
      'Reset Password',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Successfully signed out`
  String get Successfully {
    return Intl.message(
      'Successfully signed out',
      name: 'Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Error signing out:`
  String get ErrorS {
    return Intl.message(
      'Error signing out:',
      name: 'ErrorS',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign out`
  String get Failedtosign {
    return Intl.message(
      'Failed to sign out',
      name: 'Failedtosign',
      desc: '',
      args: [],
    );
  }

  /// `No email available`
  String get NoE {
    return Intl.message(
      'No email available',
      name: 'NoE',
      desc: '',
      args: [],
    );
  }

  /// `My Details`
  String get MyD {
    return Intl.message(
      'My Details',
      name: 'MyD',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get SignOut {
    return Intl.message(
      'Log Out',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Top Favorites`
  String get Top {
    return Intl.message(
      'Top Favorites',
      name: 'Top',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get Trending {
    return Intl.message(
      'Trending',
      name: 'Trending',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `No liked images found.`
  String get NoLike {
    return Intl.message(
      'No liked images found.',
      name: 'NoLike',
      desc: '',
      args: [],
    );
  }

  /// `No liked video found.`
  String get NoVIDEO {
    return Intl.message(
      'No liked video found.',
      name: 'NoVIDEO',
      desc: '',
      args: [],
    );
  }

  /// `Error loading favorites.`
  String get ErroR {
    return Intl.message(
      'Error loading favorites.',
      name: 'ErroR',
      desc: '',
      args: [],
    );
  }

  /// `No favorite videos or images found.`
  String get NoFAV {
    return Intl.message(
      'No favorite videos or images found.',
      name: 'NoFAV',
      desc: '',
      args: [],
    );
  }

  /// `Explore using VR`
  String get VR {
    return Intl.message(
      'Explore using VR',
      name: 'VR',
      desc: '',
      args: [],
    );
  }

  /// `Sign In Required`
  String get signInRequiredTitle {
    return Intl.message(
      'Sign In Required',
      name: 'signInRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in to explore the museum with a tour guide. Please sign in or create an account.`
  String get signInRequiredMessage {
    return Intl.message(
      'You need to sign in to explore the museum with a tour guide. Please sign in or create an account.',
      name: 'signInRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in to access Favorites. Please sign in or create an account.`
  String get signInFavoriteMessage {
    return Intl.message(
      'You need to sign in to access Favorites. Please sign in or create an account.',
      name: 'signInFavoriteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInButton {
    return Intl.message(
      'Sign In',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
