import 'package:flutter/material.dart';

//changa_one font
// xl-2 //not used
TextStyle xxlSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 28,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle xxlMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 28,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle xxlRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 28,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);

// xl-1
TextStyle xlSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 24,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle xlMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 24,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle xlRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 24,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        letterSpacing: -0.3,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);

// lg //not used
TextStyle lgBold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 20,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w700);
TextStyle lgSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 20,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle lgMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 20,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle lgRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 20,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);

// md
TextStyle mdSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 16,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle mdMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 16,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle mdRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 16,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);

// sm //not used
TextStyle smSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 12,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle smMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 12,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle smRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 12,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);

// xs //not used
TextStyle xsSemibold(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 8,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w600);
TextStyle xsMedium(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 8,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w500);
TextStyle xsRegular(
        {required Color color,
        String fontFamily = 'amaranth',
        bool underline = false,
        bool italic = false}) =>
    TextStyle(
        color: color,
        fontSize: 8,
        fontStyle: italic == true ? FontStyle.italic : FontStyle.normal,
        fontFamily: fontFamily,
        decoration:
            underline == false ? TextDecoration.none : TextDecoration.underline,
        fontWeight: FontWeight.w400);
