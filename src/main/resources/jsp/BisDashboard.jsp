<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" %>
<%@ page import="com.bis.beans.StudentDetailsBean" %>
<%@ page import="java.util.Hashtable, java.util.Enumeration" %>
<%
    StudentDetailsBean studentDetailsBean = null;
    if (session != null) {
        studentDetailsBean = (StudentDetailsBean) session.getAttribute("studentDetailsBean");
    }

%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Baig International School - Dashboard</title>
    <link rel="stylesheet" type="text/css" href="resources/css/BISStyle.css"></link>
    <script src="resources/js/BISScript.js"></script>
</head>
<body>
<form id="frmDashboard" name="frmDashboard" action="BisControllerServlet" method="POST">
    <input type="hidden" name="ParameterActionCommand" value="BisDashboard">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="33%" align="center" valign="middle">
                            <table border="0" cellpadding="5" cellspacing="0" width="90%" bgcolor="White">
                                <tr>
                                    <td align="center" id="trbgred">Find Student</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Student ID
                                        &nbsp;&nbsp;
                                        <input type="text" name="txtStdId" id="txtStdId" size="20"></input>
                                        &nbsp;&nbsp;
                                        <input type="button" value="Load Student" id="btnStdDtls"
                                               onclick="getStudentAJAX()"></input></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td id="trbgred" align="center">Student in Context</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" id="headingtxt">
                                        <div id="dvStdSmry">
                                            <%
                                                if (studentDetailsBean != null) {
                                                    out.print(studentDetailsBean.getFullName());
                                                    out.print("&nbsp;&nbsp;|");
                                                }
                                            %>
                                            &nbsp;&nbsp;
                                            <%
                                                if
                                                (studentDetailsBean != null) {
                                                    out.print(studentDetailsBean.getGrade());
                                                    out.print(" - ");
                                                    out.print(studentDetailsBean.getSection());
                                                    out.print("&nbsp;&nbsp;|");
                                                }
                                            %>
                                            &nbsp;&nbsp;
                                            <%
                                                if (studentDetailsBean != null) {
                                                    out.print(studentDetailsBean.getStudentId());
                                                }
                                            %>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td widht="*" align="center" valign="middle">
                            <table border="0" cellpadding="7" cellspacing="7" width="95%">
                                <tr valign="top">
                                    <td align="left" width="50%">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="White">
                                            <tr>
                                                <td align="center" id="trbgred">Student Information</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink">Student details</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <%
                                                        if(request.isUserInRole("BisTeacher")||request.isUserInRole("BisAdmin")) {
                                                    %>
                                                    <a href="BisControllerServlet?ParameterActionCommand=GetStudentAcademics&sem=1" id="dashboardlink"> Semester - I results</a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a id="dashboardlink"> Semester - I results </a>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <%
                                                        if(request.isUserInRole("BisTeacher")||request.isUserInRole("BisAdmin")) {
                                                    %>
                                                    <a href="BisControllerServlet?ParameterActionCommand=GetStudentAcademics&sem=2" id="dashboardlink"> Semester - II results </a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a id="dashboardlink"> Semester - II results </a>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id = "dashboardlink" > Semester-I Attendance
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align = "left">
                                                    <a href=â€#â€ id = "dashboardlink"> Semester-II Attendance </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <%
                                                        if(request.isUserInRole("BisClerk")||request.isUserInRole("BisAdmin")) {
                                                    %>
                                                    <a href="BisControllerServlet?ParameterActionCommand=GetStudentFees" id="dashboardlink"> Fees </a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a id="dashboardlink">Fees</a>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="left" width="*" colspan="2">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="White">
                                            <tr>
                                                <td align="center" id="trbgred">Administration</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Add Student </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink">Edit Student</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink">Manage Result</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Manage Attendance </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Manage Fees </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td align="left" width="50%">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="White">
                                            <tr>
                                                <td align="center" id="trbgred">Reports</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="BisControllerServlet?ParameterActionCommand=GetReportByClass" id="dashboardlink"> Class </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Bus </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Fees </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" height="27px">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="*" valign="top">
                                        <table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="White">
                                            <tr>
                                                <td align="center" id="trbgred">Help</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Academics Legend </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> FAQs </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Holiday Calender </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Escalation Matrix </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Fee Structure </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <a href="#" id="dashboardlink"> Events </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <table border="0" cellpadding="5" cellspacing="0" width="100%" bgcolor="White">
                                <tr>
                                    <td align="center" id="trbgred">Announcement</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        The annual day event is scheduled for Jan 26, 2015.
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>
</body>
</html>