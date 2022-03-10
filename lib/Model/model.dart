import 'package:flutter/material.dart';
class Google extends ChangeNotifier {
  List<Results> results;
  List<Null> imageResults;
  int total;
  List<String> answers;
  double ts;
  String deviceRegion;
  String deviceType;

  Google(
      {this.results,
      this.imageResults,
      this.total,
      this.answers,
      this.ts,
      this.deviceRegion,
      this.deviceType});

  Google.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    
    total = json['total'];
    answers = json['answers'].cast<String>();
    ts = json['ts'];
    deviceRegion = json['device_region'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['answers'] = this.answers;
    data['ts'] = this.ts;
    data['device_region'] = this.deviceRegion;
    data['device_type'] = this.deviceType;
    return data;
    
  }
notifyListeners();
}

class Results {
  String title;
  String link;
  String description;
  List<AdditionalLinks> additionalLinks;
  Cite cite;

  Results(
      {this.title,
      this.link,
      this.description,
      this.additionalLinks,
      this.cite});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    description = json['description'];
    if (json['additional_links'] != null) {
      additionalLinks = <AdditionalLinks>[];
      json['additional_links'].forEach((v) {
        additionalLinks.add(new AdditionalLinks.fromJson(v));
      });
    }
    cite = json['cite'] != null ? new Cite.fromJson(json['cite']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['description'] = this.description;
    if (this.additionalLinks != null) {
      data['additional_links'] =
          this.additionalLinks.map((v) => v.toJson()).toList();
    }
    if (this.cite != null) {
      data['cite'] = this.cite.toJson();
    }
    return data;
  }
}

class AdditionalLinks {
  String text;
  String href;

  AdditionalLinks({this.text, this.href});

  AdditionalLinks.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['href'] = this.href;
    return data;
  }
}

class Cite {
  String domain;
  String span;

  Cite({this.domain, this.span});

  Cite.fromJson(Map<String, dynamic> json) {
    domain = json['domain'];
    span = json['span'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domain'] = this.domain;
    data['span'] = this.span;
    return data;
    
  }
  
}