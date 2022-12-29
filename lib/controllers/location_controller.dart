import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../models/address_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationController({
    required this.locationRepo,
  });

  final LocationRepo locationRepo;

  final bool _loading = false;
  final Placemark _placeMark = Placemark();
  final Placemark _pickedPlaceMark = Placemark();
  final List<AddressModel> _addressList = [];
  final List<String> _addressTypeList = ['home', 'office', 'others'];

  final int _addressTypeIndex = 0;

  late Position _position;
  late Position _pickedPosition;
  late List<AddressModel> _allAddressList;
  late Map<String, dynamic> _getAddress;

  /// getters
  List<AddressModel> get addressList => _addressList;
  Map get getAddress => _getAddress;
}
