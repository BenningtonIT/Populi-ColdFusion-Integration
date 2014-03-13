<html>
<head>
    <title>requestBackupAutomated</title>
</head>
<body>
<h1>Web Service requestBackup Automated</h1>


<cfset the_backup_id = FORM.backup_id >
<CFOUTPUT>Form Value: #the_backup_id#</CFOUTPUT>

<!---
<cffile action = "write" 
    file = "#bc_path#\BackupRequested_#the_backup_id#.txt" 
    output = "Backup ID: #the_backup_id#">
--->	

<!--- <cfhttp url="https://bennington.populiweb.com/api/index.php" result="result" method="POST" file="Populi.zip" path="e:\CampusDirectory"> --->
<cfhttp url="#populi_url#" result="result" method="POST" file="Populi_#the_backup_id#.zip" path="#bc_path#">
<cfhttpparam type="FORMFIELD" name="task" value="downloadBackup">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
<cfhttpparam type="FORMFIELD" name="backup_id" value="#the_backup_id#">
</cfhttp>	

<cfquery name=AddLogEntry datasource="#Variables.StudentWebdbDSN#">
	INSERT INTO PopuliLog
		(
			AppTransaction,
			AppInfoError
		)
	Values
		(
			'Call downloadBackup API',
			'Downloaded backup file: Populi_#the_backup_id#.zip'
		)
</cfquery>


</body>
</html>