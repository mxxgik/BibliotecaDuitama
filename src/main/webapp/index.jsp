
<jsp:include page="shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<style>
  html, body {
    font-family: -apple-system, BlinkMacSystemFont, "SF Pro", "Helvetica Neue", Helvetica, Arial, sans-serif;
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

  .content-inner {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
  }

  .btn {
    color: white;
    text-decoration: none;
    font-size: 1.2rem;
    padding: 0.5rem 1rem;
    transition: all 0.3s ease;
    position: relative;
  }

  .btn:hover {
    text-decoration: underline;
    font-weight: bold;
    color: white;
  }

  h1 {
    font-weight: bold;
    font-size: 60px;
  }

  footer {
    background-color: #181818;
    color: white;
    text-align: center;
    padding: 1rem 0;
    position: relative;
    width: 100%;
    font-size: 20px;
  }

  footer a {
    color: white;
    text-decoration: none;
  }

  footer a:hover {
    text-decoration: underline;
  }

  .footer-img-wrapper {
    max-width: 200px;
    margin: 0 auto;
  }

  .footer-img-wrapper img {
    width: 100%;
    height: auto;
    display: block;
  }

  i{
    margin-right: 6px;
  }

  .btn-link:active,
  .btn-link.active {
    color: #9db4c0 !important;
    background-color: transparent;
    text-decoration: underline;
  }

</style>

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
    <div class = "content-inner">
      <h1>Biblioteca de Duitama</h1>
      <a class="btn btn-link" href="books/listBooks.jsp"> <i class="fa-solid fa-list"></i> Libros</a>
      <a class="btn btn-link" href="books/addBook.jsp"> <i class="fa-solid fa-plus"></i> Agregar Libro</a>
      <a class="btn btn-link" href="loans/listLoans.jsp"> <i class="fa-solid fa-list"></i> Prestamos</a>
      <a class="btn btn-link" href="loans/addLoan.jsp"> <i class="fa-solid fa-plus"></i> Agregar Prestamo</a>
    </div>
  </div>
</body>

<%-- Footer for information and links --%>
<footer>
  <p> <i class="fa-solid fa-envelope"></i> Contacto: <a href="mailto:contacto@bibliotecaduitama.gov"> contacto@bibliotecaduitama.gov </a> </p>
  <p> <a href="https://github.com/mxxgik/BibliotecaDuitama"> <i class="fa-brands fa-github"></i> GitHub</a> </p>
  <div class="footer-img-wrapper">
    <img src="sources/481217677_1152962422899429_7908241231012335867_n.jpg" alt="Logo Duitama">
  </div>
</footer>

<jsp:include page="shared/footer.jsp" />


