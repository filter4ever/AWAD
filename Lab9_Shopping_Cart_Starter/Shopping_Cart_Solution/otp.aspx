<%@ Page Language="C#" AutoEventWireup="true" CodeFile="otp.aspx.cs" Inherits="otp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OTP</title>
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
                            <h3 class="mb-0">OTP</h3>
                        </div>
                        <div class="card-body">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Enter OTP"></asp:Label>
                                    <asp:TextBox ID="otpV" runat="server" TextMode="Number" ></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="submit" runat="server" Text="Verify" CssClass="btn btn-success btn-lg" OnClick="otpValidate" />
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
