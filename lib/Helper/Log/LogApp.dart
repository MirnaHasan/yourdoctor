import 'dart:developer';


   logWarning(String message) {
    log('\x1B[33m$message\x1B[0m');
  }

   logError(String message) {
    log('\x1B[31m$message\x1B[0m');
  }

   logSuccess(String message) {
    log('\x1B[32m$message\x1B[0m');
  }

   logInfo(String message) {
    log('\x1B[36m$message\x1B[0m');
  }

