class SpeechToTextConstants {
  static List<Map<String, Object>> routesList = <Map<String, Object>>[
    <String, Object>{
      "routeName": "searchEmployee",
      "EnglishKeywords": <String>[
        "search",
        "employee",
        "search about"
            "search employee",
        "search for employee",
        "search about employee",
        "search about (employee name)",
        "search for (employee name)",
        "search (employee name)"
      ],
      "ArabicKeywords": <String>[
        "بحث عن العاملين",
        "بحث",
        "عامل",
        "بحث عن عامل",
        "بحث عن العامل",
        "بحث عن (اسم العامل)"
      ]
    },
    <String, Object>{
      "routeName": "businessCard",
      "EnglishKeywords": <String>[
        "business card",
        "card",
        "business",
        "businesscard",
        "card",
        "work id"
      ],
      "ArabicKeywords": <String>[
        "بطاقة العمل",
        "بطاقة",
        "عمل",
        "بطاقة عمل",
        "بطاقة العمل"
      ]
    },
    <String, Object>{
      "routeName": "LoggedInFinancialCalculator",
      "EnglishKeywords": <String>[
        "financial calculator",
        "calculator",
        "financial",
        "calculate",
        "calculate financial",
        "financial calculation",
        "calculation"
      ],
      "ArabicKeywords": <String>[
        "الحاسبة المالية",
        "الحاسبة",
        "المالية",
        "حساب",
        "حساب مالي",
        "الحساب المالي"
      ]
    },
    <String, Object>{
      "routeName": "loginInLocation",
      "EnglishKeywords": <String>[
        "login in location",
        "login in",
        "login",
        "location"
      ],
      "ArabicKeywords": <String>["التحضير بالموقع"]
    },
    <String, Object>{
      "routeName": "trainingCourses",
      "EnglishKeywords": <String>["training courses", "courses", "training"],
      "ArabicKeywords": <String>["دورات تدريبية", "دورات", "تدريب"]
    },
    <String, Object>{
      "routeName": "swaBooking",
      "EnglishKeywords": <String>["booking", "booking service"],
      "ArabicKeywords": <String>["حجز سوا", "حجز", "سوا"]
    },
    <String, Object>{
      "routeName": "notesAndReport",
      "EnglishKeywords": <String>["notes", "report", "notes and report"],
      "ArabicKeywords": <String>["الملاحظات", "التقارير", "الملاحظات والتقارير"]
    },
    <String, Object>{
      "routeName": "attendanceAndDeparture",
      "EnglishKeywords": <String>["attendance", "departure"],
      "ArabicKeywords": <String>["الحضور", "الانصراف"]
    },
    <String, Object>{
      "routeName": "identification",
      "EnglishKeywords": <String>["salary", "identification"],
      "ArabicKeywords": <String>["تعريف الراتب", "الراتب", "تعريف"]
    },
    <String, Object>{
      "routeName": "vacations",
      "EnglishKeywords": <String>["vacations", "vacation"],
      "ArabicKeywords": <String>["الاجازات", "الاجازة"]
    },
    <String, Object>{
      "routeName": "salaryPath",
      "EnglishKeywords": <String>["salary pay slip", "salary", "slip"],
      "ArabicKeywords": <String>["مسير الراتب", "الراتب", "مسير"]
    },
    <String, Object>{
      "routeName": "healthInsurance",
      "EnglishKeywords": <String>["health insurance", "insurance", "health"],
      "ArabicKeywords": <String>["التأمين الصحي", "التأمين", "صحي"]
    },
    <String, Object>{
      "routeName": "subordinates",
      "EnglishKeywords": <String>["subordinates", "subordinate"],
      "ArabicKeywords": <String>["المرؤوسين", "المرؤوس"]
    }
  ];

  static String geminiQueryText =
      "and extract the matched routeName in EnglishKeywords and ArabicKeywords in this list ${routesList.toString()} the result should be like {routeName: searchEmployee, personName: } , if the search phrase does not mention the person name return the matched routeName only";

  // static String geminiQueryText =
  //     " Extract if the searchText matches any keyword in either EnglishKeywords or ArabicKeywords for each route. If a match is found, return the routeName of that route." +
  //         " if the search text starts with 'search about' (or a similar phrase that implies an employee name search), extract the name following this phrase" +
  //         " if a name is identified, and the relevant route for employee searches is searchEmployee, return the routeName for searchEmployee along with the identified name." +
  //         " the list of routes to search in is: ${routesList.toString()}" +
  //         " if no match is found, return 'null' " +
  //         "don't return any other code or scripts." +
  //         " return the result as Map<String, dynamic> with the following keys: 'routeName' and 'employeeName'";

  // " so Search in the following list of Englishkeywords AND Arabickeywords [ ${routesList.toString()} ] If searchText matches exactly with any Englishkeywords or Arabickeywords , return the matched routeName + employee name in searchText if exits. If there is no exact match, return 'null'";
}
