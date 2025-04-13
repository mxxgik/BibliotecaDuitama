<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>
<jsp:include page="../shared/header.jsp" />

<head>
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Segoe UI', sans-serif;
            padding: 2rem;
        }

        h2 {
            text-align: center;
            margin-bottom: 2rem;
            color: #f0f0f0;
        }

        .table-container {
            background-color: #1e1e1e;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.2);
        }

        table.dataTable {
            color: #e0e0e0;
            background-color: transparent;
        }

        table.dataTable thead {
            background-color: #2c2c2c;
        }

        table.dataTable thead th {
            color: #ccc;
            border-bottom: none;
        }

        table.dataTable tbody tr:hover {
            background-color: #2b2b2b;
        }

        .dataTables_wrapper .dataTables_filter input,
        .dataTables_wrapper .dataTables_length select {
            background-color: #1f1f1f;
            color: #e0e0e0;
            border: 1px solid #444;
            border-radius: 5px;
            padding: 5px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            background-color: #1f1f1f !important;
            color: #ccc !important;
            border: 1px solid #333;
            border-radius: 4px;
            margin: 0 2px;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background-color: #333 !important;
            color: #fff !important;
        }

        .dataTables_wrapper .dataTables_info {
            color: #aaa;
        }
    </style>
</head>

<body>
    <div class="table-responsive table-container" style="width:75%">
        <table id="allBooksTable" class="table table-dark table-striped table-hover display" style="width:100%">
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
                <% 
                    BookManager manager = BookManager.getInstance();
                    ArrayList<Book> books = manager.getAllBooks();
                    Gson gson = new Gson();
                    String jsonBooks = gson.toJson(books);
                %>
            </tbody>
        </table>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            const books = <%= jsonBooks %>;

            $('#allBooksTable').DataTable({
                data: books,
                columns: [
                    { data: 'id', title: 'ID' },
                    { data: 'name', title: 'Nombre' },
                    { data: 'type', title: 'Tipo' },
                    { data: 'author', title: 'Autor/es' },
                    { data: 'available', title: '¿Disponible?', render: (data) => data ? 'Sí' : 'No' },
                    { data: 'field', title: 'Campo', render: (data) => data || 'N/A' },
                    { data: 'lendable', title: '¿Prestable?', render: (data) => data ? 'Sí' : 'No' },
                    { data: 'thematicArea', title: 'Área Temática', render: (data) => data || 'N/A' },
                    { data: 'targetAudience', title: 'Público Objetivo', render: (data) => data || 'N/A' },
                    { data: 'genre', title: 'Género', render: (data) => data || 'N/A' },
                    { data: 'awards', title: 'Premios', render: (data) => data || 'N/A' }
                ]
            });
        });
    </script>
</body>

<jsp:include page="../shared/footer.jsp" />
