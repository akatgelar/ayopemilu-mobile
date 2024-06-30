import 'package:ayopemilu_mobile/data/apis/dashboard_api.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VotersGender {
  VotersGender(
    this.name,
    this.number,
    this.color,
  );
  final String name;
  final double number;
  final Color color;
}

class VotersReligion {
  VotersReligion(this.name, this.number);
  final String name;
  final double number;
}

class VotersMonth {
  VotersMonth(this.month, this.monthText, this.value);
  final String month;
  final String monthText;
  final double value;
}

class ReportStatus {
  ReportStatus(
    this.name,
    this.number,
    this.color,
  );
  final String name;
  final double number;
  final Color color;
}

class ReportMonth {
  ReportMonth(this.month, this.monthText, this.value);
  final String month;
  final String monthText;
  final double value;
}

class FinanceMonth {
  FinanceMonth(this.month, this.monthText, this.value);
  final String month;
  final String monthText;
  final double value;
}

class InventoryMonth {
  InventoryMonth(this.month, this.monthText, this.value);
  final String month;
  final String monthText;
  final double value;
}

class StatistikController extends GetxController {
  int selectedIndex = 0;

  final numberRibuan = NumberFormat.decimalPattern("id_ID");
  DashboardAPI dashboardAPI = DashboardAPI();

  SessionModel session = SessionModel(
    token: '',
    id: 0,
    name: '',
    email: '',
    gender: '',
    bod: '',
    phone: '',
    address: '',
    picture: 'none.png',
    expiredDate: '',
    roleId: 0,
    roleName: '',
    electionId: 0,
    electionCategory: '',
    electionArea: '',
    electionSubarea: '',
    electionVotersAll: 0,
    electionVotersTarget: 0,
    calegId: 0,
  );
  var votersDashboard = {};
  var reportDashboard = {};
  var financeDashboard = {};
  var inventoryDashboard = {};

  bool votersLoading = true;
  bool reportLoading = true;
  bool financeLoading = true;
  bool inventoryLoading = true;

  List<VotersGender> dataVotersGender = [];
  List<VotersReligion> dataVotersReligion = [];
  List<VotersMonth> dataVotersMonth = [];

  List<ReportStatus> dataReportStatus = [];
  List<ReportMonth> dataReportMonth = [];

  List<FinanceMonth> dataFinanceMonth = [];
  List<InventoryMonth> dataInventoryMonth = [];

  @override
  onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    getVoters();
    getReport();
    getFinance();
    getInventory();
  }

  getVoters() async {
    try {
      // ignore: unused_local_variable
      var (res1, data1, msg1) = await dashboardAPI.getVoters(session.electionId);
      if (res1) {
        votersDashboard = data1;

        for (var element in votersDashboard['group_gender']) {
          if (element['gender'] == 'Perempuan') {
            dataVotersGender.add(VotersGender(element['gender'], element['count'], Colors.pink));
          } else {
            dataVotersGender.add(VotersGender(element['gender'], element['count'], Colors.lightBlue));
          }
        }

        for (var element in votersDashboard['group_religion']) {
          dataVotersReligion.add(VotersReligion(element['religion'], element['count']));
        }

        for (var element in votersDashboard['group_month']) {
          dataVotersMonth.add(VotersMonth(element['month'], element['month_indo'], element['count']));
        }

        votersLoading = false;
        update();
      }
    } catch (err) {
      votersLoading = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getReport() async {
    try {
      // ignore: unused_local_variable
      var (res2, data2, msg2) = await dashboardAPI.getReport(session.electionId);
      if (res2) {
        reportDashboard = data2;

        for (var element in reportDashboard['group_status']) {
          if (element['status'] == 'Baru') {
            dataReportStatus.add(ReportStatus(element['status'], element['count'], Colors.red));
          } else if (element['status'] == 'Proses') {
            dataReportStatus.add(ReportStatus(element['status'], element['count'], Colors.yellow));
          } else if (element['status'] == 'Selesai') {
            dataReportStatus.add(ReportStatus(element['status'], element['count'], Colors.green));
          } else {
            dataReportStatus.add(ReportStatus(element['status'], element['count'], Colors.grey));
          }
        }

        for (var element in reportDashboard['group_month']) {
          dataReportMonth.add(ReportMonth(element['month'], element['month_indo'], element['count']));
        }

        reportLoading = false;
        update();
      }
    } catch (err) {
      reportLoading = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getFinance() async {
    try {
      // ignore: unused_local_variable
      var (res3, data3, msg3) = await dashboardAPI.getFinance(session.electionId);
      if (res3) {
        financeDashboard = data3;

        for (var element in financeDashboard['group_month']) {
          dataFinanceMonth.add(FinanceMonth(element['month'], element['month_indo'], double.parse(element['sum'])));
        }

        financeLoading = false;
        update();
      }
    } catch (err) {
      financeLoading = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getInventory() async {
    try {
      // ignore: unused_local_variable
      var (res4, data4, msg4) = await dashboardAPI.getInventory(session.electionId);
      if (res4) {
        inventoryDashboard = data4;

        for (var element in inventoryDashboard['group_month']) {
          dataInventoryMonth.add(InventoryMonth(element['month'], element['month_indo'], double.parse(element['sum'])));
        }

        inventoryLoading = false;
        update();
      }
    } catch (err) {
      inventoryLoading = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }
}
