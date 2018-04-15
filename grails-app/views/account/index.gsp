<meta name="layout" content="main"/>
<style>
    body{
        background-repeat: no-repeat;
        background-size: cover!important;
        background-position: center;
        background-attachment: fixed!important;
        background-image: url("${resource(dir: 'images',file: 'bg.jpg')}") !important;
    }
    .content-wrapper{
        padding-right: 0!important;
    }
</style>
<g:if test="${params?.message}">
    <h1 style="color:green">${params?.message}</h1>
</g:if>
<g:else>
    <div class="pull-right" style="background: #cccccc87;width:50%;height: 500px">
    <h1 style="color:#fff" > ${info?.title}</h1>
        <p style="text-align: center;color:#fff">${info?.text}</p>
    </div>
</g:else>