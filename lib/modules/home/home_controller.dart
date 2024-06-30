import 'package:ayopemilu_mobile/data/apis/dashboard_api.dart';
import 'package:ayopemilu_mobile/data/apis/user_api.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/user_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final numberDesimal = NumberFormat.decimalPatternDigits(
    locale: "id_ID",
    decimalDigits: 2,
  );
  final numberRibuan = NumberFormat.decimalPattern("id_ID");

  UserAPI userAPI = UserAPI();
  DashboardAPI dashboardAPI = DashboardAPI();
  bool loadingCaleg = true;
  bool loadingRelawan = true;
  bool loadingPemilih = true;
  bool loadingCountdown = true;
  bool loadingLaporan = true;

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
  UserModel caleg = UserModel(
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
  );
  int countRelawan = 0;
  int countPemilih = 0;
  double peluangMenang = 0;
  int countLaporan = 0;

  @override
  onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    getCaleg();
    getDashboard();
    Future.delayed(const Duration(seconds: 1));
    loadingCountdown = false;
  }

  getDashboard() async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg) = await dashboardAPI.getHome(session.electionId);
      if (res) {
        loadingRelawan = false;
        loadingPemilih = false;
        loadingCountdown = false;
        loadingLaporan = false;
        countRelawan = data['bignumber']['relawan'];
        countLaporan = data['bignumber']['laporan'];
        countPemilih = data['bignumber']['pemilih'];
        peluangMenang = data['bignumber']['percentage'] / 100;
        update();
      } else {
        loadingRelawan = false;
        loadingPemilih = false;
        loadingCountdown = false;
        loadingLaporan = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingRelawan = false;
      loadingPemilih = false;
      loadingCountdown = false;
      loadingLaporan = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getCaleg() async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await userAPI.getById(session.calegId);
      if (res) {
        loadingCaleg = false;
        caleg = UserModel.fromMap(data);
        update();
      } else {
        loadingCaleg = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingCaleg = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }
}
