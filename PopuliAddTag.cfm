<html>
<head>
    <title>Get Terms</title>
</head>
<body>
<h1>Web Service Get Terms</h1>

<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="addTag">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
<cfhttpparam type="FORMFIELD" name="person_id" value="146658">
<cfhttpparam type="FORMFIELD" name="tag" value="Transfer Student">
</cfhttp>

<cfoutput>
<cfset tempvar = cfhttp.filecontent>
<cfdump var="#tempvar#">
</cfoutput>

</body>
</html>