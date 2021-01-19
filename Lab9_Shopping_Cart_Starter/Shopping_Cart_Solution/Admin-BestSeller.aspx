﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-BestSeller.aspx.cs" Inherits="BestSeller" %>

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

        <div class="sidecontainer">
            <div style="width: auto; height: auto; float: right">
                <a style="font-family: 'Oswald', sans-serif;">CUSTOMER FAVOURITES</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Summer Reading</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Winter's Special</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">SB's Top 100</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">New Releases</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Coming Soon</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Straight Time's Bestsellers</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">SB Podcast</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">SB Top Reviews</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Book Charts</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Teen's Favourite</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">BEST VALUE</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Sci-Fi Week: Buy 2, Get 1 FREE</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Summer Reading Deals</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">SB Classics: $6 Each</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">SB Collectibles Edition</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">New Releases 15% Off</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Thriller Special: Spend $50, Get Extra $10 Off</a>
                <a style="font-family: 'Oswald', sans-serif;"></a>
                <a style="font-family: 'Oswald', sans-serif;">CATEGORIES</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Art, Architecture & Photography</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Bibles & Christianity</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Biography</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Business</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Cookbooks, Food & Wine</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Fiction</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Graphic Novels & Comics</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Diet, Health, Fitness</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">History</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Mystery & Crime</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Religion</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Romance</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Science Fiction & Fantasy</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Self-Help & Relationships</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">Sports</a>
                <a href="#" style="font-family: 'Oswald', sans-serif; color: #48C9B0; font-size: 12.5px">See All Categories</a>
            </div>
        </div>

        <div class="bookcontainer">
            <div class="containertitle">
                <span>HARDCOVER THRILLER - 40% OFF</span>
                <asp:Button 
                    ID="btnAddItem"
                    Style="font-size: 14px; padding: 8px; margin-bottom: 10px; margin-left: 10px; border: 0.5px solid" 
                    runat="server" 
                    Text="INSERT" OnClick="btnAddItem_Click" />
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
                            <asp:LinkButton ID="lnkUpdate" Text="Update |" runat="server" Visible="false" OnClick="OnUpdate" Font-Size="X-Small" />
                            <asp:LinkButton ID="lnkCancel" Text="Cancel |" runat="server" Visible="false" OnClick="OnCancel" Font-Size="X-Small" />
                            <asp:LinkButton
                                ID="lnkDelete"
                                Text="Delete"
                                runat="server"
                                OnClick="OnDelete"
                                OnClientClick="return confirm('Are you sure you want to delete this?');"
                                Font-Size="X-Small" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
