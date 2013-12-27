Spark_RC_car_PiCamera
=====================
A DIY toy with Spark core and Pi camera. You can remote control the RC Car and watch the live streaming by this app.

## Preview
![SIAlertView Screenshot] (http://i.imgur.com/tjpyl0x.jpg)
![SIAlertView Screenshot] (http://i.imgur.com/8BAdyBF.jpg)

## Features
Remote control your RC Car and watch the live streaming at the same time.

## Requirements
### Software
- iOS 7.0 and greater
- ARC

### Hardware
- [Spark core](https://www.spark.io/)
- [Raspberry Pi and Camera](http://uk.rs-online.com/web/generalDisplay.html?id=raspberrypi)
- You iPhone

## Installation
1.
Start HTTP streaming server in Pi with raspivid command.
- raspivid -o - -t 9999999 |cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8554}' :demux=h264

2.
Modify the ViewController.m
- ACCESS_TOKEN @"PUT YOUR ACCESS TOKEN"
- DEVICE_ID @"PUT YOUR DEVICE ID"
- PI_CAMERA_HOST @"http://YOUR PI IP or DOMAIN:8554/"

3.
Build this app and enjoy it:D

## Credits
- Use [AFNetworking](https://github.com/AFNetworking/AFNetworking) for HTTP POST
- Use [KxMovie](https://github.com/kolyvan/kxmovie) for live streaming

## License
Under the MIT license. See the LICENSE file for more info.
