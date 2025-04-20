<%-- here youll find both active and past loans --%>

<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<head>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', sans-serif;
            padding: 2rem;
        } 
    </style>
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="../index.jsp" class="nav-link">Inicio</a></li>
        <li class="nav-item"><a href="../books/listBooks.jsp" class="nav-link">Libros</a></li>
        <li class="nav-item"><a href="../loans/listLoans.jsp" class="nav-link active" aria-current="page">Prestamos</a></li>
      </ul>
    </header>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="table-responsive table-container" id="allBooksContainer">
                <table id="loansTable" class="table table-dark table-striped table-hover display" style="w-100">
                    <thead>
                        <tr>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>    
                    </tbody>
                </table>
            </div>
            
            <% 
                BookManager manager = BookManager.getInstance();
                ArrayList<Loan> loans = manager.getAllLoans();
                Gson gson = new Gson();
                String jsonLoans = gson.toJson(loans);
            %>
            <script type="text/javascript">
                $(document).ready(function () {
                    var loans = <%= jsonLoans %>;
                    $('#loansTable').DataTable({
                        data: loans,
                        columns: [
                            { data: 'loanId', title: 'ID Prestamo' },
                            { data: 'bookId', title: 'ID libro' },
                            { data: 'book.name', title: 'libro' },
                            { data: 'borrowerId', title: 'ID Prestamista' },
                            { data: 'borrowerName', title: 'Prestamista' },
                            { data: 'borrowDate', title: 'Fecha de prestamo'},
                            { data: 'dueDate', title: 'Fecha de entrega'},
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<button class="btn btn-m btn-primary m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-pen-to-square"></i></button> 
                                                                                                <button class="btn btn-m btn-danger m-2 edit-btn" data-id="${row.id}"><i class="fa-solid fa-trash"></i></button>` }
                        ]
        
                    });

                });
            </script>
        </div>
    </div>
</body>

<jsp:include page="../shared/footer.jsp" />

