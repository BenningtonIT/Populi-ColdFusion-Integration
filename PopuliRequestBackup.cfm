<html>
<head>
    <title>requestBackup</title>
</head>
<body>
<h1>Web Service requestBackup</h1>

<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="requestBackup">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
<!--- <cfhttpparam type="FORMFIELD" name="on_complete_email" value="edingfelder@bennington.edu"> --->
<cfhttpparam type="FORMFIELD" name="on_complete_url" value="https://webinfo.bennington.edu/PopuliBC/PopuliDownloadBackupAutomated.cfm">
</cfhttp>

<cfoutput>
<cfset tempvar = cfhttp.filecontent>
<cfdump var="#tempvar#">
</cfoutput>

<cfquery name=AddLogEntry datasource="#Variables.StudentWebdbDSN#">
	INSERT INTO PopuliLog
		(
			AppTransaction,
			AppInfoError
		)
	Values
		(
			'Call requestBackup API',
			'API Result: #tempvar#'
		)
</cfquery>


</body>
</html>