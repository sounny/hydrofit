# My Watch Face App

## Overview
This project is a custom watch face application designed for Garmin devices, specifically targeting the Garmin Swim 2. It showcases features such as displaying time, date, and swimmer-oriented metrics.

## Project Structure
- **manifest.xml**: Contains metadata for the watch face application, including app name, version, and permissions.
- **resources/drawables/drawables.xml**: Defines drawable resources used in the watch face.
- **resources/fonts/fonts.xml**: Specifies font resources for custom text styling.
- **resources/layouts/layout.xml**: Describes the layout of the watch face.
- **resources/strings/strings.xml**: Contains string resources for labels and messages.
- **source/MyWatchFaceApp.mc**: Main entry point of the watch face application.
- **source/MyWatchFaceView.mc**: Defines the custom view for the watch face.

## Setup Instructions
1. Ensure you have Monkey C installed on your development environment.
2. Clone this repository to your local machine.
3. Open the project in your preferred code editor.
4. Modify the `manifest.xml` file to set your app's name and version.
5. Customize the drawable, font, and layout resources as needed.
6. Implement your watch face logic in `MyWatchFaceApp.mc` and `MyWatchFaceView.mc`.
7. Build and deploy the application to your Garmin device for testing.

## Usage
Once installed on your Garmin device, you can select this watch face from the device settings. Customize the appearance and functionality as desired.
The default layout includes heart rate, battery, daily steps, and basic swim metrics like distance swum and lap count.

## Contributing
Feel free to submit issues or pull requests if you have suggestions or improvements for the watch face application.