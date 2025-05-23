import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;


Future<void> init() async {

  final client = http.Client();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // sl.registerLazySingleton(() => client);
  // sl.registerLazySingleton(() => ConnectivityCubit());
  // sl.registerLazySingleton(() => FallDetectionService());
  // // sl.registerLazySingleton(() => messaging);
  //
  // await userInjectionContainer();
  // await connectivityInjectionContainer();
}

