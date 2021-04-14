const GOOGLE_API_KEY = 'AIzaSyBC4Rzr3TTRqBREV579jEGqWxDILH9RkmI';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude, double longitude}) {
    //follow: https://developers.google.com/maps/documentation/maps-static/overview
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
