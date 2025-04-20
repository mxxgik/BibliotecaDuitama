
<jsp:include page="shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>


<body>
  <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://images.unsplash.com/photo-1417325384643-aac51acc9e5d" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://image.unsplash.com/example" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://image.unsplash.com/example" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
</body>



<a class="btn" href="books/listBooks.jsp">Libros</a>
<a class="btn" href="books/addBook.jsp">Agregar Libro</a>
<a class="btn" href="loans/listLoans.jsp">Prestamos</a>
<a class="btn" href="loans/addLoan.jsp">Agregar Prestamo</a>

<jsp:include page="shared/footer.jsp" />


