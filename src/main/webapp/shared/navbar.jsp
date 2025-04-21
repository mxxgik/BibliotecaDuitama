<%
    String currentPage = request.getRequestURI();
%>

<header class="bg-dark-custom py-3">
  <div class="container d-flex justify-content-center align-items-center">
    <nav class="d-flex gap-4">
      <a class="btn btn-link" href="../index.jsp"> <i class="fa-solid fa-house"></i> Inicio </a>
      <a class="btn btn-link <%= currentPage.contains("listBooks.jsp") ? "active" : ""%>" href="../books/listBooks.jsp"> <i class="fa-solid fa-list"></i> Libros</a>
      <a class="btn btn-link <%= currentPage.contains("addBook.jsp") ? "active" : ""%>" href="../books/addBook.jsp"> <i class="fa-solid fa-plus"></i> Agregar Libro</a>
      <a class="btn btn-link <%= currentPage.contains("listLoans.jsp") ? "active" : ""%>" href="../loans/listLoans.jsp"> <i class="fa-solid fa-list"></i> Prestamos</a>
      <a class="btn btn-link <%= currentPage.contains("addLoan.jsp") ? "active" : ""%>" href="../loans/addLoan.jsp"> <i class="fa-solid fa-plus"></i> Agregar Prestamo</a>
    </nav>
  </div>
</header>
<br>
<br>