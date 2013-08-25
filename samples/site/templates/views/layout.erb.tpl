<!DOCTYPE html>
<html>
  <head>
    <title><%= @title %></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
 <!-- Static navbar -->
      <div class="navbar navbar-default">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">${title}</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
<#
    entities.each do | entity |
#>          
            <li><a href="/${entity.name}">${entity.setdescriptor}</a></li>
<#
    end
#>          
            <li><a href="/about">About</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
      
      <div class="container">
      <%= yield %>
      </div>
  </body>
</html>