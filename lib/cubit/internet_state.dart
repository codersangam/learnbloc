part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}
