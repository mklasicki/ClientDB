<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="pl">

<head>
    <meta charset="UTF-8">
    <title>Strona główna.</title>
    <meta name="Twoja strona" content="zZarządzaj ogłoszeniami">
    <meta name="keywords" content="strona, www, ćwiczenia" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,700&display=swap" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/fontello.css" />" rel="stylesheet">

</head>
<body>
    <div id="container">
        <div id="menu">
            <ol>
                <li><a href="/main">Wyloguj się</a></li>
                <li><a href="/showFormForAddUser">Edytuj Profil</a></li>
                <li><a href="/addProduct">Dodaj nowy</a></li>
                <li><input type="text" placeholder=" Szukaj przedmiotu"></li>
                <li><button id="search-button" type="submit" name="name">Szukaj</button></li>
            </ol>
        </div>
        <div id="content">
         <h5>Twoje Ogłoszenia</h5>
            <h3 id="category-header">Kategorie przedmiotów</h3>
                <ol>
                    <li><i class="icon-laptop"></i> Elektronika</li>
                    <li><i class="icon-home"></i> Nieruchomości</li>
                    <li><i class="icon-cab"></i> Motoryzacja</li>
                    <li><i class="icon-award"></i> Sport</li>
                    <li><i class="icon-leaf"></i> Dom i Ogród</li>
                </ol>
            <div id="content-list">
                <h3 id="content-list-header">Ostatnio dodane ogłoszenia</h3>
                    <c:forEach var="temp" items="${products}">
                        <div class="product-tile">
                            <div id="photo-tile"><img class="product-photo" src= "${temp.image}"></div>
                            <div id="name-tile">${temp.productName}</div>
                            <div id="description-tile">${temp.productDescription}</div>
                            <div id="price-tile">${temp.productPrice}</div>
                        </div>
                    </c:forEach>
            </div>
        </div>
</body>

</html>