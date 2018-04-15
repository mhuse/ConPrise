<%@ page import="ada.Product" %>
<h3 class="pageTitle">Add product to purchase request</h3>
<meta name="layout" content="main"/>
<div class="col-md-6 col-md-offset-3">
    <g:if test="${products?.size()>purchaseRequestProducts?.size()}">
    <g:form action="savePurhsaseRequestProduct" id="${params?.id}">
        <div class="form-group">
            <label>Product:</label>
            <select name="product" class="selectpicker form-control" data-live-search="true" title="Select product :">
                <g:each in="${products}" var="prd">
                    <g:if test="${!purchaseRequestProducts.contains(prd)}">
                        <option <g:if test="${product?.product?.id == prd?.id}">selected</g:if> value="${prd?.id}">${prd?.name}</option>
                    </g:if>
                </g:each>
            </select>
        </div>

        <div class="form-group">
            <label>Description:</label>
            <textarea name="description" class="form-control">${product?.description}</textarea>
        </div>

        <div class="form-group">
            <label>Count:</label>
            <input required min="1" max="10000000" name="numberOfProduct"
                   value="${String.valueOf(product?.numberOfProduct).replace(".0", "")}" type="number" step="1"
                   class="form-control"/>
        </div>
        <input type="hidden" name="quotationId" value="${params?.quotationId}"/>

        <div class="form-group">
            <button type="submit" class="btn btn-success pull-right">Save</button>
        </div>
    </g:form>
    </g:if><g:else>
    You have already added all products !
</g:else>
</div>