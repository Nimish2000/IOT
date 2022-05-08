#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>


String host = "safe-reaches-93337.herokuapp.com";
int httpPort = 80;  
String url1 = "/LED";
HTTPClient http; 
WiFiClient c;

void setup() 
{
  pinMode(D3, OUTPUT);
  Serial.begin(9600);
  WiFi.begin("Nimish", "nimish2000");
  while(WiFi.status() != WL_CONNECTED)
  {
    delay(200);
    Serial.print("..");
  }
  Serial.println();
  Serial.println("NodeMCU is connected!");
  Serial.println(WiFi.localIP());
}

void loop() 
{
  http.begin(c,host,httpPort,url1); 
  int httpCode = http.GET();
  Serial.println(httpCode);
  String payload = http.getString();
  Serial.println(payload);
  if(payload=="0"){
    digitalWrite(D3, LOW);
  }
  else{
    digitalWrite(D3, HIGH);
  }
  delay(50);
}
