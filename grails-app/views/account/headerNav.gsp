<header class="cd-main-header">
    <a href="${createLink(controller: 'account')}" class="cd-logo">
        %{--<img src="${resource(dir: 'account/img',file: 'cd-logo.svg')}" alt="Logo">--}%
        <img src="${resource(dir: 'images',file: 'logo.jpg')}" alt="Logo" style="width: 129px">
    </a>
    %{--<a href="#0" class="cd-logo"><img src="${resource(dir: 'images',file: 'logo.PNG')}" alt="Logo"></a>--}%

    <div class="cd-search is-hidden">
        <form action="${createLink(controller: 'account',action: 'search')}">
            <input required type="search" name="q" placeholder="Search..." style="width: 28em;-webkit-autofill:">
        </form>
    </div> <!-- cd-search -->

    <a href="#0" class="cd-nav-trigger">Menu<span></span></a>

    <nav class="cd-nav">
        <ul class="cd-top-nav">
            <li><a href="${createLink(controller: 'account')}">
                <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>
            <li><a href="${createLink(controller: 'logout')}">
                <span class="glyphicon glyphicon-log-out" ></span>&nbsp;&nbsp;Log out&nbsp;&nbsp;</a></li>
            %{--<li><a href="#0">Support</a></li>--}%
            %{--<li class="has-children account">--}%
            %{--<a href="#0">--}%
            %{--<img src="img/cd-avatar.png" alt="avatar">--}%
            %{--Account--}%
            %{--</a>--}%

            %{--<ul>--}%

            %{--<li><a href="#0">My Account</a></li>--}%
            %{--<li><a href="#0">Edit Account</a></li>--}%
            %{--<li><a href="#0">Logout</a></li>--}%
            %{--</ul>--}%
            %{--</li>--}%
        </ul>
    </nav>
</header>
