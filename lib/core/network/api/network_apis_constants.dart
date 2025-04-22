class ApiConstants {
  //static String baseUrl = "https://62.215.251.137/essapi/api/";
  static String baseUrl = "https://mpwpayment.diyarme.com/ESSAPI/api/";
  static String loan = "General/GetLoans";

  static var profile = "General/GetProfile";

  static var countriesGrants = "General/GetTAGrantCountries";

  static var institutionsGrants = "General/GetTAGrantInstitutions";

  static var contributions = "General/GetContribution";

  static var auth = "Auth/Login";

  static var generateOTP = "ChangePassword/GenerateOTP";

  static var verifyOTP = "ChangePassword/VerifyOTP";

  static var changePassword = "ChangePassword/ChangePassword";

  static var getGeneralInformation = "General/GetGeneralInformation";

  static var getKFManagment = "General/GetAllKFManagement";

  static var getKFBoardOfDirectors = "General/GetAllKFBoardOfDirectors";

  static var contactInformation = "General/GetContactInformation";

  static var mapCoordinates = "General/GetMapCoordinates";

  static var telephoneFax = "General/GetTelephoneNumberAndFax";

  static var getUserRequests = "Request/GetUserRequests";

  static var getAnnualLeaveBalance = "Leave/GetAnnualLeaveBalance";

  static var createAnnualLeaveRequest =
      "Leave/CreateEmployeeAnnualLeaveRequest";

  static var getEmergencyAvailableDays =
      "Leave/GetEmergencyLeaveBalanceRemaining";

  static var getEmergencyLeaveBalance = "Leave/GetEmergencyEligibleDays";

  static var createEmergencyLeaveRequest = "Leave/CreateEmergencyLeave";

  static var getCertificates = "Certificate/GetCertificates";

  static var getPersonalLoanMasterInfo = "Loan/GetPersonalLoanMasterInfo";

  static var getLoanReasons = "Loan/GetPersonalLoanReasonsList";

  static var createPersonalLoanRequest = "Loan/SubmitPersonalLoanRequest";

  static var getQrCertificates = "Certificate/GeneratePersonalStatmentWithQR";

  static var getSubmissions = "Request/GetEmployeeRequestsByType";

  static var getInsuranceMasterInfo = "Insurance/GetInsuranceMasterInfo";

  static var getInsurancePrograms = "Insurance/GetInsuranceProgramsList";

  static var getFamilyMembers = "Insurance/GetEmployeeFamilyMembersInfo";

  static var getSubscribers = "Insurance/GetInsuranceSubscribersList";

  static var createInsuranceRequest = "Insurance/SubmitMedicalInsuranceRequest";
  static var unsubscribeInsurance = "Insurance/CancelMedicalInsurance";

  static var getAttendanceDetails = "Attendance/GetAttendanceDetails";

  static var getRequestTypes = "Request/GetRequestType";

  static var getLeaveDashboard = "Leave/GetLeaveDashboard";

  static var getEmergencyEligibleDays = "Leave/GetEmergencyEligibleDays";
  static var getManagementVisitorsCalendar =
      'VisitorsLog/GetManagementVisitorsCalender';
  static var getManagementVisitorsCalendarDetails =
      'VisitorsLog/GetManagementVisitorsDetails';
  static var getLeaveRequestHistory = 'Leave/GetLeaveRequestHistory';
  static var getLeaveRequestInfo = 'Leave/GetLeaveRequestInfo';

  static var getHosts = 'VisitorsLog/GetHosts';

  static var getCanViewVisitorsLogs = 'VisitorsLog/CanViewVisitorsLog';
  static var createSickLeaveRequest = 'Leave/CreateSickLeaveRequest';
  static var getMyLeaveBalance = 'Leave/GetLeaveBalance';
  static var extendLeave = 'Leave/ExtendLeave';
  static var deleteLeave = 'Leave/DeleteLeaveRequest';
  static var getAllLeaveRequestsWaiting = 'Leave/GetAllLeaveRequestsWaiting';
  static var approveLeaveRequest = 'Leave/ApproveLeaveRequest';
  static var rejectLeaveRequest = 'Leave/RejectLeaveRequest';
  static var getDirectorMissionsDetails = 'Missions/GetManagmentAttendaceDate';
  static var getAllManagement = 'Missions/GetAllManagement';
  static var getManagementCalenderData = 'Missions/GetManagementCalenderData';
  static var readDepartments = 'Missions/ReadDepartments';

  static var getDeptCalenderData = 'Missions/GetOperationEmpsCalenderData';

  static var getTotalMissionByDepartmentDashboard =
      'Missions/GetTotalMissionByDepartmentDashboard';

  //profile
  static var getProfileInfo = 'Profile/GetEmployeeProfile';
  static var getAddressDetails = 'Profile/GetEmployeeAddressDetails';
  static var getFamilyData = 'Profile/GetEmployeeFamilyList';
  static var getQualificationsData = 'Profile/GetEmployeeQualificationsList';
  static var getExperiencesData = 'Profile/GetPreviousEmploymentList';
}
