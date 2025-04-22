<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<jsp:include page="../shared/navbar.jsp" />


<head>
    <style>
    .item-display {
      background-color: #381820;
      color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      min-width: 300px;
    }
  </style>

  <script src="https://cdn.botpress.cloud/webchat/v2.3/inject.js"></script>
  <script src="https://files.bpcontent.cloud/2025/04/21/18/20250421182532-6D8NQ7D3.js"></script>

</head>

<body>
    <div class="container vh-100 d-flex justify-content-center align-items-center">
    <div id="itemCard" class="item-display text-center">
      <div class="container">
        <h2>Eliminar Libro</h2>
        <%
          BookManager manager = BookManager.getInstance();
          int bookId = 0;
          try{
              bookId = Integer.parseInt(request.getParameter("dataId"));
          }catch(Exception e){
              response.sendRedirect("listBooks.jsp");
              return;
          }
          Book book = manager.getBookById(bookId);
          if(book == null){
              response.sendRedirect("listBooks.jsp");
          }
          if(request.getMethod().equals("POST")){
              boolean deleted = manager.deleteBook(bookId);
              if(deleted){
              ArrayList<Book> books = manager.getAllBooks();
              Gson gson = new Gson();
              String jsonBooks = gson.toJson(books);
              }else{
        %>
            <div class="alert alert-danger">
                <p>No se pudo eliminar el libro actualmente esta en prestamo</p>
            </div>
            <p><a href="listBooks.jsp" class="btn">Volver a la lista</a></p>
           
        <%
                }
                return;
            }            
        %>
        <div class="alert alert-danger">
            <p>¿Está seguro que desea eliminar el siguiente libro?</p>
            <p><strong>ID:</strong> <%= book.getId()%></p>
            <p><strong>Nombre:</strong><%= book.getName()%> </p>
            <p><strong>Tipo:</strong><%= book.getType()%></p>
            <p><strong>Condición:</strong> <%= book.getAuthor()%></p>
        </div>
        
        <form method="post" action="bookDeleteConfirmation.jsp?id=<%=book.getId()%>">
            <div class="form-group">
                <button type="submit" class="btn btn-danger">Confirmar Eliminación</button>
                <a href="list.jsp" class="btn">Cancelar</a>
            </div>
        </form>
        </div>
    </div>
  </div>
</body>


<jsp:include page="../shared/infoFooter.jsp" />

<jsp:include page="../shared/footer.jsp" />