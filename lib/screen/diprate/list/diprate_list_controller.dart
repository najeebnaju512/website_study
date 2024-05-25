import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:nexteons_study_project/model/dip_rate_data_model/list.dart';
import 'package:nexteons_study_project/model/dip_rate_data_model/sample_datas.dart';
import 'package:nexteons_study_project/repository/diprate/get_dip_rate_api.dart';
import 'package:nexteons_study_project/screen/widget/app_snackbar.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/storage_keys.dart';

class DipRateListController extends GetxController {
  late SharedPreferences sharedPreferences;
  var dpilist = <DipListElement>[].obs;
  RxBool isLoading =false.obs;

  Future<void> getData() async {
    isLoading = true.obs;
    Map<String, String> headers = await getApiheader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
        query List(\$filterOptions: ListDpiInput!) {
          DpiRate_List(FilterOptions: \$filterOptions) {
            list {
              _name
              _rate
              _id
            }
            totalCount
          }
        }
      ''',
      'variables': {
        "filterOptions": {
          "branchIds": "6631da5ce9efa0bd84a86852",
          "limit": -1,
          "skip": 0,
          "statusArray": [1]
        }
      }
    };

    try {
      var responsebody =
          await GetDipRate.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        SampleDipRateModel sampleDipRateModel =
            SampleDipRateModel.fromJson(responsebody);

        // Updating dpilist with new datas fetched
        dpilist.value = sampleDipRateModel.data?.dpiRateList?.list ?? [];
        isLoading = false.obs;

        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  Future<Map<String, String>> getApiheader() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(StorageKeys.accessToken);
    if (accessToken != null) {
      return {"X-Tenant-Id": "RL0582", "Authorization": "Bearer $accessToken"};
    } else {
      log("accesstoken is null");
      return {};
    }
  }
}
