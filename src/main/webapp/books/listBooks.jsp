<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>
<jsp:include page="../shared/header.jsp" />

<jsp:include page="../shared/navbar.jsp" />

<body>
    <div class="container">
            <button class="btn btn-primary m-2" id="showAllBooks"><i class="fa-solid fa-book"></i> Todos </button>
            <button class="btn btn-primary m-2" id="showFictionBooks"><i class="fa-solid fa-book"></i> Ficcion </button>
            <button class="btn btn-primary m-2" id="showNotFictionBooks"><i class="fa-solid fa-book"></i> No Ficcion </button>
            <button class="btn btn-primary m-2" id="showReferenceBooks"><i class="fa-solid fa-book"></i> Referencia </button>
        <div class="row justify-content-center">
            <div class="table-responsive table-container" id="allBooksContainer">
                <table id="allBooksTable" class="table table-dark table-striped table-hover display" style="w-100">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Autor/es</th>
                            <th>¿Disponible?</th>
                            <th>Campo</th>
                            <th>¿Prestable?</th>
                            <th>Area Temática</th>
                            <th>Publico Objetivo</th>
                            <th>Género</th>
                            <th>Premios</th>
                        </tr>
                    </thead>
                    <tbody>    
                    </tbody>
                </table>
            </div>
            <div class="table-responsive table-container" style ="display: none;" id="fictionBooksContainer">
                <table id="fictionBooksTable" class="table table-dark table-striped table-hover display" style="w-100">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Autor/es</th>
                            <th>¿Disponible?</th>
                            <th>Género</th>
                            <th>Premios</th>
                        </tr>
                    </thead>
                    <tbody>    
                    </tbody>
                </table>
            </div>
            <div class="table-responsive table-container" style ="display: none;" id="notFictionBooksContainer">
                <table id="notFictionBooksTable" class="table table-dark table-striped table-hover display" style="w-100">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Autor/es</th>
                            <th>¿Disponible?</th>
                            <th>Area Temática</th>
                            <th>Publico Objetivo</th>

                        </tr>
                    </thead>
                    <tbody>    
                    </tbody>
                </table>
            </div>
            <div class="table-responsive table-container" style ="display: none;" id="referenceBooksContainer">
                <table id="referenceBooksTable" class="table table-dark table-striped table-hover display" style="w-100">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Tipo</th>
                            <th>Autor/es</th>
                            <th>¿Disponible?</th>
                            <th>Género</th>
                            <th>Premios</th>
                        </tr>
                    </thead>
                    <tbody>    
                    </tbody>
                </table>
            </div>
            
            <% 
                BookManager manager = BookManager.getInstance();
                ArrayList<Book> books = manager.getAllBooks();
                Gson gson = new Gson();
                String jsonBooks = gson.toJson(books);
            %>
            <script type="text/javascript">
                $(document).ready(function () {
                    const books = <%= jsonBooks %>;
                    const fictionBooks = <%= gson.toJson(manager.getBooksByType("Ficcion"))%>
                    const notFictionBooks = <%= gson.toJson(manager.getBooksByType("No Ficcion"))%>
                    const referenceBooks = <%= gson.toJson(manager.getBooksByType("Referencia"))%>
                    $('#allBooksTable').DataTable({
                        data: books,
                        columns: [
                            { data: 'id', title: 'ID' },
                            { data: 'name', title: 'Nombre' },
                            { data: 'type', title: 'Tipo' },
                            { data: 'author', title: 'Autor/es' },
                            { data: 'available', title: '¿Disponible?', render: (data) => data ? 'Sí' : 'No' },
                            { data: 'field', title: 'Campo', render: (data) => data || 'N/A' },
                            { data: 'lendable', title: '¿Prestable?', render: (data) =>{
                                   if(data === undefined){
                                        return "N/A";
                                   }else if(data === false){
                                        return "No";
                                   }else{
                                        return "Sí"
                                   }
                              }},
                            { data: 'thematicArea', title: 'Área Temática', render: (data) => data || 'N/A' },
                            { data: 'targetAudience', title: 'Público Objetivo', render: (data) => data || 'N/A' },
                            { data: 'genre', title: 'Género', render: (data) => data || 'N/A' },
                            { data: 'awards', title: 'Premios', render: (data) => data || 'N/A' },
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<button class="btn btn-m btn-primary m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-pen-to-square"></i></button> 
                                                                                                <button class="btn btn-m btn-danger m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-trash"></i></button>` }
                        ]
        
                    });
                    $('#fictionBooksTable').DataTable({
                        data: fictionBooks,
                        columns: [
                            { data: 'id', title: 'ID' },
                            { data: 'name', title: 'Nombre' },
                            { data: 'type', title: 'Tipo' },
                            { data: 'author', title: 'Autor/es' },
                            { data: 'available', title: '¿Disponible?', render: (data) => data ? 'Sí' : 'No' },
                            { data: 'genre', title: 'Género' },
                            { data: 'awards', title: 'Premios' },
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<button class="btn btn-m btn-primary m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-pen-to-square"></i></button> 
                                                                                                <button class="btn btn-m btn-danger m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-trash"></i></button>` }
                        ]
                    });
                    $('#notFictionBooksTable').DataTable({
                        data: notFictionBooks,
                        columns: [
                            { data: 'id', title: 'ID' },
                            { data: 'name', title: 'Nombre' },
                            { data: 'type', title: 'Tipo' },
                            { data: 'author', title: 'Autor/es' },
                            { data: 'available', title: '¿Disponible?', render: (data) => data ? 'Sí' : 'No' },
                            { data: 'thematicArea', title: 'Área Temática' },
                            { data: 'targetAudience', title: 'Público Objetivo' },
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<button class="btn btn-m btn-primary m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-pen-to-square"></i></button> 
                                                                                                <button class="btn btn-m btn-danger m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-trash"></i></button>` }
                        ]
                    });
                    $('#referenceBooksTable').DataTable({
                        data: referenceBooks,
                        columns: [
                            { data: 'id', title: 'ID' },
                            { data: 'name', title: 'Nombre' },
                            { data: 'type', title: 'Tipo' },
                            { data: 'author', title: 'Autor/es' },
                            { data: 'available', title: '¿Disponible?', render: (data) => data ? 'Sí' : 'No' },
                            { data: 'field', title: 'Campo', },
                            { data: 'lendable', title: '¿Prestable?', render: (data) => data ? 'Sí' : 'No' },
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<button class="btn btn-m btn-primary m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-pen-to-square"></i></button> 
                                                                                                <button class="btn btn-m btn-danger m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-trash"></i></button>` }
                        ]
                    });

                    $("#showAllBooks").on("click", () => {
                        $("#allBooksContainer").show();
                        $("#fictionBooksContainer").hide();
                        $("#notFictionBooksContainer").hide();
                        $("#referenceBooksContainer").hide();
                    })
                    $("#showFictionBooks").on("click", () => {
                        $("#allBooksContainer").hide();
                        $("#fictionBooksContainer").show();
                        $("#notFictionBooksContainer").hide();
                        $("#referenceBooksContainer").hide();
                    })
                    $("#showNotFictionBooks").on("click", () => {
                        $("#allBooksContainer").hide();
                        $("#fictionBooksContainer").hide();
                        $("#notFictionBooksContainer").show();
                        $("#referenceBooksContainer").hide();
                    })
                    $("#showReferenceBooks").on("click", () => {
                        $("#allBooksContainer").hide();
                        $("#fictionBooksContainer").hide();
                        $("#notFictionBooksContainer").hide();
                        $("#referenceBooksContainer").show();
                    })

                });
            </script>
        </div>
    </div>
</body>

<jsp:include page="../shared/infoFooter.jsp" />

<jsp:include page="../shared/footer.jsp" />
