<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Opinion Mining</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/datepicker3.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				
				<a class="navbar-brand" href="#"><span>Opinion</span>Mining</a>
                                <br>
				<p align="right">
  <a href="logout1.jsp">Logout</a>
</p>	
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
    <form method="post" action="CreateProductCodes.jsp">
        <br>
        <br>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Enter product details</div>
				<div class="panel-body">
					<form role="form">
						<fieldset>
							<div class="form-group">
                                                            <label>Product ID</label>
								<input class="form-control" name="product_id" type="text" autofocus="">
							</div>
							<div class="form-group">
                                                            <label>Product Name</label>
								<input class="form-control" name="product_name" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 1</label>
								<input class="form-control" name="review1" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 2</label>
								<input class="form-control" name="review2" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 3</label>
								<input class="form-control" name="review3" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Review 4</label>
								<input class="form-control" name="review4" type="text" value="">
							</div>
                                                    
                                                    
							
                                                    
                                                    <input type="submit" value="Submit" class="btn btn-primary">     
                                                   
                                                    
						</fieldset>
                                            <br>
                                            
                       
                    
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div>
    	
    </form>
		

	
</body>

</html>