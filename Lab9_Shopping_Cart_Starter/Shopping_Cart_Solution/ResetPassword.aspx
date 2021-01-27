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
                                    <asp:TextBox ID="newPassword" runat="server" TextMode="Password" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Verify New Password"></asp:Label>
                                    <asp:TextBox ID="verifyNewPassword" runat="server" TextMode="Password"></asp:TextBox>
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
