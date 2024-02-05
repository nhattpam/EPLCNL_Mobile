import 'package:flutter/material.dart';
import 'package:meowlish/data/models/modules.dart';

import 'categories.dart';
import 'enrollments.dart';
class Course {
  String? id;
  String? name;
  String? description;
  String? code;
  String? imageUrl;
  String? tutorId;
  num? stockPrice;
  bool? isActive;
  bool? isOnlineClass;
  num? rating;
  String? categoryId;
  String? tags;
  String? createdDate;
  String? updatedDate;
  Category? category;

  Course(
      {this.id,
        this.name,
        this.description,
        this.code,
        this.imageUrl,
        this.tutorId,
        this.stockPrice,
        this.isActive,
        this.isOnlineClass,
        this.rating,
        this.categoryId,
        this.tags,
        this.createdDate,
        this.updatedDate,
        this.category,
        });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    imageUrl = json['imageUrl'];
    tutorId = json['tutorId'];
    stockPrice = json['stockPrice'];
    isActive = json['isActive'];
    isOnlineClass = json['isOnlineClass'];
    rating = json['rating'];
    categoryId = json['categoryId'];
    tags = json['tags'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['code'] = this.code;
    data['imageUrl'] = this.imageUrl;
    data['tutorId'] = this.tutorId;
    data['stockPrice'] = this.stockPrice;
    data['isActive'] = this.isActive;
    data['isOnlineClass'] = this.isOnlineClass;
    data['rating'] = this.rating;
    data['categoryId'] = this.categoryId;
    data['tags'] = this.tags;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}







