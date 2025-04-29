class ApiConstants {
  //static String baseUrl = "https://62.215.251.137/essapi/api/";
//static String baseUrl = "https://mpwpayment.diyarme.com/essapi/api/";
  static String baseUrl = "https://kf-exapp-test.kuwait-fund.org/essapi/api/";
  static String loan = "General/GetLoans";

  static String profile = "General/GetProfile";

  static String countriesGrants = "General/GetTAGrantCountries";

  static String institutionsGrants = "General/GetTAGrantInstitutions";

  static String contributions = "General/GetContribution";

  static String auth = "Auth/Login";

  static String generateOTP = "ChangePassword/GenerateOTP";

  static String verifyOTP = "ChangePassword/VerifyOTP";

  static String changePassword = "ChangePassword/ChangePassword";

  static String getGeneralInformation = "General/GetGeneralInformation";

  static String getKFManagment = "General/GetAllKFManagement";

  static String getKFBoardOfDirectors = "General/GetAllKFBoardOfDirectors";

  static String contactInformation = "General/GetContactUsInformation";

  static String getUserRequests = "Request/GetUserRequests";

  static String getAnnualLeaveBalance =
      "UrgentLeave/GetAnnualLeaveRequestScreenInfo"; // to delete

  static String createAnnualLeaveRequest =
      "UrgentLeave/CreateEmployeeAnnualLeaveRequest";

  static String getEmergencyAvailableDays =
      "Leave/GetEmergencyLeaveBalanceRemaining"; // to delete

  static String getEmergencyLeaveScreen =
      "EmergencyLeave/GetEmergencyLeaveScreen";

  static String createEmergencyLeaveRequest =
      "EmergencyLeave/CreateEmergencyLeave";

  static String getCertificates = "Certificate/GetCertificates";

  static String getPersonalLoanMasterInfo = "Loan/GetPersonalLoanMasterInfo";

  static String getLoanReasons = "Loan/GetPersonalLoanReasonsList";

  static String createPersonalLoanRequest = "Loan/SubmitPersonalLoanRequest";

  static String getQrCertificates =
      "Certificate/GeneratePersonalStatmentWithQR";

  static String getSubmissions = "Request/GetEmployeeRequestsByType";

  static String getInsuranceMasterInfo = "Insurance/GetInsuranceMasterInfo";

  static String getInsurancePrograms = "Insurance/GetInsuranceProgramsList";

  static String getFamilyMembers = "Insurance/GetEmployeeFamilyMembersInfo";

  static String getSubscribers = "Insurance/GetInsuranceSubscribersList";

  static String createInsuranceRequest =
      "Insurance/SubmitMedicalInsuranceRequest";
  static String unsubscribeInsurance = "Insurance/CancelMedicalInsurance";

  static String getAttendanceDetails = "Attendance/GetAttendanceDetails";

  static String getRequestTypes = "Request/GetRequestType";

  static String getLeaveDashboard = "UrgentLeave/GetLeaveDashboard";

  static String getEmergencyEligibleDays =
      "EmergencyLeave/GetEmergencyLeaveScreen";

  static String getManagementVisitorsCalendar =
      'VisitorsLog/GetManagementVisitorsCalender';
  static String getManagementVisitorsCalendarDetails =
      'VisitorsLog/GetManagementVisitorsDetails';

  static String getHosts = 'VisitorsLog/GetHosts';

  static String getCanViewVisitorsLogs = 'VisitorsLog/CanViewVisitorsLog';
  static String createSickLeaveRequest = 'SickLeave/CreateSickLeaveRequest';
  static String getMyLeaveBalance =
      'Leave/GetLeaveBalance'; // delete and show 0
  static String extendLeave = 'UrgentLeave/ExtendLeave';
  static String deleteLeave = 'UrgentLeave/DeleteLeaveRequest';
  static String getAllLeaveRequestsWaiting =
      'Approval/GetAllLeaveRequestsWaiting';
  static String approveLeaveRequest = 'Approval/ApproveLeaveRequest';
  static String rejectLeaveRequest = 'Approval/RejectLeaveRequest';

  //profile

  static String getAllManagement = 'Missions/GetAllManagement';
  static String getManagementCalenderData =
      'Missions/GetManagementCalenderData';

  static String getDirectorMissionsDetails =
      'Missions/GetManagmentAttendaceDate';

  static String readDepartments = 'Missions/ReadDepartments';

  //profile
  static String getProfileInfo = 'Profile/GetEmployeeProfile';
  static String getAddressDetails = 'Profile/GetEmployeeAddressDetails';
  static String getFamilyData = 'Profile/GetEmployeeFamilyList';
  static String getQualificationsData = 'Profile/GetEmployeeQualificationsList';
  static String getExperiencesData = 'Profile/GetPreviousEmploymentList';
  static String getSpouseData = 'Profile/GetSpouseInfo';
  static String getChildData = 'Profile/GetChildInfo';
  static String editProfile = 'Profile/UpdateEmployeeProfile';
  static String editSpouse = 'Profile/SubmitSpouseModificationRequest';
  static String getDeptCalenderData = 'Missions/GetOperationEmpsCalenderData';

  static String getTotalMissionByDepartmentDashboard =
      'Missions/GetTotalMissionByDepartmentDashboard';

  static String getDirectorDeptMissionsDetails =
      'Missions/GetOperationEmpsAttendaceDate';

  static var editChild = 'Profile/SubmitChildModificationRequest';
}
