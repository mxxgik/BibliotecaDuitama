
<jsp:include page="shared/header.jsp" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="biblioteca.duitama.model.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.*"%>


     <head>
     </head>
     <body>
          <div class="w-75 p-3" style="background-color: #eee;">
               <table id="myTable">
               <thead>
                    <tr>
                         <th></th>
                    </tr>
               </thead>
               <tbody>
                    <tr>
                         <td></td>
                    </tr>
               </tbody>
               </table>
          </div>

          <%

               BookManager manager = BookManager.getInstance();
               ArrayList<Book> books = manager.getAllBooks();
               Gson gson = new Gson();
               

          %>
          <script type = "text/javascript">

              

               $(document).ready( function () {
                    let books = new Array(); 
                    
                    <% for(Book book : books){ %>
                         books.push(<%= gson.toJson(book)%>);
                    <% } %>
                    $('#myTable').DataTable({
                         
                         data: books,

                         columns: [
                              {
                                   data: 'id',
                                   title: 'ID'
                              },
                              {
                                   data: 'name',
                                   title: 'Nombre'
                              
                              },
                              {
                                   data: 'type',
                                   title: 'Tipo'

                              
                              },
                              {
                                   data: 'author',
                                   title: 'Autor/es'
                              
                              },
                              {
                                   data: 'available',
                                   title: '¿Disponible?'
                              
                              },
                              { 
                                   data: 'field',
                                   title: 'Campo',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              { 
                                   data: 'lendable',
                                   title: '¿Prestable?',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              { 
                                   data: 'thematicArea',
                                   title: 'Area Tematica',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              { 
                                   data: 'targetAudience',
                                   title: 'Publico Objetivo',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              { 
                                   data: 'genre',
                                   title: 'Genero',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              { 
                                   data: 'awards',
                                   title: 'Premios',
                                   render: function(data){
                                        return data == undefined ? "N/A" : data;
                                   }
                              },
                              
                         ]
                         //TODO: separate jsps into footers headers and actual conent.

                    });
               });

          </script>
     </body>
<jsp:include page="shared/footer.jsp" />


