<meta name="layout" content="main"/>
<p class="opermessage">${params?.message}</p>
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

    <div class="col-md-8" style="background: #f5f5f57d;padding: 10px;height: 100%">
        <h1>${user?.name}</h1>
        <h5>E-mail: ${user?.username}</h5>
        <br/>
        <g:if test="${user?.id == currentUser?.id}">
            <g:form action="saveCompanyInfo">
                <div class="form-group">
                    <label>Phone number:</label>
                    <input class="form-control" name="phone" value="${user?.phone}"/>
                </div>
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
            <g:if test="${user?.phone}">
            <p>Phone number: ${user?.phone}</p>
            </g:if>
            <br/><br/><br/>
            <div class="col-md-6">
                <p><g:link action="salesOrderList" id="${user.id}" style="text-decoration: none;color:#000;font-family: ''">Sales order list</g:link> </p>
                <p><g:link action="soldTrackingDocuments" id="${user.id}" style="text-decoration: none;color:#000;font-family: ''">Tracking </g:link> </p>
                <p><g:link action="salesInvoiceList" id="${user.id}" style="text-decoration: none;color:#000;font-family: ''">Invoices </g:link> </p>
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