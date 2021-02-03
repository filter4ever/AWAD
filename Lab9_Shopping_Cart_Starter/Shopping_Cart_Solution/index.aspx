<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html>
    <html>
    <head>
        <title>Element</title>
        <link rel="stylesheet" type="text/css" href="assets/css/index.css" />
    </head>
    <body>
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 3</div>
                <img src="images/aotbanner.jpg" style="width: 100%">
            </div>

            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <img src="images/saobanner.png" style="width: 100%">
            </div>

            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <img src="images/fmabanner.png" style="width: 100%">
            </div>
            <%-- Add the prev and next buttons for the user to click -- %>
             <%-- when clicked it calls on plusSlides()--%>
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>

        <div class="collage">
            <div class="zone1"></div>
            <div class="zone2"></div>
            <div class="zone3"></div>
        </div>
        <br />
        <br />
        <div class="bookcontainer">
            <div class="zoneA">
                POPULAR ANIME<br />
                <asp:Button ID="btnIndexBS" runat="server" Text="VIEW NOW" CssClass="bcbtn" />
            </div>
            <div class="zoneB"></div>
            <div class="zoneC"></div>
            <div class="zoneD"></div>
            <div class="zoneE"></div>
        </div>
        <br />
        <br />
        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) { slideIndex = 1 }
                if (n < 1) { slideIndex = slides.length }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>
    </body>
    </html>
</asp:Content>