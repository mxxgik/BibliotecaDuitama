
<jsp:include page="shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
    }

    .carousel,
    .carousel-inner,
    .carousel-item,
    .carousel-item img {
      height: 100vh;
      width: 100vw;
      object-fit: cover;
    }

    .carousel-background {
      position: fixed;
      top: 0;
      left: 0;
      z-index: -2;
      width: 100%;
      height: 100%;
    }

    .carousel-item {
      transition: transform 1s ease-in-out;
    }

    .overlay-tint {
      position: fixed;
      top: 0;
      left: 0;
      height: 100vh;
      width: 100vw;
      background-color: #404048;
      opacity: 0.5;
      z-index: -1;
    }

    .content {
      position: relative;
      z-index: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      color: white;
      text-align: center;
      backdrop-filter: blur(4px);
    }

  </style>
</head>

<body>

<%-- Carousel itself --%>
<div id="mainCarousel" class="carousel slide carousel-background" data-bs-ride="carousel" data-bs-interval="6000" data-bs-pause="false">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1663343685764-f31ad04ede39?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3DD" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1515125520141-3e3b67bc0a88?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1681566715515-42b2aa04a0c5?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://images.unsplash.com/photo-1464865885825-be7cd16fad8d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" class="d-block w-100" alt="...">
    </div>
  </div>
</div>

<%-- Div to add a slight blur and tint to the background carousel --%>
<div class="overlay-tint"></div>


<%-- Content Div--%>
<div class="content">
  <div>
    <h1>Biblioteca de Duitama</h1>
  </div>
  <a class="btn" href="books/listBooks.jsp">Libros</a>
  <a class="btn" href="books/addBook.jsp">Agregar Libro</a>
  <a class="btn" href="loans/listLoans.jsp">Prestamos</a>
  <a class="btn" href="loans/addLoan.jsp">Agregar Prestamo</a>
</div>



</body>

<jsp:include page="shared/footer.jsp" />


