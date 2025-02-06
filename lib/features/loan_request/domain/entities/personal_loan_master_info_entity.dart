class PersonalLoanMasterInfoEntity {
  final String? personalLoanRequestID;
  final String? employeeName;
  final String? loanAmount;
  final String? noOfInstalments;
  final String? installmentAmount;
  final String? applicationDate;
  final String? approvalType;
  final String? remarks;
  final String? reasonLabel;
  final String? maxLoanAmount;

  PersonalLoanMasterInfoEntity({
    required this.personalLoanRequestID,
    required this.employeeName,
    required this.loanAmount,
    required this.noOfInstalments,
    required this.installmentAmount,
    required this.applicationDate,
    required this.approvalType,
    required this.remarks,
    required this.reasonLabel,
    required this.maxLoanAmount,
  });
}
