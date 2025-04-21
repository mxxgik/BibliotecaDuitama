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
      <h3 id="itemTitle"></h3>
      <p id="itemDescription"></p>
    </div>
  </div>
</body>


<jsp:include page="../shared/infoFooter.jsp" />

<jsp:include page="../shared/footer.jsp" />