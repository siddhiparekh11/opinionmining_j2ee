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

		</div>
		<!-- /.container-fluid -->
	</nav>
	<form method="post" action="EndUserLoginCode.jsp">
		<br> <br>
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">End User Login</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Username" name="uname" type="text" autofocus="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password" name="pass" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox" value="Remember Me">Remember Me
									</label>
								</div>

								<input type="submit" value="Login" class="btn btn-primary"> <a href="EndUserRegistration.jsp">Sign up</a>

							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- /.col-->
		</div>

	</form>



</body>

</html>
