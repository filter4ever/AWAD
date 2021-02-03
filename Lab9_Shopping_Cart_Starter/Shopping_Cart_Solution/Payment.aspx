<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Payment</title>
        <style>
            .paymentcontainer {
                height: auto;
                width: 60%;
                float: left;
                margin-top: 43px;
                margin-bottom: 43px;
            }

            .topbanner {
                height: 60px;
                width: 100%;
                background-color: #F6DDCC;
                text-align: center;
                font-family: 'Poppins', sans-serif;
                font-size: 15px;
                color: black;
                padding: 5px;
                margin-bottom: 20px;
            }

            .shipping {
                height: 450px;
                width: 100%;
                border: 0.5px solid gray;
                padding: 20px;
            }

            .billing {
                height: 300px;
                width: 100%;
                border: 0.5px solid gray;
                padding: 20px;
            }

            .shippingtxt {
                width: 100%;
                height: 20px;
                border: 0.5px solid !important;
            }

            .rightcontainer {
                height: auto;
                width: 35%;
                float: right;
            }

            .ordersummary {
                width: 100%;
                height: 320px;
                float: right;
                border: 0.7px solid gray;
                margin-top: 43px;
                padding: 20px;
            }

            .checkoutbtn {
                width: 100%;
                height: 55px;
                border: none;
                background-color: #138D75;
                font-family: 'Poppins', sans-serif;
                font-size: 22px;
                text-align: center;
                color: white;
            }

                .checkoutbtn:hover {
                    background-color: #48C9B0;
                }

            .radiobuttonbox {
                width: 100%;
                height: 150px;
                float: right;
                border: 0.7px solid gray;
                margin-top: 20px;
                margin-bottom: 40px;
                padding: 20px;
            }

            @media only screen and (max-width: 600px) {
                .topbanner {
                    font-size: small;
                    padding: 8px;
                }

                .shippingtxt {
                    width: 100% !important;
                }

                .paymentcontainer {
                    width: 100%;
                    margin: 0;
                }

                .shipping {
                    width: 100%;
                    height: 500px;
                }

                .billing {
                    width: 100%;
                    height: 370px;
                }

                .ordersummary {
                    width: 100%;
                    height: auto;
                    float: left;
                }

                .rightcontainer {
                    width: auto;
                    height: auto;
                }
            }
        </style>
    </head>
    <body>
        <div class="paymentcontainer">
            <div class="topbanner">
                <p>You're just one click away from completing the order!</p>
            </div>

            <div class="shipping">
                <div class="title" style="text-align: left; font-family: 'Playfair Display', serif; font-size: 25px;">
                    Shipping Address                                                            
                </div>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="shippingtxt" PlaceHolder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1"
                    runat="server"
                    ErrorMessage="Please enter your first name."
                    ControlToValidate="txtFirstName"
                    Font-Size="X-Small"
                    ForeColor="Red" 
                    Display="Dynamic"
                    CssClass="align-top">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator1" 
                    runat="server" 
                    ErrorMessage="Invalid first name" 
                    ControlToValidate="txtFirstName" 
                    Font-Size="X-Small"
                    ValidationExpression="^[a-zA-Z]+$" 
                    ForeColor="Red"
                    Display="Dynamic"
                    CssClass="align-top">
                </asp:RegularExpressionValidator>

                <asp:TextBox ID="txtLastName" runat="server" CssClass="shippingtxt" PlaceHolder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2"
                    runat="server"
                    ErrorMessage="Please enter your last name."
                    ControlToValidate="txtLastName"
                    Font-Size="X-Small"
                    ForeColor="Red"
                    Display="Dynamic"
                    CssClass="align-top">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator2" 
                    runat="server" 
                    ErrorMessage="Invalid last name" 
                    ControlToValidate="txtLastName" 
                    Font-Size="X-Small"
                    ValidationExpression="^[a-zA-Z]+$" 
                    Display="Dynamic"
                    ForeColor="Red"
                    CssClass="align-top">
                </asp:RegularExpressionValidator>

                <asp:TextBox ID="txtAddress" runat="server" CssClass="shippingtxt" PlaceHolder="Street Address"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3"
                    runat="server"
                    ErrorMessage="Please enter your address."
                    ControlToValidate="txtAddress"
                    Font-Size="X-Small"
                    ForeColor="Red"
                    CssClass="align-top">
                </asp:RequiredFieldValidator>

                <asp:TextBox ID="txtSuite" runat="server" CssClass="shippingtxt" PlaceHolder="Apt/Suite [Optional]"></asp:TextBox>

                <asp:TextBox ID="txtZipCode" runat="server" CssClass="shippingtxt"
                    PlaceHolder="Zip Code" Style="width: 49%; float: left; margin-top: 20px" required></asp:TextBox>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="shippingtxt"
                    PlaceHolder="Phone Number" Style="width: 49%; float: right; margin-top: 20px" required></asp:TextBox>
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator3" 
                    runat="server" 
                    ErrorMessage="Invalid ZipCode (6-digits)" 
                    ControlToValidate="txtZipCode"
                    ValidationExpression="^\d{6}$"
                    Width="49%"
                    ForeColor="Red" 
                    Font-Size="X-Small"
                    CssClass="align-top">
                </asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator4" 
                    runat="server" 
                    ErrorMessage="Invalid Phone Number (Must start with 6,8 or 9 and 8-digits)" 
                    ControlToValidate="txtPhoneNumber" 
                    ValidationExpression="^[896]\d{7}$"
                    Width="49%"
                    ForeColor="Red" 
                    Font-Size="X-Small"
                    CssClass="align-top">
                </asp:RegularExpressionValidator>
            </div>
            <br />

            <div class="billing">
                <div class="title" style="text-align: left; font-family: 'Playfair Display', serif; font-size: 25px;">
                    Billing Information                                                       
                </div>
                <asp:TextBox ID="txtCardNo" runat="server" CssClass="shippingtxt" PlaceHolder="Card Number" required></asp:TextBox>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator5" 
                    runat="server" 
                    ErrorMessage="Invalid Credit Card Number (Must be Visa, MasterCard, American Express)" 
                    Display="Dynamic"
                    ControlToValidate="txtCardNo" 
                    Font-Size="X-Small"
                    ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$"
                    ForeColor="Red"
                    CssClass="align-top">
                </asp:RegularExpressionValidator>
                <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="shippingtxt" PlaceHolder="Name on Card" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator4" 
                    runat="server" 
                    ErrorMessage="Please Enter Card Name" 
                    ControlToValidate="txtNameOnCard" 
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator6" 
                    runat="server" 
                    ErrorMessage="Invalid Card Name" 
                    ControlToValidate="txtNameOnCard" 
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top" 
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
                <br />

                <asp:TextBox ID="txtExpMonth" runat="server" CssClass="shippingtxt" PlaceHolder="Month of Expiry" Style="width: 49%; float: left"></asp:TextBox>
                <asp:TextBox ID="txtExpYear" runat="server" CssClass="shippingtxt" PlaceHolder="Year of Expiry" Style="width: 49%; float: right"></asp:TextBox>
                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator5" 
                    runat="server" 
                    ErrorMessage="Please Enter Expiry Month (01-12)" 
                    ControlToValidate="txtExpMonth" 
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top"
                    Width="49%">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator7" 
                    runat="server" 
                    ErrorMessage="Invalid Expiry Year (01-12)" 
                    ControlToValidate="txtExpMonth" 
                    ValidationExpression="0[1-9]|1[0-2]"
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top" 
                    Display="Dynamic" 
                    Width="49%">
                </asp:RegularExpressionValidator>

                <asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator6" 
                    runat="server" 
                    ErrorMessage="Please Enter Expiry Year (If 2021, type '21')" 
                    ControlToValidate="txtExpYear" 
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top"  
                    Width="49%">
                </asp:RequiredFieldValidator>
                <asp:RangeValidator 
                    ID="RangeValidator1" 
                    runat="server" 
                    ErrorMessage="Invalid Expiry Year (If 2021, type '21')"
                    ControlToValidate="txtExpYear" 
                    Type="Integer" 
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top" 
                    Display="Dynamic" 
                    Width="49%" 
                    MinimumValue="21" 
                    MaximumValue="99">
                </asp:RangeValidator>
                <br />
                <asp:TextBox ID="txtSecCode" runat="server" CssClass="shippingtxt" PlaceHolder="Security Code" Style="width: 18%; float: left" ></asp:TextBox>
                <asp:RegularExpressionValidator 
                    ID="RegularExpressionValidator8" 
                    runat="server" 
                    ErrorMessage="Invalid CVV" 
                    ValidationExpression="^([0-9]{3,4})$"
                    Font-Size="X-Small" 
                    ForeColor="Red" 
                    CssClass="align-top" 
                    Display="Dynamic" 
                    Width="49%">
                </asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="rightcontainer">
            <div class="ordersummary">
                <div class="title" style="text-align: center; font-family: 'Playfair Display', serif; font-size: 25px;">
                    Order Summary                                                                
                </div>

                <div class="detailscript" style="font-family: 'Poppins', sans-serif; font-size: 13px; float: left;">
                    <p>Subtotal</p>
                    <p>Estimated Shipping</p>
                    <p>Estimated Tax</p>
                </div>

                <div class="pricescript" style="font-family: 'Poppins', sans-serif; font-size: 13px; float: right;">
                    <p>
                        <asp:Label ID="lbl_TotalPrice" runat="server" Text="$0.00"></asp:Label>
                    </p>

                    <p>
                        <asp:Label ID="lbl_ShippingPrice" runat="server" Text="$0.00"></asp:Label>
                    </p>

                    <p>$0.00</p>
                </div>

                <div class="checkout" style="width: 100%; float: left; border-top: 0.5px solid black; border-bottom: 0.5px solid black;">
                    <div class="ordertotal" style="font-size: 20px; font-weight: bold;">
                        <p style="float: left;">Order Total:</p>
                        <p style="float: right">
                            <asp:Label ID="lbl_TotalPrice2" runat="server" Text="Label"></asp:Label>
                        </p>
                    </div>
                    <asp:Button ID="btnSubmitOrder" runat="server" Text="SUBMIT ORDER" class="checkoutbtn" OnClick="btnSubmitOrder_Click" />
                </div>

            </div>

            <div class="radiobuttonbox">
                <div class="title" style="text-align: center; font-family: 'Playfair Display', serif; font-size: 25px;">
                    Shipping Speed                                                     
                </div>
                <br />
                <div id="rb" style="float: left; font-family: 'Poppins', sans-serif; font-size: 13px; padding: 8px;">
                    <asp:RadioButton ID="rbSS" runat="server" AutoPostBack="True" Checked="True" GroupName="Shipping" OnCheckedChanged="rbSS_CheckedChanged" />
                    <asp:Label ID="Label1" runat="server" Text="Standard Shipping 5-7 Days" Font-Size="X-Small" for="rbSS" ></asp:Label>
                    <br />
                    <asp:RadioButton ID="rbES" runat="server" AutoPostBack="True" GroupName="Shipping" OnCheckedChanged="rbES_CheckedChanged" />
                    <asp:Label ID="Label2" runat="server" Text="Expedited Shipping 2-3 Days" Font-Size="X-Small" for="rbES" ></asp:Label>
                </div>

                <div id="rb2" style="float: right; font-family: 'Poppins', sans-serif; font-size: 13px; padding: 8px;">
                    <asp:Label ID="lblSS" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="lblES" runat="server" Text="$9.99"></asp:Label>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
