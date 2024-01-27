class QuizAttempt {
  String? id;
  String? quizId;
  String? learnerId;
  String? attemptedDate;
  OpenTime? openTime;
  OpenTime? closeTime;
  int? totalGrade;

  QuizAttempt(
      {this.id,
        this.quizId,
        this.learnerId,
        this.attemptedDate,
        this.openTime,
        this.closeTime,
        this.totalGrade});

  QuizAttempt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizId = json['quizId'];
    learnerId = json['learnerId'];
    attemptedDate = json['attemptedDate'];
    openTime = json['openTime'] != null
        ? new OpenTime.fromJson(json['openTime'])
        : null;
    closeTime = json['closeTime'] != null
        ? new OpenTime.fromJson(json['closeTime'])
        : null;
    totalGrade = json['totalGrade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quizId'] = this.quizId;
    data['learnerId'] = this.learnerId;
    data['attemptedDate'] = this.attemptedDate;
    if (this.openTime != null) {
      data['openTime'] = this.openTime!.toJson();
    }
    if (this.closeTime != null) {
      data['closeTime'] = this.closeTime!.toJson();
    }
    data['totalGrade'] = this.totalGrade;
    return data;
  }
}

class OpenTime {
  int? ticks;
  int? days;
  int? hours;
  int? milliseconds;
  int? minutes;
  int? seconds;
  int? totalDays;
  int? totalHours;
  int? totalMilliseconds;
  int? totalMinutes;
  int? totalSeconds;

  OpenTime(
      {this.ticks,
        this.days,
        this.hours,
        this.milliseconds,
        this.minutes,
        this.seconds,
        this.totalDays,
        this.totalHours,
        this.totalMilliseconds,
        this.totalMinutes,
        this.totalSeconds});

  OpenTime.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
    days = json['days'];
    hours = json['hours'];
    milliseconds = json['milliseconds'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    totalDays = json['totalDays'];
    totalHours = json['totalHours'];
    totalMilliseconds = json['totalMilliseconds'];
    totalMinutes = json['totalMinutes'];
    totalSeconds = json['totalSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['milliseconds'] = this.milliseconds;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['totalDays'] = this.totalDays;
    data['totalHours'] = this.totalHours;
    data['totalMilliseconds'] = this.totalMilliseconds;
    data['totalMinutes'] = this.totalMinutes;
    data['totalSeconds'] = this.totalSeconds;
    return data;
  }
}
