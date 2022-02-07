import 'package:flutter/material.dart';

const int kTypeObject = 1;
const int kTypeOrganization = 100;
const int kTypePerson = 200;
const int kTypePlace = 300;
const int kTypeCategory = 400;
const int kTypeActivity = 500;
const int kTypeResource = 600;
const int kTypeInteraction = 700;
const int kTypeAppDomain = 2000;

// Places
const int kTypePlaceAddress = 301;
const int kTypePlaceLocation = 302;
const int kTypePlaceSite = 303;
const int kTypePlaceRegion = 304;
const int kTypePlaceCounty = 305;
const int kTypePlaceState = 306;
const int kTypePlaceProvince = 307;
const int kTypePlaceCountry = 308;
const int kTypePlaceContinent = 309;
const int kTypePlacePlanet = 310;
const int kTypePlaceGalaxyy = 311;

const int kTypeAppDomainDevelopment = 10000;
const int kTypeApp = 10001;
const int kTypeClient = 10002;
const int kTypeUserAccount = 10003;
const int kTypeUserRequest = 10004;
const int kTypeRequirement = 10005;
const int kTypeUseCase = 10006;
const int kTypeIssue = 10007;
const int kTypeChangeRequest = 10008;
const int kTypeUnitTest = 10009;
const int kTypeActor = 100010;
const int kTypeAssociation = 100011;
const int kTypeResponsibility = 100012;
const int kTypeFile = 100013;
const int kTypePost = 100014;
const int kTypeAppEvent = 100015;


getNsTypeIcon(int? typeId) {
    IconData icon;
    switch(typeId) {
      case kTypeObject:
        icon = Icons.class_;
        break;
      case kTypeOrganization:
        icon = Icons.group;
        break;
      case kTypePerson:
        icon = Icons.person;
        break;
      case kTypePlace:
        icon = Icons.place;
        break;
      default: 
        icon = Icons.emoji_objects;
        break;
    }

    return Icon(icon);
  }

