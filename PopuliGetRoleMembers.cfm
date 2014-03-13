<html>
<head>
    <title>Get Terms</title>
</head>
<body>
<h1>Web Service getRoleMembers</h1>

Roles:<br>
<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="getRoles">
<!--- <cfhttpparam type="FORMFIELD" name="task" value="getAvailableRoles"> --->
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
</cfhttp>

<cfoutput>
<cfset populiXMLRoles = cfhttp.filecontent>
<!--- <cfdump var="#populiXML#"> --->
<cfset populiDOCRoles = XmlParse(populiXMLRoles)>
<cfset numRoles = ArrayLen(populiDOCRoles.response.XmlChildren)>
<b>Number of Roles = </b> #numRoles#
<br><br>
<cfloop index="i" from = "1" to = #numRoles#>
	#populiDOCRoles.response.role[i].id.XmlText#
	#populiDOCRoles.response.role[i].name.XmlText#
	<br><br>
</cfloop>
</cfoutput>
--------------------------------------- <br><br>

<cfhttp url="#populi_url#" method="POST">
<cfhttpparam type="FORMFIELD" name="task" value="getRoleMembers">
<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
<cfhttpparam type="FORMFIELD" name="roleName" value="STUDENT">
<!--- <cfhttpparam type="FORMFIELD" name="roleName" value="Everyone"> --->
<!--- <cfhttpparam type="FORMFIELD" name="status" value="ALL"> --->
<cfhttpparam type="FORMFIELD" name="status" value="ACTIVE"> 
</cfhttp>

<cfoutput>
<cfset populiXML = cfhttp.filecontent>
<!--- <cfdump var="#populiXML#"> --->
<cfset populiDOC = XmlParse(populiXML)>
<!--- Extract number of results --->
<cfset umResults=#populiDOC.response.XmlAttributes.num_results#>
 
<cfset numPeople = ArrayLen(populiDOC.response.XmlChildren)>
<b>Number of People = </b> #numPeople#
<br><br>

<cfloop index="i" from = "1" to = #numPeople#>
    #populiDOC.response.person[i].personID.XmlText#
	#populiDOC.response.person[i].first.XmlText#
	#populiDOC.response.person[i].last.XmlText#
	#populiDOC.response.person[i].inactive.XmlText#
	<br><br>
	Detail Info: <br>
	<cfhttp url="#populi_url#" method="POST">
	<cfhttpparam type="FORMFIELD" name="task" value="getPerson">
	<cfhttpparam type="FORMFIELD" name="access_key" value="#populi_access_key#">
	<cfhttpparam type="FORMFIELD" name="person_id" value="#populiDOC.response.person[i].personID.XmlText#">
	</cfhttp>
	
	<cfset populiXMLSub = cfhttp.filecontent>
	<!--- <cfdump var="#populiXMLSub#"> --->
	<cfset populiDOCSub = XmlParse(populiXMLSub)>
	#populiDOCSub.response.first.XmlText#
	#populiDOCSub.response.last.XmlText#
	#populiDOCSub.response.middle_name.XmlText#
	#populiDOCSub.response.preferred_name.XmlText#
	#populiDOCSub.response.prefix.XmlText#
	#populiDOCSub.response.suffix.XmlText#
	#populiDOCSub.response.gender.XmlText#
	#populiDOCSub.response.birth_date.XmlText#
	<br><br><br><br>
	
</cfloop>

</cfoutput>

</body>
</html>