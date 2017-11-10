<%-- 
    Document   : prueba
    Created on : 6/05/2017, 11:12:37 PM
    Author     : Mao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
    <HEAD>
        <TITLE>Using Buttons</TITLE>
    </HEAD>
 
    <BODY>
        <H1>Using Buttons</H1>
        <FORM NAME="form1" ACTION="prueba.jsp" METHOD="POST">
            <INPUT TYPE="HIDDEN" NAME="buttonName">
            <INPUT TYPE="BUTTON" VALUE="Mauro" ONCLICK="button1()">
            <INPUT TYPE="BUTTON" VALUE="Perro 2" ONCLICK="button2()">
            <INPUT TYPE="BUTTON" VALUE="Jajaja 3" ONCLICK="button3()">
        </FORM>

        <H1>Determining Which Button Was Clicked</H1>
        You clicked 
        <%= request.getParameter("buttonName") %>
        
        <SCRIPT LANGUAGE="JavaScript">
            <!--
               function button1()
               {
                   document.form1
                   document.form1.buttonName.value = "button 1"
                   form1.submit()
               }    
               function button2()
               {
                   document.form1.buttonName.value = "button 2"
                   form1.submit()
               }    
               function button3()
               {
                   document.form1.buttonName.value = "button 3"
                   form1.submit()
               }    
            // --> 
        </SCRIPT>
    </BODY>
</HTML>
