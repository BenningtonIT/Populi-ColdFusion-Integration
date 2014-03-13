<html>
<head>
    <title>requestBackup</title>
</head>
<body>
<h1>Web Service requestBackup</h1>

<!--- <cfhttp url="https://bennington.populiweb.com/api/index.php" result="result" method="POST" file="Populi.zip" path="e:\CampusDirectory"> --->
<cfhttp url="#populi_url#" result="result" method="POST" file="Populi.zip" path="#bc_path#">
<cfhttpparam type="FORMFIELD" name="task" value="downloadBackup">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
<cfhttpparam type="FORMFIELD" name="backup_id" value="1">
</cfhttp>


<cfoutput>
<!--- <cfset tempvar = cfhttp.filecontent>
<cfdump var="#tempvar#"> --->
<cfdump var="#result#"/> 
</cfoutput>

Downloaded File
</body>
</html>