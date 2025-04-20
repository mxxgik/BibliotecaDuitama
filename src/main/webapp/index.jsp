
<jsp:include page="shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<style>
  .carousel-item {
    transition: transform 1s ease-in-out;
  }
</style>

<body>
  <div id="mainCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="6000" data-bs-pause="false">
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
</body>



<a class="btn" href="books/listBooks.jsp">Libros</a>
<a class="btn" href="books/addBook.jsp">Agregar Libro</a>
<a class="btn" href="loans/listLoans.jsp">Prestamos</a>
<a class="btn" href="loans/addLoan.jsp">Agregar Prestamo</a>

<jsp:include page="shared/footer.jsp" />


