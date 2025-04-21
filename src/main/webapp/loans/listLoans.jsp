<%-- here youll find both active and past loans --%>

<jsp:include page="../shared/header.jsp" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>

<jsp:include page="../shared/navbar.jsp" />


<head>
    
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
                            { data: null, title: 'Acciones', orderable: false, render: (row) =>`<a class="btn btn-m btn-primary m-2 edit-btn" href= "loanDetails.jsp?dataId=${row.loanId}"><i class="fa-solid fa-pen-to-square"></i></a> 
                                                                                                <a class="btn btn-m btn-danger m-2 edit-btn" href= "loanReturnConfirmation.jsp?dataId=${row.loanId}"><i class="fa-solid fa-trash"></i></a>` }
                        ]
        
                    });

                });
            </script>
        </div>
    </div>
</body>

<jsp:include page="../shared/infoFooter.jsp" />

<jsp:include page="../shared/footer.jsp" />

