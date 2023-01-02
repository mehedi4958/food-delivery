import 'dart:convert';

import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/address_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationController({
    required this.locationRepo,
  });

  final LocationRepo locationRepo;

  bool _loading = false;
  final bool _changeAddress = true;
  final bool _updateAddressData = true;
  Placemark _placeMark = Placemark();
  Placemark _pickedPlaceMark = Placemark();
  final List<AddressModel> _addressList = [];
  final List<String> _addressTypeList = ['home', 'office', 'others'];
  int _addressTypeIndex = 0;

  late Position _position;
  late Position _pickedPosition;
  late List<AddressModel> _allAddressList;
  late Map<String, dynamic> _getAddress;
  late GoogleMapController _mapController;

  /// getters
  List<AddressModel> get addressList => _addressList;
  Map get getAddress => _getAddress;
  bool get loading => _loading;
  Position get position => _position;
  Position get pickedPosition => _pickedPosition;
  Placemark get placeMark => _placeMark;
  Placemark get pickedPlaceMark => _pickedPlaceMark;
  List<String> get addressTypeList => _addressTypeList;
  int get addressTypeIndex => _addressTypeIndex;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickedPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
        if (_changeAddress) {
          String address = await getAddressFromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude,
            ),
          );
          fromAddress
              ? _placeMark = Placemark(name: address)
              : _pickedPlaceMark = Placemark(name: address);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String address = 'Unknown Location Found';
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if (response.body['status'] == 'OK') {
      address = response.body['results'][0]['formatted_address'].toString();
      // print('PRINTING ADDRESS: $address');
    } else {
      print('Error getting the google api');
    }
    return address;
  }

  AddressModel getUserAddress() {
    late AddressModel addressModel;
    /*
     * converting to map using jsonDecode
     */
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    try {
      addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print(e);
    }
    return addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }
}
