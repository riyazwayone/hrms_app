class RazorpayConfig {
  static const String apiKey = 'rzp_test_YOUR_KEY_HERE';
  static const String apiSecret = 'YOUR_SECRET_HERE'; // Only use on server-side

  // Verification endpoint (normally you would implement this server-side)
  static const String verificationEndpoint = '/payments/verify/';
}
