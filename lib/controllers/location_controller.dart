import 'dart:convert';

import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/models/response_model.dart';
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

  final bool _changeAddress = true;
  final List<String> _addressTypeList = ['home', 'office', 'others'];

  bool _loading = false;
  bool _updateAddressData = true;
  Placemark _placeMark = Placemark();
  Placemark _pickedPlaceMark = Placemark();
  List<AddressModel> _addressList = [];
  int _addressTypeIndex = 0;

  /// for service zone
  bool _isLoading = false;
  bool _inZone = false;
  bool _buttonDisabled = true;

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
  GoogleMapController get mapController => _mapController;
  List<AddressModel> get allAddressList => _allAddressList;
  bool get isLoading => _isLoading;
  bool get inZone => _inZone;
  bool get buttonDisabled => _buttonDisabled;

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
        ResponseModel responseModel = await getZone(
            position.target.latitude.toString(),
            position.target.longitude.toString(),
            false);

        /// buttonValue false means in the service area
        _buttonDisabled = !responseModel.isSuccess;
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
        //print(e);
      }
      _loading = false;
      update();
    } else {
      _updateAddressData = true;
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String address = 'Unknown Location Found';
    Response response = await locationRepo.getAddressFromGeocode(latLng);
    if (response.body['status'] == 'OK') {
      address = response.body['results'][0]['formatted_address'].toString();
      // print('PRINTING ADDRESS: $address');
    } else {
      //print('Error getting the google api');
    }
    update();
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
      //print(e);
    }
    return addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      await getAddressList();
      String message = response.body['message'];
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);
    } else {
      //print('Could not save the address');
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();
    if (response.statusCode == 200) {
      _addressList = [];
      _allAddressList = [];

      response.body.forEach((address) {
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    } else {
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }

  Future<bool> saveUserAddress(AddressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  String getUserAddressFromLocalStorage() {
    return locationRepo.getUserAddress();
  }

  void setAddAddressData() {
    _position = _pickedPosition;
    _placeMark = _pickedPlaceMark;
    _updateAddressData = false;
    update();
  }

  void clearAddressList() {
    _addressList = [];
    _allAddressList = [];
    update();
  }

  Future<ResponseModel> getZone(String lat, String lng, bool markerLoad) async {
    late ResponseModel responseModel;

    if (markerLoad) {
      _loading = true;
    } else {
      _isLoading = true;
    }
    update();
    Response response = await locationRepo.getZone(lat, lng);
    if (response.statusCode == 200) {
      _inZone = true;
      responseModel = ResponseModel(true, response.body['zone_id'].toString());
    } else {
      _inZone = false;
      responseModel = ResponseModel(true, response.statusText!);
    }

    if (markerLoad) {
      _loading = false;
    } else {
      _isLoading = false;
    }

    update();
    return responseModel;
  }
}
