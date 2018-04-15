<meta name="layout" content="main"/>
<h3 class="pageTitle">Purchase quotation</h3>
<div style="margin: auto">
    <h3>${quot?.name}</h3>
    <h5>By: ${quot?.user?.name}</h5>
</div>
<table class="table table-bordered">
    <thead>
    <th>Product name</th>
    <th>Description</th>
    <th>Required count</th>
    %{--<th>Edit</th>--}%
    %{--<th>Delete</th>--}%
    </thead>
    <tbody>
    <g:each in="${products}" var="product">
        <tr>
            <td>${product.product.name}</td>
            <td>${product.description}</td>
            <td>${product.numberOfProduct.toString().replace(".0", "")}</td>
        </tr>
    </g:each>
    </tbody>
</table>
<g:if test="${!ada.SalesForm?.findByPurshaseForm(quot)}">
<div class="col-md-6 col-md-offset-3">
    <p style="color:green">Create sales quotation for this purshase quotation.</p>
    <g:form action="saveSalesQuatation">
        <div class="form-group">
            <label>Name:</label>
            <input type="text" placeholder="The name of sales quotation" name="name" class="form-control"/>
        </div>
<div class="form-group">
            <label>Tax (%) :</label>
            <input type="number" step="1" placeholder="18%" name="tax" class="form-control"/>
        </div>

        <div class="form-group">
            <label>Description:</label>
            <textarea placeholder="Description of sales quotation" name="description" class="form-control"></textarea>
        </div>
        <input type="hidden" name="purshaseformid" value="${quot?.id}"/>
        <button class="btn btn-success">Submit sales quotation and add available products now.</button>
    </g:form>
</div>
</g:if>
