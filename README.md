# Conservation Survey Generator

This repository contains a simple HTML application used for generating Clowes Conservation Surveys at the Indianapolis Museum of Art at Newfields. The application queries the Newfields' DAMS, Piction, to retrieve collection object(s) primary image and the Conservation Survey data to populate the report(s).

## Dependencies

The Conservation Survey Generator requires the Java Runtime Environment (https://www.oracle.com/technetwork/java/javase/downloads/index.html), curl (https://curl.haxx.se/), and SAXON XSLT Processor (http://saxon.sourceforge.net/) be installed on the Windows machine and accessible from the command line. Follow the installation instructions at the above links. Be sure to set the JAVA_HOME environment variable to the installed version of JRE.

To test installation of these application from a terminal window, confirm that the curl and Saxon applications' help lists can be retrieved:

	curl --help
	java -jar C:\saxon\saxon9he.jar

*NOTE: This application was written with saxon9he.jar as the active version of Saxon. If your Windows machine has a different version, the two Saxon commands in SingleSurvey.cmd and AllSurveys.cmd need to be modified to reflect the version of Saxon installed on your machine.*

## Installation

The Conservation Survey Generator has been designed to run on a Windows machine from C:\conservation-survey-generator.

From the terminal:

	cd C:\
	git clone https://github.com/IMAmuseum/conservation-survey-generator.git .\conservation-survey-generator

## Settings

The Conservation Survey Generator requires a setting file, settings.cmd, in the main application directory. This file is called while running the application to set the Piction username and password for retrieving data and image assets. This file should contain:

	set username=[USERNAME]
	set password=[PASSWORD]

