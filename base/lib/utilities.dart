String calculateTime(int timeStamp){
  var time = DateTime.fromMillisecondsSinceEpoch(timeStamp);
  var timeDifferance = DateTime.now().difference(time);
  if (timeDifferance.inHours > 24){
    return "${(timeDifferance.inHours / 24).round()} Days ago";
  } else if (timeDifferance.inHours < 24 && timeDifferance.inHours > 0){
    return "${timeDifferance.inHours} Hours ago";
  } else if (timeDifferance.inMinutes > 0){
    return "${timeDifferance.inMinutes} Minutes ago";
  } else {
    return "${timeDifferance.inSeconds} Seconds ago";
  }
}