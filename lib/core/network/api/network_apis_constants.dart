class ApiConstants {
  static String baseUrl =
      "https://ess-api-c9a8fhh4hjhedub3.westeurope-01.azurewebsites.net/api/";
  static String loan = "General/GetLoans";

  static var profile = "General/GetProfile";

  static var countriesGrants = "General/GetTAGrantCountries";

  static var institutionsGrants = "General/GetTAGrantInstitutions";

  static var contributions = "General/GetContribution";

  static var auth = "Login/LoginUser";

  static var generateOTP = "ChangePassword/GenerateOTP";

  static var verifyOTP = "ChangePassword/VerifyOTP";

  static var changePassword = "ChangePassword/ChangePassword";

  static var getGeneralInformation = "General/GetGeneralInformation";

  static var getKFManagment = "General/GetAllKFManagement";

  static var getKFBoardOfDirectors = "General/GetAllKFBoardOfDirectors";

  static var contactInformation = "General/GetContactInformation";

  static var mapCoordinates = "General/GetMapCoordinates";

  static var telephoneFax = "General/GetTelephoneNumberAndFax";

  static var getEmployeeRequestsByType = "Request/GetEmployeeRequestsByType";

  static var getLeaveBalance = "Leave/GetAnnualLeaveBalance";

  static var createAnnualLeaveRequest =
      "Leave/CreateEmployeeAnnualLeaveRequest";

  static var getEmergencyAvailableDays =
      "Leave/GetEmergencyLeaveBalanceRemaining";

  static var getEmergencyLeaveBalance = "Leave/GetEmergencyEligibleDays";

  static var createEmergencyLeaveRequest = "Leave/CreateEmergencyLeave";

  static var getCertificates = "Certificate/GetCertificates";
}
