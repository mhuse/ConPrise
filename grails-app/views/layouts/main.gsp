<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${resource(dir: 'account/css', file: 'reset.css')}">
    <link rel="stylesheet" href="${resource(dir: 'account/css', file: 'style.css')}">
    <link rel="stylesheet" href="${resource(dir: 'account/css', file: 'main.css')}">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${resource(dir: 'css',file: 'custom.css')}">
    <script src="${resource(dir: 'account/js', file: 'modernizr.js')}"></script>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css',file: 'lightbox.min.css')}" />

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

<g:include controller="account" action="headerNav"/>
<main class="cd-main-content">
    <style>
        body{
            background: #f2f2f2!important;
        }
    </style>
    <g:include controller="account" action="leftNav"/>
    <div class="content-wrapper"><br/><br/>
        <g:layoutBody/>
    </div>
</main>
<script src="${resource(dir: 'account/js', file: 'jquery-2.1.4.js')}"></script>
<script src="${resource(dir: 'account/js', file: 'jquery.menu-aim.js')}"></script>
<script src="${resource(dir: 'account/js', file: 'main.js')}"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.min.js"></script>
<script type="text/javascript" src="${resource(dir: 'js',file: 'lightbox-plus-jquery.min.js')}"></script>
</body>
</html>
