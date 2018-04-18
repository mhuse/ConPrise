<meta name="layout" content="main"/>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<p class="opermessage">${params?.message}</p>
 <br/>

    <hgroup class="mb20">
        <h1>Search Results</h1>
        <h3 style="color:green;text-align: center">${params?.message}</h3>
        <h2 class="lead"><strong class="text-danger">${foundcompanies.size()}</strong> results were found for the search for <strong class="text-danger">${params?.q}</strong></h2>
    </hgroup>

    <section class="col-xs-12 col-sm-6 col-md-12">

<g:each in="${foundcompanies}" var="company">
        <article class="search-result row">
            <div class="col-xs-12 col-sm-12 col-md-3">
                <a href="#" title="Lorem ipsum" class="thumbnail"><img src="${resource(dir: 'account/img',file: 'company.png')}" alt="${company.name}" /></a>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-7">
                <h3><a href="${createLink(action: 'profile',id:company?.id)}" title="">${company?.name}</a></h3>
                <p>${company?.description?.take(500)}</p>
                <g:if test="${!conprise.Friend?.findByUser1AndUser2AndStatusLessThan(company,currentUser,2) && !conprise.Friend?.findByUser1AndUser2AndStatusLessThan(currentUser,company,2)}">
                <span class="plus"><a href="${createLink(action: 'addFriend',id:company?.id,params: [q:params?.q])}" title="">
                    <i class="glyphicon"> <b style="font-size:20px;font-family: monospace">+</b> Add as a friend</i>
                </a></span>
                </g:if><g:else>
                <span class="plus"><a  style="background: red" href="${createLink(action: 'deleteFriend',id:company?.id,params: [q:params?.q])}" title="">
                    <i class="glyphicon">Delete</i>
                </a></span>
            </g:else>
                %{--<g:else>--}%
                    %{--<span class="plus" style="color: #2a6c15">Friend request sent</span>--}%
                %{--</g:else>--}%
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3">
                <ul class="meta-search">
                    <g:if test="${company.creationDate}">
                        <li><i class="glyphicon glyphicon-calendar"></i> <span>${company?.creationDate?.toString()?.take(10)}</span></li>
                    </g:if>
                    <li><i class="glyphicon glyphicon-envelope"></i> <span>${company?.username}</span></li>
                </ul>
            </div>
            <span class="clearfix borda"></span>
        </article>
</g:each>
    </section>
