<%@ page import="br.ufes.inf.nemo.dwws.domains.Patient" %>

<div class="form-group">
    <label for="taxCode"  class="col-lg-5 control-label">
        <g:message code="patient.taxCode.label" default="Tax Code" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:textField name="taxCode" maxlength="11" required="" value="${patientInstance?.taxCode}"/>
    </div>
</div>

<div class="form-group">
    <label for="name" class="col-lg-5 control-label">
        <g:message code="patient.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:textField name="name" maxlength="40" required="" value="${patientInstance?.name}"/>
    </div>
</div>

<div class="form-group" >
    <label for="birthDate" class="col-lg-5 control-label">
        <g:message code="patient.birthDate.label" default="Birth Date" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-lg-7">
        <g:datePicker name="birthDate" precision="day"  value="${patientInstance?.birthDate}" />
    </div>
</div>