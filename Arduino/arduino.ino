const int sensorPin = A0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int value = analogRead(sensorPin);
  float millivolts = (value/1023.0)*5000;
  float celsius = millivolts / 10;
  Serial.println(String(celsius));
  delay(5000);

}