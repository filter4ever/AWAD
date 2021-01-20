<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCart2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css" />
        </head>
        <body>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 table-responsive-sm">
                        <asp:GridView ID="gvCart" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="EL_ID" DataSourceID="SqlDataSource1" OnRowDeleting="gvCart_RowDelete" CssClass="table table-hover" ShowFooter="true" ShowHeaderWhenEmpty="true">
                            <Columns>                    
                                <asp:TemplateField HeaderText="Product" ItemStyle-CssClass="col-lg-6">
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <asp:Image class="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                                                </div>
                                                <div class="col-lg-8 my-auto">
                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("EL_Title") %>' Font-Bold="True" CssClass="align-content-lg-center" Font-Size="Large" ClientIDMode="Inherit"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Quantity" ItemStyle-CssClass="col-lg-2">
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <asp:TextBox ID="lblQuantity" runat="server" Text='<%# Bind("Quantity")%>' Width="30px"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="lblQuantity" ValidationExpression="\d+" ErrorMessage="Invalid Quantity"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-CssClass="col-lg-2" DataFormatString="${0:#,0}" >
                                    <ItemStyle CssClass="col-lg-2"></ItemStyle>
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Total Price" ItemStyle-CssClass="col-lg-2">
                                    <ItemTemplate>
                                        $<asp:Label ID="lblTotalPrice" runat="server" 
                                            Text='<%# (Convert.ToInt32(Eval("Quantity").ToString()) * (Convert.ToDouble(Eval("Price").ToString()))).ToString("n") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowDeleteButton="True" ItemStyle-CssClass="col-lg-2" />
                            </Columns>
                            <EmptyDataTemplate>
                                No Items in Cart
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SunnyCS %>" SelectCommand="SELECT [EL_Title], [Price], [Quantity], [Id], [EL_ID], [img] FROM [EL_Cart]"></asp:SqlDataSource>

                    </div>

                    <div class="col-lg-4 d-flex justify-content-end">
                        <div class="card text-white bg-dark col-lg-8" style="max-height: 30rem;">
                            <div class="card-body">
                                <h5 class="card-title">Order Summary</h5>
                                <div class="row">
                                    <p class="card-text">Shpping Costs of $2 will be added.</p>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <p class="card-text">Order Subtotal</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="card-text">
                                            <asp:Label ID="lblSubtotal" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <p class="card-text">Shipping</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="card-text">
                                            <asp:Label ID="lblShipping" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-lg-6">
                                        <p class="card-text"><strong>Total</strong></p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="card-text">
                                            <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
    
</asp:Content>

