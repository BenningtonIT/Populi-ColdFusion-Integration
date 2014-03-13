<html>
<head>
    <title>Get Terms</title>
</head>
<body>
<h1>Web Service getTermStudents Parse</h1>

<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="getTermStudents">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
</cfhttp>

<cfoutput>
<cfset populiXML = cfhttp.filecontent>
<!--- <cfdump var="#populiXML#"> --->
<cfset populiDOC = XmlParse(populiXML)>
<!--- Extract number of results --->
<cfset umResults=#populiDOC.response.XmlAttributes.num_results#>
 
<cfset numStudents = ArrayLen(populiDOC.response.XmlChildren)>
<b>Number of Students=</b> #numStudents#
<br><br>

<cfloop index="i" from = "1" to = #numStudents#>
    #populiDOC.response.student[i].person_id.XmlText#
	#populiDOC.response.student[i].student_id.XmlText#
	#populiDOC.response.student[i].first.XmlText#
	#populiDOC.response.student[i].last.XmlText#
	#populiDOC.response.student[i].middle_name.XmlText#
	#populiDOC.response.student[i].preferred_name.XmlText#
	#populiDOC.response.student[i].prefix.XmlText#
	#populiDOC.response.student[i].suffix.XmlText#
	#populiDOC.response.student[i].gender.XmlText#
	<br>
</cfloop>

</cfoutput>

</body>
</html>