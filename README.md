# MedScanV5
The MedScan application is the result of a semester-long interdisciplinary project conducted as part of the Assistive Technology Challenge organized by Hackahealth at EPFL (École Polytechnique Fédérale de Lausanne). This challenge aims to empower students by addressing the daily challenges faced by individuals with disabilities. Our team, composed of four master's students with diverse engineering backgrounds and a challenger, received from the Swiss Institute for Blind and Visually Impaired individuals (SBV-FSA) the problem to develop an innovative solution.
The specific problem presented by SBV-FSA was to assist visually impaired individuals in accessing basic medical information from medication boxes. Our solution is the MedScan app, which utilizes barcode scanning technology to provide essential information to users, while adhering to accessibility guidelines specifically designed for individuals with visual impairments.
In this report, we will discuss the design choices made during the development of the MedScan app. We will provide detailed steps to reproduce the app, ensuring its replicability. Additionally, we will present further steps that can be taken to improve the prototype and enhance its functionality.


## Prerequisites

All the prequisites are listed in the pubspec.yaml file.

## Installation

### Installation on an Android device
The installation on an Android device is quite simple. The latest release can be downloaded under Releases on this github repo as an apk. Once it is transferred
to an Android device it can be opened with the inbuilt file manager which will automatically install the app on the device.

### Setup 
1. Setup a flutter environment in Android Studio. Follow the instructions from the official page [Flutter](https://docs.flutter.dev/get-started/editor?tab=vscode) website for more information.
2. Clone the repository to your local machine using the following command:
<pre>

git clone git@github.com:Assistive-Technology-Challenge-2023/medscan-interface-v5.git

</pre>
3. Get the dependencies by switching to the directory of the project and run the following line:

<pre>

flutter pub get

</pre>

4. Add the database from this [link](https://drive.switch.ch/index.php/apps/files/?dir=/ATC%20P2&fileid=5975444117) to the assets directory
