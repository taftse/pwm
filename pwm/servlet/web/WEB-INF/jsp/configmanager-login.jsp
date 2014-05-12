<%@ page import="password.pwm.i18n.LocaleHelper" %>
<%--
  ~ Password Management Servlets (PWM)
  ~ http://code.google.com/p/pwm/
  ~
  ~ Copyright (c) 2006-2009 Novell, Inc.
  ~ Copyright (c) 2009-2014 The PWM Project
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  --%>

<!DOCTYPE html>

<%@ page language="java" session="true" isThreadSafe="true"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="pwm" prefix="pwm" %>
<%
    String pageTitle = LocaleHelper.getLocalizedMessage("Title_ConfigManager", ContextManager.getPwmApplication(request).getConfig(),
            password.pwm.i18n.Config.class);
%>
<html dir="<pwm:LocaleOrientation/>">
<%@ include file="fragment/header.jsp" %>
<body class="nihilo">
<script type="text/javascript" src="<%=request.getContextPath()%><pwm:url url="/public/resources/js/configmanager.js"/>"></script>
<div id="wrapper">
    <jsp:include page="fragment/header-body.jsp">
        <jsp:param name="pwm.PageName" value="<%=pageTitle%>"/>
    </jsp:include>
    <div id="centerbody">
        <%@ include file="/WEB-INF/jsp/fragment/message.jsp" %>
        <form action="<pwm:url url='ConfigManager'/>" method="post" name="configLogin" enctype="application/x-www-form-urlencoded"
              onsubmit="return PWM_MAIN.handleFormSubmit('submitBtn',this)">

            <h1>Configuration Password</h1>
            <br class="clear"/>
            <input type="password" class="inputfield" name="password" id="password" autofocus/>
            <div id="buttonbar">
                <input type="submit" class="btn"
                       name="button"
                       value="<pwm:Display key="Button_Login"/>"
                       id="submitBtn"/>
                <button type="button" style="visibility:hidden;" name="button" class="btn" id="button_cancel"
                        onclick="document.location='<%=request.getContextPath()%>';return false">
                    <pwm:Display key="Button_Cancel"/>
                </button>
                <input type="hidden" id="pwmFormID" name="pwmFormID" value="<pwm:FormID/>" autofocus="autofocus"/>
            </div>
        </form>
    </div>
    <div class="push"></div>
</div>
<script type="text/javascript">
    PWM_GLOBAL['startupFunctions'].push(function(){
        PWM_MAIN.getObject('password').focus();
        ShowHidePasswordHandler.initAllForms();
    });
</script>
<% request.setAttribute(PwmConstants.REQUEST_ATTR_SHOW_LOCALE,"false"); %>
<%@ include file="fragment/footer.jsp" %>
</body>
</html>