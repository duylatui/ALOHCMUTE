<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistic</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
	 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <!------ Include the above in your HEAD tag ------>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="<%=request.getContextPath()%>/view/sociala/css/style.css" rel="stylesheet" type="text/css"/> 
        
      
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
  <!-- Material Design Bootstrap Ecommerce -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
  <!-- Your custom styles (optional) -->
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="<%=request.getContextPath()%>/view/sociala/css/style.css" rel="stylesheet" type="text/css"/> 
        <style>
        body {
            margin: 0;
            padding: 0;
        }
    </style>
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css"><style>body {
  background-color: #fbfbfb;
}
@media (min-width: 991.98px) {
  main {
    padding-left: 240px;
  }
}

/* Sidebar */
.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  padding: 58px 0 0; /* Height of navbar */
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
  width: 240px;
  z-index: 600;
}

@media (max-width: 991.98px) {
  .sidebar {
    width: 80%;
  }
}
.sidebar .active {
  border-radius: 5px;
  box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: 0.5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}</style>
</head>
<body>
<!--Main Navigation-->
<header>
 <jsp:include page="LeftAdmin.jsp"></jsp:include>

  
</header>
<!--Main Navigation-->

<!--Main layout-->
<main>
	<jsp:include page="Horizbar.jsp"></jsp:include>
  <div class="container pt-4">
  
	
    <!--Section: Sales Performance KPIs-->
    <section class="mb-4" style="margin-top:100px">
    	<c:if test="${error!=null }">
                 <div class="alert alert-danger" role="alert">
						 ${error}
				</div>
				</c:if>
				<c:if test="${mess!=null }">
                <div class="alert alert-success" role="alert">
				  	${mess}
				</div>
				</c:if>
			
    </section>	
        <div class="card-header py-3 row">
        <div class="col-sm-6">
          <h5 class="mb-0 text-left" id=""><strong>UseID</strong></h5>
        </div>
          <div class="col-sm-6"><h5 class="mb-0 text-right" id=""></h5></div>
        </div>
       <form action="findPostsByUserComment" method="post">
	   <label>User ID</label>
		<input type="text" name="id">
			
			<input type="submit" value="Nhập">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-hover text-nowrap">
              <thead>
                <tr>
                  
                  <th scope="col">Content</th>
                  <th scope="col">Post Time</th>
                  <th scope="col">Comment</th>
                </tr>
              </thead>
              <tbody id="content">
        <c:forEach var="post" items="${post}">
        <tr>
        	<td>Content: ${post.content}</td>
    		<td>Likes: ${post.postTime}</td>
    		<td>
        
    	<c:choose>
        <c:when test="${not empty post.commentsSet}">
            <c:set var="latestComment" value="${post.commentsSet[0]}" />
            <p>Content: ${latestComment.content}</p>
            <p>Comment Time: ${latestComment.commentTime}</p>
            <!-- Add more details as needed -->
        </c:when>
        <c:otherwise>
            <p>No comments for this post.</p>
        </c:otherwise>
    	</c:choose>
    	</td>
    	</tr>
    <hr/>
</c:forEach>
</tbody>
            </table> 
          </div>
        </div>
        
       </form>
     
        
      </div>
    <!--Section: Sales Performance KPIs-->


</main>
 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
<!--Main layout-->
<!-- SCRIPTS -->
  <!-- JQuery -->
  <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
    <!-- MDB Ecommerce JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
 <!-- MDB -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/view/sociala/js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/view/sociala/js/script.js"></script>
    <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    

<script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
	 <!-- MDB -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/view/sociala/js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/view/sociala/js/script.js"></script>
    
</body>
</html>