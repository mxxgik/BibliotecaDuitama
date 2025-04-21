<%-- here youll find the form with the required fields to start a new loan --%>
<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.*"%>

<jsp:include page="../shared/navbar.jsp" />


<head>
    <style>
        .hidden {
          display: none;
        }
        .container {
          flex: 1;
        }
  </style>

  <script src="https://cdn.botpress.cloud/webchat/v2.3/inject.js"></script>
  <script src="https://files.bpcontent.cloud/2025/04/21/18/20250421182532-6D8NQ7D3.js"></script>

</head>

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
      return;
  }
  
  String field = "";
  boolean lendable = false;
  List<String> awards = new ArrayList<>();
  String genre = "";
  String thematicArea = "";
  String targetAudience = "";

  if(book instanceof ReferenceBook){
    ReferenceBook referenceBook = (ReferenceBook)book;
    field = referenceBook.getField();
    lendable = referenceBook.isLendable();
                    
  }else if (book instanceof FictionBook){
    FictionBook fictionBook = (FictionBook)book;
    genre = fictionBook.getGenre();
    awards = fictionBook.getAwards();

  }else if(book instanceof NotFictionBook){
    NotFictionBook notFictionBook = (NotFictionBook)book;
    thematicArea = notFictionBook.getthematicArea();
    targetAudience = notFictionBook.gettargetAudience();
  }

  if(request.getMethod().equals("POST")){
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String type = request.getParameter("type");
    Boolean available = Boolean.parseBoolean(request.getParameter("available"));
    Book newBook = null;
    int id = manager.getNextBookId();
  }

%>

<body>
     <div class = "container">
        <form id="bookForm" method="post" action="editBook.jsp">
            <div class="mb-3">
              <label for="bookName" class="form-label">Name</label>
              <input type="text" class="form-control" id="bookName" name="name" required value="<%= book.getName()%>" >
            </div>
            <div class="mb-3">
              <label for="bookAuthor" class="form-label">Author</label>
              <input type="text" class="form-control" id="bookAuthor" name="author" required value="<%= book.getAuthor()%>">
            </div>

            <div class="mb-3">
              <label for="bookType" class="form-label">Type</label>
              <select class="form-select" id="bookType" name="type" required>
                <option value="">Select type</option>
                <option value="fiction" <%= book.getType().equals("Ficcion") ? "selected" : ""%> >Ficción</option>
                <option value="notFiction" <%= book.getType().equals("No Ficcion") ? "selected" : ""%> >No Ficción</option>
                <option value="reference" <%= book.getType().equals("Referencia") ? "selected" : ""%> >Referencia</option>
              </select>
            </div>
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="bookAvailable" name="available">
              <label class="form-check-label" for="bookAvailable" <%= book.isAvailable() ? "checked" : ""%> >Available</label>
            </div>

            <!-- Fiction book fields -->
            <div id="fictionFields" class="hidden">
              <div class="mb-3">
                <label for="bookGenre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="bookGenre" name="genre" value = "<%= genre%>">
              </div>
              <div class="mb-3">
                <label for="bookAwards" class="form-label">Premios (separados por coma)</label>
                <input type="text" class="form-control" id="bookAwards" name="awards" placeholder="ej. Pulitzer, Booker" value = "<%= awards.toString().substring(1, awards.toString().length() - 1)%>">
              </div>
            </div>

            <!-- Not Fiction book fields -->
            <div id="noFictionFields" class="hidden">
              <div class="mb-3">
                <label for="bookThematic" class="form-label">Area tematica</label>
                <input type="text" class="form-control" id="bookThematic" name="thematic_area" value="<%= thematicArea%>">
              </div>
              <div class="mb-3">
                <label for="bookAudience" class="form-label">Publico objetivo</label>
                <input type="text" class="form-control" id="bookAudience" name="target_audience" value="<%= targetAudience%>">
              </div>
            </div>

            <!-- Reference book fields -->
            <div id="referenceFields" class="hidden">
              <div class="mb-3">
                <label for="bookField" class="form-label">Campo</label>
                <input type="text" class="form-control" id="bookField" name="field" value="<%= field%>">
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="bookLendable" name="lendable" <%= lendable ? "checked" : ""%>>
                <label class="form-check-label" for="bookLendable">Prestable</label>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script>
        $(document).ready(function() {
            $('#bookType').trigger('change');
        });

        $('#bookType').on('change', function () {
            var selection = $(this).val();
            $('#fictionFields, #noFictionFields', '#referenceFields').addClass('hidden');
            if (selection === 'fiction') {
                $('#fictionFields').removeClass('hidden');
                $('#noFictionFields').addClass('hidden');
                $('#referenceFields').addClass('hidden');
            } else if (selection === 'notFiction') {
                $('#fictionFields').addClass('hidden');
                $('#noFictionFields').removeClass('hidden');
                $('#referenceFields').addClass('hidden');
            } else if (selection === 'reference'){
                $('#fictionFields').addClass('hidden');
                $('#noFictionFields').addClass('hidden');
                $('#referenceFields').removeClass('hidden');
            } else {
                $('#fictionFields').addClass('hidden');
                $('#noFictionFields').addClass('hidden');
                $('#referenceFields').addClass('hidden');
            }

        });
    </script>
</body>


<jsp:include page="../shared/infoFooter.jsp" />

<jsp:include page="../shared/footer.jsp" />