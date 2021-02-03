<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-BestSeller.aspx.cs" Inherits="BestSeller" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Best Sellers</title>
        <link rel="stylesheet" type="text/css" href="assets/css/BestSeller.css" />
    </head>
    <body>
        <br />
        <div class="pagetitle">The Best Sellers</div>
        <br />

            <div class="containertitle">
                <span>THRILLER</span>
                <asp:Button 
                    ID="btnAddItem"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddThriller_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("EL_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("EL_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("EL_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("EL_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="bookauthor" ID="lblStudio" runat="server" Text='<%#Eval("EL_Studio") %>' Style="color: #48C9B0"></asp:Label>
                            <asp:TextBox ID="txtStudio" Text='<%#Eval("EL_Studio") %>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label ID="lblAnimeId" runat="server" Text='<%# Eval("EL_ID") %>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdateThriller" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDeleteThriller"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
            <div class="containertitle">
                <span>ACTION</span>
                <asp:Button 
                    ID="Button1"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddAction_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("EL_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("EL_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("EL_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("EL_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="bookauthor" ID="lblStudio" runat="server" Text='<%#Eval("EL_Studio") %>' Style="color: #48C9B0"></asp:Label>
                            <asp:TextBox ID="txtStudio" Text='<%#Eval("EL_Studio") %>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label ID="lblAnimeId" runat="server" Text='<%# Eval("EL_ID") %>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdateAction" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDeleteAction"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
            <div class="containertitle">
                <span>COMEDY</span>
                <asp:Button 
                    ID="Button2"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddComedy_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("EL_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("EL_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("EL_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("EL_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="bookauthor" ID="lblStudio" runat="server" Text='<%#Eval("EL_Studio") %>' Style="color: #48C9B0"></asp:Label>
                            <asp:TextBox ID="txtStudio" Text='<%#Eval("EL_Studio") %>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label ID="lblAnimeId" runat="server" Text='<%# Eval("EL_ID") %>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdateComedy" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDeleteComedy"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
            <div class="containertitle">
                <span>ROMANCE</span>
                <asp:Button 
                    ID="Button3"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddRomance_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("EL_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("EL_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("EL_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("EL_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="bookauthor" ID="lblStudio" runat="server" Text='<%#Eval("EL_Studio") %>' Style="color: #48C9B0"></asp:Label>
                            <asp:TextBox ID="txtStudio" Text='<%#Eval("EL_Studio") %>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label ID="lblAnimeId" runat="server" Text='<%# Eval("EL_ID") %>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdateRomance" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDeleteRomance"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        
            <div class="containertitle">
                <span>ROMANCE</span>
                <asp:Button 
                    ID="Button4"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddHorror_Click" />
            </div>
            <div class="bookshelf">
                <asp:Repeater ID="Repeater5" runat="server">
                    <ItemTemplate>
                        <div style="width: 146px;">
                            <asp:ImageButton ID="imgBooks" CssClass="bookimage" ImageUrl='<%#Eval("EL_Image") %>' runat="server" />
                            <asp:TextBox ID="txtImage" Text='<%#Eval("EL_Image")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="booktitle" ID="lblTitle" runat="server" Text='<%#Eval("EL_Title")%>'></asp:Label>
                            <asp:TextBox ID="txtTitle" Text='<%#Eval("EL_Title")%>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label CssClass="bookauthor" ID="lblStudio" runat="server" Text='<%#Eval("EL_Studio") %>' Style="color: #48C9B0"></asp:Label>
                            <asp:TextBox ID="txtStudio" Text='<%#Eval("EL_Studio") %>' runat="server" Visible="False"></asp:TextBox>
                            <br />

                            <asp:Label ID="lblAnimeId" runat="server" Text='<%# Eval("EL_ID") %>' Visible="False"></asp:Label>
                            <br />

                            <asp:LinkButton ID="lnkEdit" Text="Edit |" runat="server" OnClick="OnEdit" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdateHorror" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDeleteHorror"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>


    </body>
    </html>
</asp:Content>
