<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" %>

<html>
<head>
    <title>BIS Login</title>
    <style>
        body {
            background-color: #BBBBBB;
        }

        #dashboardlink {
            color: Blue;
            font-size: large;
        }

        #trbgred {
            color: white;
            background-color: red;
        }

        #bigwhtxt {
            color: White;
            font-size: x-large;
        }

        #regfont {
            color: white;
        }

        #headingfont {
            color: Red;
            font-size: xx-large;
            font-style: normal;
        }

        #headingtxt {
            color: Red;
            font-size: large;
        }

        #redFontWhiteBg {
            color: red;
            background-color: White;
        }

        #whiteBg {
            background-color: White;
            font-size: large;
        }

        #submitButton {
            color: red;
            background-color: White;
            font-size: large;
        }

        #clred {
            color: red;
        }
    </style>
</head>
<body bgcolor=”#BBBBBB”>
<form id=“frmBisLogin” method=“POST” action=“j_security_check”>
    <table border=“1” cellpadding=“0” cellspacing=“0” width=“100%”>
        <tr bgcolor=“White”>
            <td>
                <table border=“0” cellpadding=“0” cellspacing=“0” width=“100%” bgcolor=“White”>
                    <tr height=“70”>
                        <td rowspan=“3” align=“center”>
                            <font id=“headingfont” size=“7”>
                                Baig International School
                            </font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border=“0” cellpadding=“1” cellspacing=“1” width=“100%”>
                    <tr height=“60”>
                        <td colspan=“3”>&nbsp;</td>
                    </tr>
                    <tr>
                        <td width=“25%”>
                            &nbsp;
                        </td>
                        <td widht=”*”>
                            <table border=“0” cellpadding=“5” cellspacing=“5” width=“100%” bgcolor=“White”>
                                <tr>
                                    <td colspan=“2” id="trbgred" align=“left”>
                                        &nbsp;&nbsp;
                                        Sign in
                                    </td>
                                <tr>
                                    <td colspan=“2” align=“left”>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align=“right” width=“50%”>
                                        User Id
                                    </td>
                                    <td width=”*”>
                                        <input type=“text” name=“j_username” size=“20”>
                                    </td>
                                </tr>
                                <tr>
                                    <td align=“right”>
                                        Password
                                    </td>
                                    <td>
                                        <input type=“password” name=“j_password” size=“20”></td>
                                </tr>
                                <tr>
                                    <td align=“center” colspan=“2” height=“50”>
                                        <input type=“submit” value=” Login ” id=“sbmt”></td>
                                </tr>
                                <tr>
                                    <td colspan=“2” align=“right”>
                                        <a href=””>
                                            Forgot password
                                        </a>
                                        &nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align=“right” colspan=“2” id="trbgred">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td width=“25%”>
                            &nbsp;
                        </td>
                    </tr>
                    <tr height=“30”>
                        <td colspan=“3”>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id=“trbgred”>
            <td rowspan=“3” align=“center”>
                <font id=“regfont”>
                    ©copyright: 2015, Mirza Yousuf Ahmed Baig, Build Web Applications with Java </font>
            </td>
        </tr>
    </table>
</form>
</body>
</html>