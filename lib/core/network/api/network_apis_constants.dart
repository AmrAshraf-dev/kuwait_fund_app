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

  static var getAnnualLeaveBalance = "UrgentLeave/GetAnnualLeaveRequestScreenInfo"; // to delete 

  static var createAnnualLeaveRequest =
      "UrgentLeave/CreateEmployeeAnnualLeaveRequest";

  static var getEmergencyAvailableDays =
      "Leave/GetEmergencyLeaveBalanceRemaining"; // to delete

  static var getEmergencyLeaveScreen = "EmergencyLeave/GetEmergencyLeaveScreen";  

  static var createEmergencyLeaveRequest = "EmergencyLeave/CreateEmergencyLeave";

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

  static var getLeaveDashboard = "UrgentLeave/GetLeaveDashboard";

  static var getEmergencyEligibleDays = "EmergencyLeave/GetEmergencyLeaveScreen";
  
  static var getManagementVisitorsCalendar =
      'VisitorsLog/GetManagementVisitorsCalender';
  static var getManagementVisitorsCalendarDetails =
      'VisitorsLog/GetManagementVisitorsDetails';

  static var getHosts = 'VisitorsLog/GetHosts';

  static var getCanViewVisitorsLogs = 'VisitorsLog/CanViewVisitorsLog';
  static var createSickLeaveRequest = 'SickLeave/CreateSickLeaveRequest';
  static var getMyLeaveBalance = 'Leave/GetLeaveBalance'; // delete and show 0 
  static var extendLeave = 'UrgentLeave/ExtendLeave';
  static var deleteLeave = 'UrgentLeave/DeleteLeaveRequest';
  static var getAllLeaveRequestsWaiting = 'Approval/GetAllLeaveRequestsWaiting';
  static var approveLeaveRequest = 'Approval/ApproveLeaveRequest';
  static var rejectLeaveRequest = 'Approval/RejectLeaveRequest';

  //profile
  static var getProfileInfo = 'Profile/GetEmployeeProfile';
  static var getAddressDetails = 'Profile/GetEmployeeAddressDetails';
  static var getFamilyData = 'Profile/GetEmployeeFamilyList';

  static var getAllManagement = 'Missions/GetAllManagement';
  static var getManagementCalenderData =
      'Missions/GetManagementCalenderData';

  static var getDirectorMissionsDetails =
      'Missions/GetManagmentAttendaceDate';


  static var readDepartments = 'Missions/ReadDepartments';

  static var getDeptCalenderData =
      'Missions/GetOperationEmpsCalenderData';

  static var getTotalMissionByDepartmentDashboard =
      'Missions/GetTotalMissionByDepartmentDashboard'; 
}
