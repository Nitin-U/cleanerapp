class AppUrl {
  static const mainUrl =
      'https://5088-2400-1a00-b030-420a-ac46-3698-9ae5-b8c0.ngrok-free.app/api/';
  // static const mainUrl = 'http://127.0.0.1:8000/api/';
  static const loginurl = '${mainUrl}login';
  static const binbooking = '${mainUrl}bin-bookings';
  static const myorder = '${mainUrl}bin-bookings/order?driver_id=';
  static const acceptrequest = '${mainUrl}bin-bookings/accept';
  static const updateserialnumber =
      '${mainUrl}bin-bookings/update-serial-number/';
  static const binbookingdetails = '${mainUrl}bin-bookings/';
  static const logout = '${mainUrl}logout';
  static const updateattachments = '${mainUrl}bin-bookings/update-booking-attachments/';
}
