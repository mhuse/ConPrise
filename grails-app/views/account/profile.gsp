<meta name="layout" content="main"/>

<div class="col-md-12">
    <div class="col-md-4">
        <g:if test="${user?.image}">
            <a title="${user?.name}" class="example-image-link" data-lightbox="example-set"
               href="${createLink(controller: "imageDisplayer", action: "companyImage", params: [photoName: user?.image, dir: ''])}">
                <img class="companyicon"
                     src="${createLink(controller: "imageDisplayer", action: "companyImage", params: [photoName: user?.image, dir: 'middle'])}"/>
            </a>
        </g:if>
        <g:else>
            <label for="profilepicture" class="choosephoto" style="cursor: pointer;float: left">
                <img class="companyicon" style="cursor: pointer" src="${resource(dir: 'images', file: 'company.png')}"/>
            </label>
            <g:if test="${user.id == currentUser.id}">
                <g:uploadForm action="saveProfilePicture" class="saveProfilePicture" style="display: none">
                    <input type="file" name="image" style="display: none" id="profilepicture"/>
                </g:uploadForm>
            </g:if>
        </g:else>
    </div>

    <div class="col-md-8">
        <h1>${user?.name}</h1>
        <g:if test="${user?.id == currentUser?.id}">
            <g:form action="saveCompanyInfo">
                <div class="form-group">
                    <label>Description:</label>
                    <textarea class="form-control" name="description">${user?.description}</textarea>
                </div>

                <div class="form-group">
                    <button class="btn btn-success pull-right">Save</button>
                </div>
            </g:form>
        </g:if>
        <g:else>
            <p>${user?.description}</p>
            <br/><br/><br/>
            <div class="col-md-6">
                <h2><g:link action="salesOrderList" id="${user.id}" style="text-decoration: none;color:#ffa44b;font-family: ''">Sales order list</g:link> </h2>
                <h2><g:link action="soldTrackingDocuments" id="${user.id}" style="text-decoration: none;color:#00850b;font-family: ''">Tracking </g:link> </h2>
                <h2><g:link action="salesInvoiceList" id="${user.id}" style="text-decoration: none;color:#d60213;font-family: ''">Invoices </g:link> </h2>
            </div>
        </g:else>
    </div>
</div>
<script>
    $(function () {
        $(document).on("change", "#profilepicture", function () {
            $(".saveProfilePicture").submit();
        });
    })
</script>