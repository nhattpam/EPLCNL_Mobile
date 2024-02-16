class Quiz {
  String? id;
  String? moduleId;
  String? classPracticeId;
  String? name;
  int? gradeToPass;
  int? deadline;
  String? createdDate;
  String? updatedDate;

  Quiz(
      {this.id,
        this.moduleId,
        this.classPracticeId,
        this.name,
        this.gradeToPass,
        this.deadline,
        this.createdDate,
        this.updatedDate});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleId = json['moduleId'];
    classPracticeId = json['classPracticeId'];
    name = json['name'];
    gradeToPass = json['gradeToPass'];
    deadline = json['deadline'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['moduleId'] = this.moduleId;
    data['classPracticeId'] = this.classPracticeId;
    data['name'] = this.name;
    data['gradeToPass'] = this.gradeToPass;
    data['deadline'] = this.deadline;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

class Deadline {
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

  Deadline(
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

  Deadline.fromJson(Map<String, dynamic> json) {
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
