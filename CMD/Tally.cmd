@ECHO ON

REM change directory to C:\conservation-survey-generator
cd C:\conservation-survey-generator

REM delete all existing files in HTML and XML folders
del HTML\* /Q
del XML\* /Q

REM set Piction username and password as variables
call settings.cmd

REM cURL GET call to Piction API for session verification, output as XML\SURL.xml
curl --insecure https://digitalmedia.imamuseum.org/r/st//piction_login/USERNAME/%username%/PASSWORD/%password% -o "XML\SURL.xml"

REM call saxon to run XSLT\SURLtransform.xsl on XML\SURL.xml to update PictionCall.cmd
java -jar C:\saxon\saxon9he.jar -s:XML\SURL.xml -xsl:XSLT\SurveyGenerator_SURLtransformAll.xsl -o:CMD\PictionCall.cmd

REM run PictionCall.cmd to set %PictionCall% variable
call CMD\PictionCall.cmd

REM cURL GET call to Piction API to retrieve AccNo survey data, output as XML\CON_Surveys_All.xml
curl --insecure %PictionCall% -o "XML\CON_Surveys_All.xml"

REM call saxon to run XSLT\SurveyGenerator_Tally_GenerateTXT.xsl on XML\CON_Surveys_All.xml to output as HTML\CON_Surveys_Tally.txt
java -jar C:\saxon\saxon9he.jar -s:XML\CON_Surveys_All.xml -xsl:XSLT\SurveyGenerator_Tally_GenerateTXT.xsl -o:HTML\CON_Surveys_Tally.txt

REM open CON_Surveys_Tally.txt
start C:\conservation-survey-generator\HTML\CON_Surveys_Tally.txt