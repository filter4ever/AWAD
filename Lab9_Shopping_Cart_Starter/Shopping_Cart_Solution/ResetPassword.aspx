<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link rel="stylesheet" href="assets/css/Bootstrap.css" />
    <link rel="stylesheet" href="assets/css/StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 justify-content-center">
                    <div class="col-md-6 offset-md-3">
                        <span class="anchor" id="formChangePassword"></span>
                        <hr class="mb-5">

                        <!-- form card change password -->
                        <div class="card card-outline-secondary">
                            <div class="card-header">
                                <h3 class="mb-0">Change Password</h3>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="New Password"></asp:Label>
                                    <asp:TextBox ID="newPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Minimum eight characters, at least one uppercase letter, one lowercase letter and one number"
                                        ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
                                        ControlToValidate="newPassword" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                    <%--At least one upper case English letter, (?=.*?[A-Z])
                                        At least one lower case English letter, (?=.*?[a-z])
                                        At least one digit, (?=.*?[0-9])
                                        At least one special character, (?=.*?[#?!@$%^&*-])
                                        Minimum eight in length .{8,} (with the anchors)--%>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Verify New Password"></asp:Label>
                                    <asp:TextBox ID="verifyNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:CompareValidator
                                        ID="CompareValidatorPW"
                                        runat="server"
                                        ErrorMessage="Passwords do not match."
                                        ControlToValidate="verifyNewPassword"
                                        ControlToCompare="newPassword"
                                        Operator="Equal" Type="String"
                                        ForeColor="Red" 
                                        Font-Size="X-Small">
                                    </asp:CompareValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="submit" runat="server" Text="Reset Password" CssClass="btn btn-success btn-lg" OnClick="resetPwClick" />
                                </div>
                            </div>
                        </div>
                        <!-- /form card change password -->
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>