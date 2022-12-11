import 'package:copadomundofiap/components/inner_text.dart';
import 'package:copadomundofiap/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:copadomundofiap/api/model/matches_model.dart';
import 'package:intl/intl.dart';

class MatchLine extends StatelessWidget {

  MatchLine({
    super.key,
    required this.match,
  });

  final Match match;
  late bool penalties = false;

  @override
  Widget build(BuildContext context) {
    penalties = (match.homeTeam?.penalties != match.awayTeam?.penalties);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: setupMatch(),
    );
  }

  Widget setupMatch() {
    if (match.status == Status.FUTURE_UNSCHEDULED) {
      return tbdMatch();
    } else if (match.winner != null) {
        return standardMatch();
    } else {
      return standardMatch();
    }
  }

  Widget tbdMatch() {
    return
      Container(
        padding: const EdgeInsets.only(
          left:16,
          top:24,
          right:16,
          bottom:24
        ),
        decoration: BoxDecoration(
          gradient: standardGradient(),
          borderRadius: const BorderRadius.all(Radius.circular(12))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InnerText(text: "${match.stageName!}"),
          ],
        )
      );
  }

  Widget standardMatch() {
    String m = "-";
    final DateFormat formatter = DateFormat('MMM dd    HH:mm');
    if (match.datetime != null) {
      m = formatter.format(match.datetime!);
    }
    return
      Container(
          padding: const EdgeInsets.only(
              left:16,
              top:24,
              right:16,
              bottom:24
          ),
          decoration: BoxDecoration(
            gradient: standardGradient(),
            borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              InnerText(text: match.stageName!),
              InnerText(text: m),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  homeTeamCard(),
                  Expanded(flex: 1,child: InnerText(text: " x "),),
                  awayTeamCard(),
                ]
              ),
              InnerText(text: match.venue!),
            ]
          )
      );
  }

  LinearGradient standardGradient() {
    return
      const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFb92d45),
            Color(0xFF621723),
            Color(0xFF621723),
            Color(0xFFb92d45),
          ],
        stops: [0,0.2,0.8,1]
      );
  }

  Widget homeTeamCard() {
    Team team = match.homeTeam!;
    return 
      Expanded(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            teamFlagAndName(team),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  scoreHome()
                ]
            )
          ],
        ),
      );
  }

  Widget awayTeamCard() {
    Team team = match.awayTeam!;
    return
      Expanded(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  scoreAway()
                ]
            ),
            teamFlagAndName(team),
          ],
        ),
      );
  }

  Widget teamFlagAndName(Team team) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/flags/${team.country!}.png"),
            ),
          ),
        ),
        InnerText(text: team.country!)
      ],
    );
  }

  Widget scoreHome() {
    if (match.homeTeam!.goals != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            Text(
              scoreHomeText(),
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600)
            )
          ]
        ),
      );
    } else {
      return const InnerText(text: "-");
    }
  }

  String scoreHomeText() {
    if (penalties) {
      return "${match.homeTeam!.goals!} (${match.homeTeam!.penalties!})";
    } else {
      return "${match.homeTeam!.goals!}";
    }
  }

  Widget scoreAway() {
    if (match.awayTeam!.goals != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
            children: [
              Text(
                  scoreAwayText(),
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)
              )
            ]
        ),
      );
    } else {
      return const InnerText(text: "-");
    }
  }

  String scoreAwayText() {
    if (penalties) {
      return "(${match.awayTeam!.penalties!}) ${match.awayTeam!.goals!}";
    } else {
      return "${match.awayTeam!.goals!}";
    }
  }
}