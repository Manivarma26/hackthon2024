#include <pgmspace.h>
#define SECRET
#define THINGNAME "ESP32_DHT11"  //change this
const char WIFI_SSID[] = "ADD YOUR WIFI SSID";
const char WIFI_PASSWORD[] = "WIFI PASSWORD";
const char AWS_IOT_ENDPOINT[] = "AWS IOT ENDPOINT";

// Amazon Root CA 1
static const char AWS_CERT_CA[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
ADD AWS CA CERT HERE
-----END CERTIFICATE-----
)EOF";

// Device Certificate
static const char AWS_CERT_CRT[] PROGMEM = R"KEY(
-----BEGIN CERTIFICATE-----
ADD AWS CERT HERE
-----END CERTIFICATE-----
 
 
)KEY";

// Device Private Key //change this
static const char AWS_CERT_PRIVATE[] PROGMEM = R"KEY(
-----BEGIN RSA PRIVATE KEY-----
ADD AWS PARIVATE KEY HERE
-----END RSA PRIVATE KEY-----
)KEY";
