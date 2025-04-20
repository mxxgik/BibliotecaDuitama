<%-- here youll find the form with the required fields to start a new loan --%>

<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<head>
    <style>
        body {
            background-color: #404048;
            color: #e0e0e0;
            font-family: 'Segoe UI', sans-serif;
            padding: 2rem;
        } 
    </style>
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="../index.jsp" class="nav-link active" aria-current="page">Inicio</a></li>
        <li class="nav-item"><a href="../books/listBooks.jsp" class="nav-link">Libros</a></li>
        <li class="nav-item"><a href="../loans/listLoans.jsp" class="nav-link">Prestamos</a></li>
      </ul>
    </header>
</head>

<body>
     
</body>



<jsp:include page="../shared/footer.jsp" />