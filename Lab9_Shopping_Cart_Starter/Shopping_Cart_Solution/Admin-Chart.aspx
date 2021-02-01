<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Admin-Chart.aspx.cs" Inherits="Admin_Chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center-align">
        <asp:Chart ID="Chart1" runat="server" Height="536px" Width="1329px" DataSourceID="SqlDataSource1">
            <Titles>
                <asp:Title Text="Total Sales">
                </asp:Title>
            </Titles>

            <Series>
                <asp:Series Name="Series1" XValueMember="Title" YValueMembers="quantity"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SunnyCS %>" SelectCommand="SELECT * FROM [ALL_Products]"></asp:SqlDataSource>
    </div>
</asp:Content>