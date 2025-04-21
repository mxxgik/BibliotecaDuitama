<%-- here youll find the form with the required fields to start a new loan --%>

<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
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

  if(request.getMethod().equals("POST")){
    BookManager manager = BookManager.getInstance();
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String type = request.getParameter("type");
    Boolean available = Boolean.parseBoolean(request.getParameter("available"));
    Book newBook = null;
    int id = manager.getNextBookId();

    if(type.equals("fiction")){
        String genre = request.getParameter("genre");
        List<String> awards = new ArrayList<>(Arrays.asList(request.getParameter("awards").split("\\s*,\\s*"))); 
        newBook = new FictionBook(id, name, author, available, genre, awards);
    }else if(type.equals("notFiction")){
        String thematicArea = request.getParameter("thematicArea");
        String targetAudience = request.getParameter("targetAudience");
        newBook = new NotFictionBook(id, name, author, available, thematicArea, targetAudience);
    }else if(type.equals("reference")){
        String field = request.getParameter("field");
        boolean lendable = request.getParameter("lendable") != null;
        newBook = new ReferenceBook(id, name, author, available, field, lendable);
    }
    if(newBook != null){
        manager.addBook(newBook);
        response.sendRedirect("listBooks.jsp");
        return;
    }
  }


  %>

<body>
    <div class = "container">
        <form id="bookForm" method="post" action="addBook.jsp">
            <div class="mb-3">
              <label for="bookName" class="form-label">Nombre</label>
              <input type="text" class="form-control" id="bookName" name="name" required>
            </div>
            <div class="mb-3">
              <label for="bookAuthor" class="form-label">Autor</label>
              <input type="text" class="form-control" id="bookAuthor" name="author" required>
            </div>

            <div class="mb-3">
              <label for="bookType" class="form-label">Tipo</label>
              <select class="form-select" id="bookType" name="type" required>
                <option value="">Select type</option>
                <option value="fiction">Ficción</option>
                <option value="notFiction">No Ficción</option>
                <option value="reference">Referencia</option>
              </select>
            </div>
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="bookAvailable" name="available" value="true" checked>
              <label class="form-check-label" for="bookAvailable">Disponible</label>
            </div>

            <!-- Fiction book fields -->
            <div id="fictionFields" class="hidden">
              <div class="mb-3">
                <label for="bookGenre" class="form-label">Genre</label>
                <input type="text" class="form-control" id="bookGenre" name="genre">
              </div>
              <div class="mb-3">
                <label for="bookAwards" class="form-label">Awards (comma-separated)</label>
                <input type="text" class="form-control" id="bookAwards" name="awards" placeholder="e.g. Pulitzer, Booker">
              </div>
            </div>

            <!-- Not Fiction book fields -->
            <div id="noFictionFields" class="hidden">
              <div class="mb-3">
                <label for="bookThematic" class="form-label">Thematic Area</label>
                <input type="text" class="form-control" id="bookThematic" name="thematicArea">
              </div>
              <div class="mb-3">
                <label for="bookAudience" class="form-label">Target Audience</label>
                <input type="text" class="form-control" id="bookAudience" name="targetAudience">
              </div>
            </div>

            <!-- Reference book fields -->
            <div id="referenceFields" class="hidden">
              <div class="mb-3">
                <label for="bookField" class="form-label">Field</label>
                <input type="text" class="form-control" id="bookField" name="field">
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="bookLendable" name="lendable" value="true">
                <label class="form-check-label" for="bookLendable">Lendable</label>
              </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script>
        $('#bookType').on('change', function () {
            const selection = $(this).val();
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