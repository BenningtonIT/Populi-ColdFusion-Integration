<html>
<head>
    <title>Get Terms</title>
</head>
<body>
<h1>Web Service Get Terms</h1>

<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="getAcademicTerms">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
</cfhttp>

<cfoutput>
<cfset tempvar = cfhttp.filecontent>
<cfdump var="#tempvar#">
</cfoutput>

</body>
</html>