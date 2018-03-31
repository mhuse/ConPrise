<%@ page import="ada.Interest" %>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"/>
<link rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta charset="UTF-8" />
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
	<title>Ada university</title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link rel="stylesheet" href="${resource(dir: 'css',file: 'login.css')}"/>
</head>
<body>
<div class="container">
<style>
.input-block-level{
	width:80%!important;
}
</style>
	<header>
		<h1>Ada university</h1>

	</header>
	<section>
		<div id="container_demo" >
			<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
			<a class="hiddenanchor" id="toregister"></a>
			<a class="hiddenanchor" id="tologin"></a>
			<div id="wrapper">
				<div id="login" class="animate form">
					<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='on'>
						<p style="color: <g:if test="${params?.message?.equals('Account created !  Go to your email address and submit your account .')||params?.message?.equals('Account Activated !')}">green</g:if><g:else> red</g:else>">${params?.message}</p>
						<p>
							<label for='username'>E-mail address:</label>
							<input type='text' class='text_' name='j_username' id='username'/>
						</p><br/>

						<p>
							<label for='password'>Password:</label>
							<input type='password' class='text_' name='j_password' id='password'/>
						</p>

						<p id="remember_me_holder">
							<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
							<label for='remember_me'>Remember me</label>
						</p>

						<p class="signin button">
							<input type="submit" id="submit" value="Login"/>
						</p>
						<p class="change_link">
							Not a member yet ?
							<a href="#toregister" class="to_register">Join us</a>
						</p>
					</form>
				</div>

				<div id="register" class="animate form">
					<g:form  controller="home" action="signup" autocomplete="on">
						<h1> Sign up </h1>
						<p>
							<label for="name" class="uname" >The name of your company:</label>
							<input id="name" name="name" required="required" type="text" placeholder="mysuperusername690" />
						</p>
						<p>
							<label for="usernamesignup" class="uname" >E-mail address:</label>
							<input id="usernamesignup" name="username" required="required" type="email" placeholder="mysuperusername690" />
						</p>
						<p>
					      <label class="uname" >Interests:</label>
								<select  multiple="multiple" data-live-search="true" class="selectpicker" name="interest" style="width: 100%">
									<g:each in="${ada.Interest?.findAll()}" var="interest">
										<option value="${interest?.id}">${interest?.name}</option>
									</g:each>
							</select>
						</p>
						<p>
							<label for="voen" class="uname" >Vöen:</label>
							<input id="voen" name="voen" required="required" type="text" placeholder="mysuperusername690" />
						</p>
						<p>
							<label for="passwordsignup" class="youpasswd" >Password:</label>
							<input minlength="8" id="passwordsignup" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/>
						</p>
						<p>
							<label for="passwordsignup_confirm" class="youpasswd" >Please confirm your password:</label>
							<input minlength="8" id="passwordsignup_confirm" name="password1" required="required" type="password" placeholder="eg. X8df!90EO"/>
						</p>
						<p class="signin button">
							<input type="submit" value="Sign up"/>
						</p>
						<p class="change_link">
							Already a member ?
							<a href="#tologin" class="to_register"> Go and log in </a>
						</p>
					</g:form>
				</div>

			</div>
		</div>
	</section>

	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
 <script type='text/javascript'>
        <!--
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
        $('.selectpicker').selectpicker({
            maxOptions:4
        });
	</script>



</div>
</body>
</html>