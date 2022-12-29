import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController implements GetxService {
  LocationController({
    required this.locationRepo,
  });

  final LocationRepo locationRepo;

  bool _loading = false;
  late Position _position;
  late Position _pickedPosition;
  Placemark _placemark = Placemark();
  Placemark _pickedPlacemark = Placemark();
}
