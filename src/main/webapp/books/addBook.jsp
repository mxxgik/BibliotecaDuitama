<%-- here youll find the form with the required fields to start a new loan --%>

<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<jsp:include page="../shared/navbar.jsp" />


<head>
    <style>
        .hidden {
          display: none;
        }
        .container {
    flex: 1; /* This makes the container grow and push the footer down */
  }
  </style>
</head>

<body>
    <div class = "container">
        <form id="bookForm">
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
              <input class="form-check-input" type="checkbox" id="bookAvailable" name="available" checked>
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
                <input type="text" class="form-control" id="bookThematic" name="thematic_area">
              </div>
              <div class="mb-3">
                <label for="bookAudience" class="form-label">Target Audience</label>
                <input type="text" class="form-control" id="bookAudience" name="target_audience">
              </div>
            </div>

            <!-- Reference book fields -->
            <div id="referenceFields" class="hidden">
              <div class="mb-3">
                <label for="bookField" class="form-label">Field</label>
                <input type="text" class="form-control" id="bookField" name="field">
              </div>
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="bookLendable" name="lendable">
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