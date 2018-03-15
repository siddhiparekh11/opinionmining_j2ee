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
				
				<a class="navbar-brand" href="index.jsp"><span>Opinion</span>Mining</a>
				
					
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
    <form method="post" action="EndUserRegisterCode.jsp">
        <br>
        <br>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">New End User Registration</div>
				<div class="panel-body">
					<form role="form">
						<fieldset>
							<div class="form-group">
                                                            <label>First Name</label>
								<input class="form-control" name="fname" type="text" autofocus="">
							</div>
							<div class="form-group">
                                                            <label>Last Name</label>
								<input class="form-control" name="lname" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Username</label>
								<input class="form-control" name="uname" type="text" value="">
							</div>
                                                    <div class="form-group">
                                                            <label>Password</label>
								<input class="form-control" name="pass" type="password" value="">
							</div>
                                                    
							
                                                    
                                                    <input type="submit" value="Submit" class="btn btn-primary">     
                                                    <input type="reset" value="Reset" class="btn btn-primary">
                                                    
						</fieldset>
                                            <br>
                                            
                       <td colspan="2">Registered Users <a href="EndUserLogin.jsp">Login Here</a></td>
                    
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div>
    	
    </form>
		

	
</body>

</html>